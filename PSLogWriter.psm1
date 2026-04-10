<#
.SYNOPSIS
    Simple cross-platform log file module for PowerShell

.DESCRIPTION
    PSLogWriter provides a simple object-oriented logging interface for PowerShell scripts.
    Supports writing to log files, the Windows Event Log, and Linux syslog. Log entries 
    are timestamped and severity-tagged. Logging to console and system logs can be 
    toggled independently via the LogToConsole and LogToSystem properties.

.PARAMETER ParameterName
    Description of parameter

.EXAMPLE
    Import-Module PSLogWriter
    $Log = New-Log
    $Log.AddInfo("This is info!")
    $Log.AddError("This is an error!")
    $Log.AddWarning("This is a warning!")
    $Log.AddCustomEntry("Bacon", "This is a bacon alert!")
    $Log.AddCustomEntry("Bacon", "This is a bacon alert!", "Green") 

.EXAMPLE
    Import-Module PSLogWriter
    $Log = New-Log -LogLocation "$PSScriptRoot\Logs\Log.txt"
    $Log.AddInfo("This is info!")

.EXAMPLE
    Import-Module PSLogWriter
    $Log = New-Log -LogLocation "$PSScriptRoot\Logs\Log.txt"

    try {
        Throw
    } catch {
        $Log.AddError($_) 
    }
    
.NOTES
    Created By        : Antony Bragg
    Creation Date     : 28/10/2024
    Last Updated By   : Antony Bragg
    Last Updated      : 10/04/2026
    Script Version    : 2.0.0
    Template Version  : 3.0.0

.LINK
    GitHub Repository : https://github.com/captainqwerty/PSLogWriter
    Documentation     : https://github.com/captainqwerty/PSLogWriter/blob/main/README.md
    Change Log        : https://github.com/captainqwerty/PSLogWriter/blob/main/CHANGELOG.MD
#>

#Requires -Version 5.0

#Requires -Version 5.0

class Log {
    hidden [string]$LogLocation
    [string]$DateFormat
    [bool]$LogToSystem = $false
    [bool]$LogToConsole = $true

    AddError([string]$Message) {
        $this.AddEntry($Message, "Error", "Red")
    }

    AddWarning([string]$Message) {
        $this.AddEntry($Message, "Warning", "Yellow")
    }

    AddInfo([string]$Message) {
        $this.AddEntry($Message, "Info", "White")
    }

    AddCustomEntry([string]$Type, [string]$Message, [string]$Colour = "White") {
        $this.AddEntry($Message, $Type, $Colour)
    }

    CreateLog([string]$LogLocation) {
        $this.LogLocation = $LogLocation

        if (-not ($this.ValidateLogFile($this.LogLocation))) {
            throw "Invalid log file extension. Please use .log or .txt"
        }

        # Ensure directory exists
        $dir = Split-Path $LogLocation
        if ($dir -and !(Test-Path $dir)) {
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
        }
    }

    hidden [bool]ValidateLogFile([string]$LogFile) {
        $extension = [System.IO.Path]::GetExtension($LogFile)
        return ($extension -eq ".log" -or $extension -eq ".txt")
    }

    hidden AddEntry([string]$Message, [string]$Severity, [string]$Colour) {

        if (!(Test-Path $this.LogLocation)) {
            New-Item $this.LogLocation -Force | Out-Null
        }

        if ($null -eq $this.DateFormat) {
            $date = Get-Date
            $timeStamp = $date.ToShortDateString() + " " + $date.ToLongTimeString()
        }
        else {
            $timeStamp = Get-Date -Format $this.DateFormat
        }

        $output = "$timeStamp - [$Severity] $Message"

        # File logging with error handling
        try {
            Add-Content $this.LogLocation -Value $output -Encoding UTF8 -ErrorAction Stop
        }
        catch {
            Write-Warning "Failed to write to log file: $_"
        }

        if ($this.LogToSystem) {

            $eventType = switch ($Severity) {
                "Error" { "Error" }
                "Warning" { "Warning" }
                "Info" { "Information" }
                default { "Information" }
            }

            if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)) {
                try {
                    if (-not [System.Diagnostics.EventLog]::SourceExists("PSLogWriter")) {
                        New-EventLog -LogName Application -Source "PSLogWriter"
                    }

                    Write-EventLog -LogName Application -Source "PSLogWriter" -EntryType $eventType -EventId 1 -Message $output
                }
                catch {
                    Write-Warning "Failed to write to Windows Event Log: $_"
                }
            }

            if ([System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux)) {
                $priority = switch ($Severity.ToLower()) {
                    "emerg"   { "emerg" }
                    "alert"   { "alert" }
                    "crit"    { "crit" }
                    "error"   { "err" }
                    "warning" { "warning" }
                    "notice"  { "notice" }
                    "info"    { "info" }
                    "debug"   { "debug" }
                    default   { "notice" }
                }

                try {
                    & logger --priority "user.$priority" --tag "PSLogWriter" $Message

                    if ($LASTEXITCODE -ne 0) {
                        Write-Warning "logger exited with code $LASTEXITCODE for message: $Message"
                    }
                }
                catch {
                    Write-Warning "Failed to write to syslog: $_"
                }
            }
        }

        if ($this.LogToConsole) {
            Write-Host $output -ForegroundColor $Colour
        }
    }
}

Function New-Log {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]$LogLocation = ".\log.log"
    )

    $Log = [Log]::New()
    $Log.CreateLog($LogLocation)

    return $Log
}

Export-ModuleMember -Function New-Log