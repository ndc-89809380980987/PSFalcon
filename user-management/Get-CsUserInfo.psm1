function Get-CsUserInfo {
<#
    .SYNOPSIS
        Get info about user IDs

    .PARAMETER ID
        ID of one or more users
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri =  '/users/entities/users/v1?ids=' + ($Id -join '&ids=')
            Method = 'get'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}