<#
.SYNOPSIS
    Module allows for simple log file creation

.DESCRIPTION
    Detailed description of your module's functionality

.NOTES
    Name: PSLogWriter
    Author: Antony Bragg
    Version: 1.1.0
    LastUpdated: 2024-10-28
    Requirements: PowerShell 5.0+

.LINK
    Project Repository: https://github.com/captainqwerty/PSLogWriter

.EXAMPLE
    Import-Module PSLogWriter
    $Log = New-Log
    $Log.AddInfo("This is info!")
    $Log.AddError("This is an error!")
    $Log.AddWarning("This is a warning!")
    $Log.AddCustomEntry("Bacon","This is a bacon alert!")
    $Log.AddCustomEntry("Bacon","Green","This is a bacon alert!")

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
#>

#Requires -Version 5.0

class Log {
    hidden [string]$LogLocation
    [string]$DateFormat

    AddError([string]$Message) {
        $this.AddEntry($message,"Error","Red")
    }

    AddWarning([string]$Message) {
        $this.AddEntry($message,"Warning","Yellow")
    }

    AddInfo([string]$Message) {
        $this.AddEntry($message,"Info","White")
    }

    AddCustomEntry([string]$type,[string]$Message) {
        $this.AddEntry($message,$type,"White")
    }

    AddCustomEntry([string]$type,[string]$Colour,[string]$Message) {
        $this.AddEntry($message,$type,$colour)
    }

    CreateLog([string]$LogLocation) {
        $this.LogLocation = $LogLocation
        if(!($this.ValidateLogFile($this.LogLocation))) { throw "Invalid log file extension. Please use .log or .txt" }
    }

    hidden [bool]ValidateLogFile([string]$logFIle) {
        $extension = [System.IO.Path]::GetExtension($logFIle)
        if(($extension -eq ".log") -or ($extension -eq ".txt")) {
            return $true
        } else {
            return $false
        }
    }

    hidden AddEntry([string]$Message,[string]$severity,[string]$colour = "White") {
        if(!(test-path $this.LogLocation)) {
            new-item $this.LogLocation -Force
        }

        if($null -eq $this.DateFormat) {
            [DateTime]$Date = Get-Date
            $timeStamp = $date.ToShortDateString() + " " + $date.ToLongTimeString()
        } else {
            $timeStamp = Get-date -Format $this.DateFormat
        }
        
        $Output = "$timeStamp - [$($severity)] $($Message)"
        Add-Content $this.logLocation -value $Output

        Write-Host "$Output" -ForegroundColor $Colour
    }
}

Function New-Log {
<#
.SYNOPSIS
    Returns a Log object

.DESCRIPTION
    This function returns a log object which can be used to execute log entries against

.PARAMETER LogLocation
    The location of the log file to create or append to. This should be a .log or .txt file.
    If no log location is specified the location of the script being executed will be used.

.EXAMPLE
    $Log = New-Log
    $Log.AddInfo("This is info!")
    $Log.AddError("This is an error!")
    $Log.AddWarning("This is a warning!")
    $Log.AddCustomEntry("Bacon","This is a bacon alert!")
    $Log.AddCustomEntry("Bacon","Green","This is a bacon alert!")

.EXAMPLE
    $Log = New-Log -LogLocation "$PSScriptRoot\Logs\Log.txt"
    $Log.AddInfo("This is info!")

.EXAMPLE
    $Log = New-Log -LogLocation "$PSScriptRoot\Logs\Log.txt"
    
    try {
        Throw
    } catch {
        $Log.AddError($_) 
    }

.INPUTS
    String

.OUTPUTS
    Log

.LINK
    Project Repository: https://github.com/captainqwerty/PSLogWriter

.NOTES
    Author:  Antony Bragg
#>
    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $LogLocation = ".\log.log"
    )

    $Log = [Log]::New()
    $Log.CreateLog($LogLocation)

    return $Log
}

Export-ModuleMember -Function New-Log