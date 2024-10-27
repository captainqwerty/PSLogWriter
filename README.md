
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
1. Download the <a href="https://github.com/captainqwerty/PSLogWriter/releases">latest release</a>.
2. Place the PSLogWriter folder into your modules folder
3. See the Usage section for examples on how to use the module

<p align="right">(<a href="#top">Back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage
```ps1
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
* [matthewjdegarmo](https://github.com/matthewjdegarmo) - Excellent suggestion on moving from ValidationSet in the module version and improvements / corrections to the ReadMe
* [SeidChr](https://github.com/SeidChr) - For prompting the addition of .txt
* [sean2390](https://github.com/sean2390) - Further spelling and grammar corrections in the ReadMe.

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