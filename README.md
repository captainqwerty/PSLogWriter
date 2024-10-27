
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

This project was to just offer people a easy way to quickly add the ability to output a nice, simple log within their own projects. The module can output a log file of a .txt or .log format and utilises three log entry types: Information, Warning and Error.

### Features

 * Information, warning and error logging
 * Customisable date format

<p align="right">(<a href="#top">Back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites
* PowerShell version 5.0 or greater

### Installation

## Option A: User-Specific Installation
1. Download the `Source.zip` from the <a href="https://github.com/captainqwerty/PSLogWriter/releases">latest release</a>
2. Extract the zipped folder
3. Locate your user module path:

```PowerShell
# This command will list the usable folders
$env:PSModulePath -split ';'
```
4. Copy the `PSLogWriter` folder to your preferred module folder
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
Import-Module PSLogWriter

$Log = New-Log -LogLocation "$PSScriptLog\Log.log"

$Log.AddInfo("This message is informational")
$Log.AddError("Oh no. Something went wrong!")
$Log.AddWarning("Calm yourself, this is a warning")

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