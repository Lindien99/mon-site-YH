$dir = "C:\Users\Y\Google Drive\mon-site-YH\pays"

# ── Fonction openGoogle a inserer avant function openWiki
$openGoogleFn = "function openGoogle(title){var from=window.location.pathname.split('/').pop().replace('.html','');window.open('../Artefact/Google_Search.html?q='+encodeURIComponent(title)+'&from='+encodeURIComponent(from),'_blank');}
"

$files = Get-ChildItem "$dir\*.html"
$count = 0
foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)

    if ($content.Contains('function openGoogle(')) {
        Write-Host "Skip (deja fait): $($f.Name)"; continue
    }

    # 1. Ajouter openGoogle avant function openWiki
    $content = $content.Replace('function openWiki(', $openGoogleFn + 'function openWiki(')

    # 2. Remplacer onclick="openWiki('url','titre')" → onclick="openGoogle('titre')"
    $content = [regex]::Replace($content,
        'onclick="openWiki\(''[^'']*'',''([^'']*)''\)"',
        'onclick="openGoogle(''$1'')"')

    # 3. Remplacer le texte du bouton : Wikipédia → Google
    $content = $content.Replace('>Wikim&amp;#233;dia <svg', '>Google <svg')
    $content = $content.Replace(">Wikim&#233;dia <svg", '>Google <svg')
    $content = $content.Replace(">Wikip" + [char]0x00E9 + "dia <svg", '>Google <svg')

    [System.IO.File]::WriteAllText($f.FullName, $content, [System.Text.Encoding]::UTF8)
    Write-Host "OK: $($f.Name)"
    $count++
}
Write-Host "`n$count fichiers modifies."
