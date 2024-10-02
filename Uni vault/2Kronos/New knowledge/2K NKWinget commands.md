- The **WinGet** command line tool enables users to discover, install, upgrade, remove and configure applications on Windows 10 and Windows 11 computers. This tool is the client interface to the Windows Package Manager service.

The following commands are available:
  - install    Installs the given package
  - show       Shows information about a package
  - source     Manage sources of packages
  - search     Find and show basic info of packages
  - list       Display installed packages
  - upgrade    Shows and performs available upgrades
  - uninstall  Uninstalls the given package
  - hash       Helper to hash installer files
  - validate   Validates a manifest file
  - settings   Open settings or set administrator settings
  - features   Shows the status of experimental features
  - export     Exports a list of the installed packages
  - import     Installs all the packages in a file
  - pin        Manage package pins
  - configure  Configures the system into a desired state
  - download   Downloads the installer from a given package
  - repair     Repairs the selected package

## Use cases 

1. To [search](https://learn.microsoft.com/en-us/windows/package-manager/winget/search) for a tool, type `winget search <appname>`.
	
2. After you have confirmed that the tool you want is available, you can [install](https://learn.microsoft.com/en-us/windows/package-manager/winget/install) the tool by typing `winget install <appname>`. The **WinGet** tool will launch the installer and install the application on your PC.
	 
3. In addition to install and search, **WinGet** provides a number of other commands that enable you to [show details](https://learn.microsoft.com/en-us/windows/package-manager/winget/show) on applications, [change sources](https://learn.microsoft.com/en-us/windows/package-manager/winget/source), and [validate packages](https://learn.microsoft.com/en-us/windows/package-manager/winget/validate). To get a complete list of commands, type: `winget --help`.