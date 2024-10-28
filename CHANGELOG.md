
# Change Log
All notable changes to this project will be documented in this file.
 
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project will attempt to adheres to [Semantic Versioning](http://semver.org/).

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