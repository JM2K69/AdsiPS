function Move-ADSIComputer
{
<#
.SYNOPSIS
    Function to Move a Computer in Active Directory

.DESCRIPTION
    Function to Move a Computer in Active Directory

.PARAMETER Identity
    Specifies the Identity of the computer

    You can provide one of the following:
        DistinguishedName
        Guid
        Name
        SamAccountName
        Sid

    System.DirectoryService.AccountManagement.IdentityType
    https://msdn.microsoft.com/en-us/library/bb356425(v=vs.110).aspx

.PARAMETER Credential
    Specifies alternative credential
    By default it will use the current user windows credentials.

.PARAMETER DomainName
    Specifies the alternative Domain.
    By default it will use the current domain.

.PARAMETER Destination
    Specifies the Distinguished Name where the object will be moved

.EXAMPLE
    Move-ADSIComputer -identity 'TESTCOMP01' -Destination 'OU=Servers,DC=FX,DC=LAB'

.NOTES
    https://github.com/lazywinadmin/ADSIPS

.LINK
    https://msdn.microsoft.com/en-us/library/system.directoryservices.accountmanagement.computerprincipal(v=vs.110).aspx
#>
    [CmdletBinding()]
    param ([Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        $Identity,

        [Alias("RunAs")]
        [System.Management.Automation.PSCredential]
        [System.Management.Automation.Credential()]
        $Credential = [System.Management.Automation.PSCredential]::Empty,

        $DomainName,

        $Destination
    )
    begin
    {
        Add-Type -AssemblyName System.DirectoryServices.AccountManagement

        # Create Context splatting
        $ContextSplatting = @{ ContextType = "Domain" }

        if ($PSBoundParameters['Credential'])
        {
            $ContextSplatting.Credential = $Credential
        }
        if ($PSBoundParameters['DomainName'])
        {
            $ContextSplatting.DomainName = $DomainName
        }

        $Context = New-ADSIPrincipalContext @ContextSplatting

    }
    process
    {
        try
        {
            if($Identity.GetType().FullName -eq 'System.String'){
                $Computer = [System.DirectoryServices.AccountManagement.ComputerPrincipal]::FindByIdentity($Context, $Identity)
            } else {
                $Computer = $Identity
            }

            # Retrieve DirectoryEntry
            #$Computer.GetUnderlyingObject()

            # Create DirectoryEntry object
            $NewDirectoryEntry = New-Object -TypeName System.DirectoryServices.DirectoryEntry -ArgumentList "LDAP://$Destination"

            # Move the computer
            $Computer.GetUnderlyingObject().psbase.moveto($NewDirectoryEntry)
            $Computer.Save()
        }
        catch
        {
            $pscmdlet.ThrowTerminatingError($_)
        }
    }
}
