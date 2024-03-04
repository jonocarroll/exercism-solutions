Function Get-Acronym() {
    <#
    .SYNOPSIS
    Get the acronym of a phrase.

    .DESCRIPTION
    Given a phrase, return the string acronym of that phrase.
    "As Soon As Possible" => "ASAP"
    
    .PARAMETER Phrase
    The phrase to get the acronym from.
    
    .EXAMPLE
    Get-Acronym -Phrase "As Soon As Possible"
    #>
    [CmdletBinding()]
    Param (
        [string]$Phrase
    )
    $res = ""
    $Words = $Phrase.Replace("-", " ").Replace("_", " ").Split(" ")
    foreach ($word in $Words) {
        if ( $word -match '\S+') {
            $res = $res + $word.Substring(0, 1).ToUpper()
        }
    }
    Return $res
}