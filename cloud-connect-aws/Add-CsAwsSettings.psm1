function Add-CsAwsSettings {
<#
    .SYNOPSIS
        Create or update Global Settings which are applied to all provisioned AWS accounts

    .PARAMETER RESOURCES
        An array of AWS settings
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Resources
    )
    process{
        $Param = @{
            Uri = '/cloud-connect-aws/entities/settings/v1'
            Method = 'post'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
            Body = @{ resources = $Resources } | ConvertTo-Json -Depth 16
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-FalconAPI @Param
    }
}