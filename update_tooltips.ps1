$dir = "C:\Users\Y\Google Drive\mon-site-YH\pays"

# ── COUNTRY_INFO : single-quoted here-string => JS single quotes preserved literally
$ci = @'
var COUNTRY_INFO={'Germany':{cap:'Berlin',pop:'84 M hab.'},'France':{cap:'Paris',pop:'68 M hab.'},'Poland':{cap:'Varsovie',pop:'38 M hab.'},'Italy':{cap:'Rome',pop:'59 M hab.'},'Spain':{cap:'Madrid',pop:'47 M hab.'},'Portugal':{cap:'Lisbonne',pop:'10 M hab.'},'Netherlands':{cap:'Amsterdam',pop:'17 M hab.'},'Belgium':{cap:'Bruxelles',pop:'11 M hab.'},'Luxembourg':{cap:'Luxembourg',pop:'660 000 hab.'},'Switzerland':{cap:'Berne',pop:'8,7 M hab.'},'Austria':{cap:'Vienne',pop:'9 M hab.'},'Czech Republic':{cap:'Prague',pop:'10,9 M hab.'},'Czechia':{cap:'Prague',pop:'10,9 M hab.'},'Slovakia':{cap:'Bratislava',pop:'5,5 M hab.'},'Hungary':{cap:'Budapest',pop:'9,7 M hab.'},'Romania':{cap:'Bucarest',pop:'19 M hab.'},'Bulgaria':{cap:'Sofia',pop:'6,5 M hab.'},'Croatia':{cap:'Zagreb',pop:'3,9 M hab.'},'Slovenia':{cap:'Ljubljana',pop:'2,1 M hab.'},'Serbia':{cap:'Belgrade',pop:'6,8 M hab.'},'Republic of Serbia':{cap:'Belgrade',pop:'6,8 M hab.'},'Bosnia and Herzegovina':{cap:'Sarajevo',pop:'3,3 M hab.'},'Montenegro':{cap:'Podgorica',pop:'620 000 hab.'},'Albania':{cap:'Tirana',pop:'2,8 M hab.'},'North Macedonia':{cap:'Skopje',pop:'1,8 M hab.'},'Republic of North Macedonia':{cap:'Skopje',pop:'1,8 M hab.'},'Greece':{cap:'Athenes',pop:'10,4 M hab.'},'Turkey':{cap:'Ankara',pop:'85 M hab.'},'Ukraine':{cap:'Kyiv',pop:'43 M hab.'},'Moldova':{cap:'Chisinau',pop:'2,6 M hab.'},'Republic of Moldova':{cap:'Chisinau',pop:'2,6 M hab.'},'Belarus':{cap:'Minsk',pop:'9,4 M hab.'},'Lithuania':{cap:'Vilnius',pop:'2,8 M hab.'},'Latvia':{cap:'Riga',pop:'1,8 M hab.'},'Estonia':{cap:'Tallinn',pop:'1,4 M hab.'},'Finland':{cap:'Helsinki',pop:'5,6 M hab.'},'Sweden':{cap:'Stockholm',pop:'10,5 M hab.'},'Norway':{cap:'Oslo',pop:'5,5 M hab.'},'Denmark':{cap:'Copenhague',pop:'5,9 M hab.'},'Iceland':{cap:'Reykjavik',pop:'370 000 hab.'},'Ireland':{cap:'Dublin',pop:'5,1 M hab.'},'United Kingdom':{cap:'Londres',pop:'67 M hab.'},'Russia':{cap:'Moscou',pop:'144 M hab.'},'Kosovo':{cap:'Pristina',pop:'1,8 M hab.'},'Republic of Kosovo':{cap:'Pristina',pop:'1,8 M hab.'},'Andorra':{cap:'Andorre-la-Vieille',pop:'77 000 hab.'},'Monaco':{cap:'Monaco',pop:'36 000 hab.'},'Liechtenstein':{cap:'Vaduz',pop:'38 000 hab.'},'San Marino':{cap:'Saint-Marin',pop:'34 000 hab.'},'Vatican City':{cap:'Vatican',pop:'800 hab.'},'Malta':{cap:'La Valette',pop:'530 000 hab.'},'Cyprus':{cap:'Nicosie',pop:'1,2 M hab.'}};
'@

# ── Anchor for insertion
$anchor = "function buildPoliticalLayer"

# ── CSS : add small rule after ::before{display:none;}
$cssCur = "    .country-tooltip::before{display:none;}"
$cssNew = "    .country-tooltip::before{display:none;}`n    .country-tooltip small{display:block;font-weight:400;font-size:.78rem;opacity:.82;}"

# ── 4 variants of the old bindTooltip line
$old_n_center = "layer.bindTooltip(FR_NAMES[_n]||_n,{permanent:false,direction:'center',className:'country-tooltip'});"
$old_n_auto   = "layer.bindTooltip(FR_NAMES[_n]||_n,{permanent:false,direction:'auto',sticky:true,className:'country-tooltip'});"
$old_nm_sp    = "layer.bindTooltip(FR_NAMES[name]||name, {permanent:false, direction:'center', className:'country-tooltip'});"
$old_nm       = "layer.bindTooltip(FR_NAMES[name]||name,{permanent:false,direction:'center',className:'country-tooltip'});"

# ── New bindTooltip lines
$new_n  = "var _ci=COUNTRY_INFO[_n];var _tt=(FR_NAMES[_n]||_n)+(_ci?'<br><small>'+_ci.cap+' \u00b7 '+_ci.pop+'</small>':'');layer.bindTooltip(_tt,{permanent:false,direction:'auto',sticky:true,className:'country-tooltip'});"
$new_nm = "var _ci=COUNTRY_INFO[name];var _tt=(FR_NAMES[name]||name)+(_ci?'<br><small>'+_ci.cap+' \u00b7 '+_ci.pop+'</small>':'');layer.bindTooltip(_tt,{permanent:false,direction:'auto',sticky:true,className:'country-tooltip'});"

$files = Get-ChildItem "$dir\*.html"
$count = 0
foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    if ($content.Contains('COUNTRY_INFO')) { Write-Host "Skip (deja fait): $($f.Name)"; continue }

    # 1. Insert COUNTRY_INFO before function buildPoliticalLayer
    $content = $content.Replace($anchor, $ci + $anchor)

    # 2. Add CSS small rule
    $content = $content.Replace($cssCur, $cssNew)

    # 3. Replace bindTooltip (all 4 variants)
    $content = $content.Replace($old_n_center, $new_n)
    $content = $content.Replace($old_n_auto,   $new_n)
    $content = $content.Replace($old_nm_sp,    $new_nm)
    $content = $content.Replace($old_nm,       $new_nm)

    [System.IO.File]::WriteAllText($f.FullName, $content, [System.Text.Encoding]::UTF8)
    Write-Host "OK: $($f.Name)"
    $count++
}
Write-Host "`n$count fichiers modifies."
