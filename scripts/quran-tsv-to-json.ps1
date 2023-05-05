param (
    [Parameter(Mandatory=$true)]
        [String]$quran_dot_tsv
)

$Quran = [ordered]@{}

foreach (
    $line in (Get-Content $quran_dot_tsv | Foreach-Object {
        $_ -Replace '#.*$'
    } | Where-Object { $_.Trim().Length -ne 0 })
) {
    $surah = $line.split("`t")[0]
    $ayat  = $line.split("`t")[1]
    $text  = $line.split("`t")[2]
    $surah = [int]$surah
    $ayat  = [int]$ayat
    if (-not $Quran[$surah]) {
        $Quran[$surah] = [ordered]@{}
    }
    $Quran[$surah][$ayat] = $text
}

return (ConvertTo-Json $Quran)
