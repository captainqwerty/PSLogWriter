@{

# Script module
RootModule = 'PSLogWriter.psm1'

# Versioning
ModuleVersion = '2.0.1'
GUID = 'fa7e4f23-5efb-424d-83cf-4025a2bc38e0'

# Author / Org
Author = 'Antony Bragg'
CompanyName = 'N/A'
Copyright = '(c) Antony Bragg. All rights reserved.'

# Description
Description = 'Simple cross-platform log file module for PowerShell supporting file, console, Event Log, and syslog outputs.'

# PowerShell compatibility
PowerShellVersion = '5.0'

# (Optional but recommended)
CompatiblePSEditions = @('Desktop', 'Core')

# Architecture (optional but future-safe)
ProcessorArchitecture = 'None'

# Exports
FunctionsToExport = @('New-Log')
CmdletsToExport   = @()
VariablesToExport = @()
AliasesToExport   = @()

# File list (good practice for packaging / publishing)
FileList = @(
    'PSLogWriter.psm1',
    'PSLogWriter.psd1'
)

# Private metadata
PrivateData = @{
    PSData = @{
        Tags = @(
            'Logging',
            'Log',
            'CrossPlatform',
            'Syslog',
            'EventLog'
        )

        LicenseUri   = 'https://github.com/captainqwerty/PSLogWriter/blob/main/LICENSE'
        ProjectUri   = 'https://github.com/captainqwerty/PSLogWriter'
        ReleaseNotes = 'https://github.com/captainqwerty/PSLogWriter/blob/main/CHANGELOG.md'

        # 👇 These matter if you ever publish to PSGallery
        RequireLicenseAcceptance = $false

        # Optional but nice polish
        IconUri = 'https://raw.githubusercontent.com/captainqwerty/PSLogWriter/main/icon.png'
    }
}
}