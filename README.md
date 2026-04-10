
<div id="top"></div>

<div align="center">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<h1><b>PSLogWriter</b></h1>
  <p>
    A simple project to easily add a log to your scripts
    <br />
    <a href="https://github.com/captainqwerty/PSLogWriter/releases">Releases</a> -
    <a href="https://github.com/captainqwerty/PSLogWriter/issues">Report Bug</a> -
    <a href="https://github.com/CaptainQwerty/PSLogWriter/blob/main/CHANGELOG.md">Change Log</a>
  </p>
</div>

<!-- ABOUT THE PROJECT -->
## About The Project

PSLogWriter is a simple cross-platform log file module for PowerShell that provides an easy way to add logging capabilities to your scripts. The module supports writing to log files (.txt or .log), the Windows Event Log, and Linux syslog. It offers three standard log entry types (Information, Warning, and Error) plus custom entry types with optional color coding. Logging to console, system logs, and files can be toggled independently.

### Features

 * Information, warning and error logging
 * Custom log entry types with optional color coding
 * Cross-platform support (Windows Event Log and Linux syslog)
 * Console logging with color output
 * Customizable date format
 * Independent toggles for logging to file, system, and console

<p align="right">(<a href="#top">Back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites
* PowerShell version 5.0 or greater

### Installation

## Manual Installation
1. Download the `Source.zip` from the <a href="https://github.com/captainqwerty/PSLogWriter/releases">latest release</a>
2. Extract the zipped folder
3. Locate your user module path:

```PowerShell
# This command will list the usable folders
$env:PSModulePath -split ';'
```
4. Copy the `PSLogWriter` folder from within the extracted folder, to your preferred module folder
5. Verify the installation

## Verification
```PowerShell
# Import the module
Import-Module PSLogWriter

# Check the module version
Get-Module PSLogWriter

# View available commands
Get-Command -Module PSLogWriter
```

<p align="right">(<a href="#top">Back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage
```PowerShell
# Importing the module
Import-Module PSLogWriter

# Creating a log object
$Log = New-Log -LogLocation ".\Log.log"

# Basic log entries
$Log.AddInfo("This message is informational") # Info entry
$Log.AddError("Oh no. Something went wrong!") # Error entry
$Log.AddWarning("Calm yourself, this is a warning") # Warning entry

# Custom entries
$Log.AddCustomEntry("BACON","This is a bacon alert!") # Custom entry
$Log.AddCustomEntry("BACON","This is a bacon alert!","Green") # Custom entry with custom color

# Configuring logging options
$Log.LogToSystem = $true  # Enable logging to system logs (Event Log on Windows, syslog on Linux)
$Log.LogToConsole = $false # Disable console output
$Log.DateFormat = "yyyy-MM-dd HH:mm:ss" # Custom date format

# Example with system logging enabled
$Log.AddInfo("This will log to file, system, and console (if enabled)")

# Error handling example
try {
    Throw "An error occurred"
} catch {
    $Log.AddError($_)
}

# Removing the module
Remove-Module PSLogWriter
```
<p align="right">(<a href="#top">Back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">Back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Othneildrew's Best-README-Template](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#top">Back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/captainqwerty/PSLogWriter.svg?style=for-the-badge
[contributors-url]: https://github.com/captainqwerty/PSLogWriter/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/captainqwerty/PSLogWriter.svg?style=for-the-badge
[forks-url]: https://github.com/captainqwerty/PSLogWriter/network/members
[stars-shield]: https://img.shields.io/github/stars/captainqwerty/PSLogWriter.svg?style=for-the-badge
[stars-url]: https://github.com/captainqwerty/PSLogWriter/stargazers
[issues-shield]: https://img.shields.io/github/issues/captainqwerty/PSLogWriter.svg?style=for-the-badge
[issues-url]: https://github.com/captainqwerty/PSLogWriter/issues
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/antonybragg/