param (
    [int[]]$surah,
    [int[]]$ayat,
    [string]$qfile = '~\code\quran-dot-html\data\quran.json'
)
function idx {
    param($Q)
    $Q | Get-Member | Foreach-Object {
        if ($_.MemberType -eq 'NoteProperty') {
            [int]($_.Name)
        }
    } | Sort-Object
}
$Quran = Get-Content $qfile | ConvertFrom-Json
if (!$surah) {
    $surah = idx $Quran
}
if (!$ayat) {
    $all_ayat = $true
}
Write-Output "Quran"
foreach($s in $surah){
    if ($all_ayat) {
        $ayat = idx $Quran.$s
    }
    foreach($a in $ayat){
        $w = ($Quran.$s).$a
        if($w) { Write-Output "`t$s`:$a`t$w" }
    }
}
