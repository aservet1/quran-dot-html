param (
    [Parameter(Mandatory=$true)]
        [String]$quran_dot_json
)

$Quran = Get-Content $quran_dot_json | ConvertFrom-Json
$Quran | Get-Member | Where-Object {
    $_.MemberType -ne 'Method' 
} | Foreach-Object { [int]($_.Name) } | Sort-Object | Foreach-Object {
    $surah = $_
    $Quran.$surah | Get-Member | Where-Object {
        $_.MemberType -ne 'Method' 
    } | Foreach-Object { [int]($_.Name) } | Sort-Object | Foreach-Object {
        $ayat = $_
        Write-Output "$surah`t$ayat`t$(($Quran.$surah).$ayat)"
    }
}
