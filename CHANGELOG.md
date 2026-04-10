
# Change Log
All notable changes to this project will be documented in this file.
 
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project will attempt to adheres to [Semantic Versioning](http://semver.org/).

## [2.0.1] - 2026-04-10
Minor fixes

### Added / Changed
 * Changed default date format to ISO 8601 (yyyy-MM-dd HH:mm:ss) for culture-independent log timestamps
 * Updated ReleaseNotes URI in manifest to use correct lowercase filename
 
### Fixed
 * Removed Parameter description from meta data as this was from the template and was blank
 * Put `$Message` in quotes for when logging to the event log for Linux

## [2.0.0] - 2026-04-10
The revamp!

### Added / Changed
 * **Added Cross-Platform System Logging**: New `[bool]$LogToSystem = $false` property enables writing to Windows Event Log (Windows) and Linux syslog (Linux) simultaneously with file logging
 * Added `[bool]$LogToConsole = $true` which can be set to $false for a more silent operation
 * Added ` | Out-Null` to the creation of the log file if it does not exist to make this less messy
 * Added `-Encoding UTF8` to the `Add-Content` when writing to the log file
 
### Fixed
 * [BREAKING CHANGE] `AddCustomEntry` property order changed for more clarity for the method with the colour overload
 * Corrected $logFIle to $logFile in the ValidateLogFile method parameter

## [1.1.0] - 2024-10-28
This release was used to add more functionality to the module as well as the missing PSD1 file.

### Added / Changed
 * Added the .psd1 file
 * Added default log location if `-LogLocation` is not specified
 * Added more examples to the module
 * Added `.AddCustomEntry($type,$message)` to add entries other than "Info","Error" or "Warning"
 * `.AddCustomEntry()` also supports a custom colour `.AddCustomEntry($type,$colour,$message)`
 * Added more examples to the `New-Log` function
 * Added default colours to Warning, Info and Error Write-Hosts
  
### Fixed
 * No New Fixes

## [1.0.0] - 2024-10-27
As this is the initial release of PSLogWriter this entry to the change log will not contain any adds, changes or fixes. 

### Added / Changed
 * No New additions

### Fixed
 * No New Fixes