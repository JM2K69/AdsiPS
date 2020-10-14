# AdsiPS

[![Build Status](https://dev.azure.com/lazywinadmin/AdsiPS/_apis/build/status/lazywinadmin.AdsiPS?branchName=master)](https://dev.azure.com/lazywinadmin/AdsiPS/_build/latest?definitionId=17&branchName=master)

AdsiPS is a PowerShell module to interact with Active Directory using the .NET Framework (ADSI, System.DirectoryServices namespace,...)

**Note: This module currently only works on Windows Operating Systems.**

## Usage

### Option A: Download from PowerShell Gallery

Only from PowerShell v5.1 (on Windows OS only)

``` powershell
Install-Module -name ADSIPS
```

### Option B: Manual download from GitHub

1. Download the repository
1. Unblock the zip file
1. Extract the folder to a module path (e.g. $home\Documents\WindowsPowerShell\Modules)
1. Run `build.ps1` (exists in project root).
   - **NOTE:** If you get an error after running `build.ps1` - please use **`build.ps1 -InstallDependencies`**
1. `build.ps1` creates a folder called `~\buildoutput\AdsiPs` in the directory which `AdsiPs` was saved to
1. Inside of `\buildoutput\AdsiPs` there is a file called `AdsiPs.psm1`
1. Run `Import-Module -Path "C:\Path\To\buildoutput\AdsiPs\AdsiPs.psm1"` to import the `AdsiPs` module

## Documentation

- [Functions](docs/doc_functions.md)
- [Contributing & TODO](https://github.com/lazywinadmin/adsips/blob/master/CONTRIBUTING.md)
- [Use cases](docs/doc_usecases.md)

## Thanks to all our Contributors!

* @LazyWinAdmin
* @MickyBalladelli
* @christophekumor
* @omiossec
* @oze4
* @andrewtchilds
* @NicolasBn
* @gerane
* @Skoetting
* @LaurentLienhard
* @JM2K69

## Resources

* MSDN is a great resource if you want to find more information on the NET classes to use. See [System.DirectoryServices](https://msdn.microsoft.com/en-us/library/system.directoryservices(v=vs.110).aspx)
* Interesting projects using different approaches to reach out to Active Directory in PowerShell/c#
  * [ADAudit by @darkoperator](https://github.com/darkoperator/ADAudit/tree/dev)
  * [ADSI on powershell.com by @TobiasPSP](http://powershell.com/cs/blogs/ebookv2/archive/2012/03/25/chapter-19-user-management.aspx) by Tobias Weltner
  * [ADRecon from @sense-of-security](https://github.com/sense-of-security/ADRecon)
  * [PowerView from @PowerShellMafia team](https://github.com/PowerShellMafia/PowerSploit/blob/master/Recon/PowerView.ps1)
  * [Invoke-Kerberoast from @EmpireProject team](https://github.com/EmpireProject/Empire/blob/master/data/module_source/credentials/Invoke-Kerberoast.ps1)
  * [PSAD by @zloeber](https://github.com/zloeber/PSAD)
  * [Test-ActiveDirectory by @markwragg](https://github.com/markwragg/Test-ActiveDirectory/blob/master/ADAudit/ActiveDirectory.tests.ps1)
  * [AdEnumerator(LDAP) by @chango77747](https://github.com/chango77747/AdEnumerator/blob/master/ADEnumerator.psm1)
  * [Grant-ADPermission by @edemilliere](https://github.com/edemilliere/ADSI/blob/master/Grant-ADPermission.ps1)
  * [ADSec by @FriedrichWeinmann](https://github.com/PSSecTools/ADSec)
