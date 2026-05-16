# Script : mise à jour des tooltips pays (2 lignes, 2 colonnes)
$dir = "C:\Users\Y\Google Drive\mon-site-YH\pays"

# ── Nouveau CSS ────────────────────────────────────────────────────────────────
$newCss = "    .country-tooltip{background:rgba(8,14,35,.95);border:1.5px solid rgba(255,196,0,.65);border-radius:6px;color:#fff;font-family:'Cormorant Garamond',Georgia,serif;padding:8px 13px;box-shadow:0 4px 14px rgba(0,0,0,.6);white-space:nowrap;min-width:190px;}
    .country-tooltip::before{display:none;}
    .country-tooltip .tt-row{display:flex;justify-content:space-between;align-items:baseline;gap:18px;}
    .country-tooltip .tt-name{font-weight:700;font-size:.92rem;color:#fff;letter-spacing:.06em;}
    .country-tooltip .tt-pop{font-weight:600;font-size:.80rem;color:#ffc400;}
    .country-tooltip .tt-cap{font-weight:400;font-size:.80rem;color:#a8c4e0;}
    .country-tooltip .tt-popcap{font-weight:400;font-size:.80rem;color:#a8c4e0;}"

# ── Nouveau COUNTRY_INFO (avec popCap) ────────────────────────────────────────
$newCI = "var COUNTRY_INFO={'Germany':{cap:'Berlin',pop:'84 M hab.',popCap:'3,7 M hab.'},'France':{cap:'Paris',pop:'68 M hab.',popCap:'2,1 M hab.'},'Poland':{cap:'Varsovie',pop:'38 M hab.',popCap:'1,8 M hab.'},'Italy':{cap:'Rome',pop:'59 M hab.',popCap:'2,8 M hab.'},'Spain':{cap:'Madrid',pop:'47 M hab.',popCap:'3,3 M hab.'},'Portugal':{cap:'Lisbonne',pop:'10 M hab.',popCap:'505 000 hab.'},'Netherlands':{cap:'Amsterdam',pop:'17 M hab.',popCap:'930 000 hab.'},'Belgium':{cap:'Bruxelles',pop:'11 M hab.',popCap:'1,2 M hab.'},'Luxembourg':{cap:'Luxembourg',pop:'660 000 hab.',popCap:'128 000 hab.'},'Switzerland':{cap:'Berne',pop:'8,7 M hab.',popCap:'134 000 hab.'},'Austria':{cap:'Vienne',pop:'9 M hab.',popCap:'1,9 M hab.'},'Czech Republic':{cap:'Prague',pop:'10,9 M hab.',popCap:'1,3 M hab.'},'Czechia':{cap:'Prague',pop:'10,9 M hab.',popCap:'1,3 M hab.'},'Slovakia':{cap:'Bratislava',pop:'5,5 M hab.',popCap:'480 000 hab.'},'Hungary':{cap:'Budapest',pop:'9,7 M hab.',popCap:'1,7 M hab.'},'Romania':{cap:'Bucarest',pop:'19 M hab.',popCap:'1,8 M hab.'},'Bulgaria':{cap:'Sofia',pop:'6,5 M hab.',popCap:'1,2 M hab.'},'Croatia':{cap:'Zagreb',pop:'3,9 M hab.',popCap:'810 000 hab.'},'Slovenia':{cap:'Ljubljana',pop:'2,1 M hab.',popCap:'295 000 hab.'},'Serbia':{cap:'Belgrade',pop:'6,8 M hab.',popCap:'1,7 M hab.'},'Republic of Serbia':{cap:'Belgrade',pop:'6,8 M hab.',popCap:'1,7 M hab.'},'Bosnia and Herzegovina':{cap:'Sarajevo',pop:'3,3 M hab.',popCap:'275 000 hab.'},'Montenegro':{cap:'Podgorica',pop:'620 000 hab.',popCap:'157 000 hab.'},'Albania':{cap:'Tirana',pop:'2,8 M hab.',popCap:'900 000 hab.'},'North Macedonia':{cap:'Skopje',pop:'1,8 M hab.',popCap:'540 000 hab.'},'Republic of North Macedonia':{cap:'Skopje',pop:'1,8 M hab.',popCap:'540 000 hab.'},'Greece':{cap:'Ath\u00e8nes',pop:'10,4 M hab.',popCap:'660 000 hab.'},'Turkey':{cap:'Ankara',pop:'85 M hab.',popCap:'5,6 M hab.'},'Ukraine':{cap:'Kyiv',pop:'43 M hab.',popCap:'2,9 M hab.'},'Moldova':{cap:'Chisinau',pop:'2,6 M hab.',popCap:'490 000 hab.'},'Republic of Moldova':{cap:'Chisinau',pop:'2,6 M hab.',popCap:'490 000 hab.'},'Belarus':{cap:'Minsk',pop:'9,4 M hab.',popCap:'1,9 M hab.'},'Lithuania':{cap:'Vilnius',pop:'2,8 M hab.',popCap:'580 000 hab.'},'Latvia':{cap:'Riga',pop:'1,8 M hab.',popCap:'600 000 hab.'},'Estonia':{cap:'Tallinn',pop:'1,4 M hab.',popCap:'455 000 hab.'},'Finland':{cap:'Helsinki',pop:'5,6 M hab.',popCap:'660 000 hab.'},'Sweden':{cap:'Stockholm',pop:'10,5 M hab.',popCap:'975 000 hab.'},'Norway':{cap:'Oslo',pop:'5,5 M hab.',popCap:'700 000 hab.'},'Denmark':{cap:'Copenhague',pop:'5,9 M hab.',popCap:'794 000 hab.'},'Iceland':{cap:'Reykjavik',pop:'370 000 hab.',popCap:'135 000 hab.'},'Ireland':{cap:'Dublin',pop:'5,1 M hab.',popCap:'1,2 M hab.'},'United Kingdom':{cap:'Londres',pop:'67 M hab.',popCap:'9,0 M hab.'},'Russia':{cap:'Moscou',pop:'144 M hab.',popCap:'12,5 M hab.'},'Kosovo':{cap:'Pristina',pop:'1,8 M hab.',popCap:'210 000 hab.'},'Republic of Kosovo':{cap:'Pristina',pop:'1,8 M hab.',popCap:'210 000 hab.'},'Andorra':{cap:'Andorre-la-Vieille',pop:'77 000 hab.',popCap:'22 000 hab.'},'Monaco':{cap:'Monaco',pop:'36 000 hab.',popCap:'36 000 hab.'},'Liechtenstein':{cap:'Vaduz',pop:'38 000 hab.',popCap:'5 500 hab.'},'San Marino':{cap:'Saint-Marin',pop:'34 000 hab.',popCap:'4 500 hab.'},'Vatican City':{cap:'Vatican',pop:'800 hab.',popCap:'800 hab.'},'Malta':{cap:'La Valette',pop:'530 000 hab.',popCap:'6 000 hab.'},'Cyprus':{cap:'Nicosie',pop:'1,2 M hab.',popCap:'310 000 hab.'}};"

# ── Nouveau HTML tooltip — pattern B (variable _n) ────────────────────────────
$oldTT_B = "var _n=feature.properties.ADMIN||feature.properties.name||'';var _ci=COUNTRY_INFO[_n];var _tt=(FR_NAMES[_n]||_n)+(_ci?'<br><small>'+_ci.cap+' \u00b7 '+_ci.pop+'</small>':'');layer.bindTooltip(_tt,{permanent:false,direction:'auto',sticky:true,className:'country-tooltip'});"
$newTT_B = "var _n=feature.properties.ADMIN||feature.properties.name||'';var _ci=COUNTRY_INFO[_n];var _fr=FR_NAMES[_n]||_n;var _tt='<div class=""tt-row""><span class=""tt-name"">'+_fr+'</span><span class=""tt-pop"">'+(_ci?_ci.pop:'')+'</span></div>'+(_ci?'<div class=""tt-row""><span class=""tt-cap"">'+_ci.cap+'</span><span class=""tt-popcap"">'+_ci.popCap+'</span></div>':'');layer.bindTooltip(_tt,{permanent:false,direction:'auto',sticky:true,className:'country-tooltip'});"

# ── Nouveau HTML tooltip — pattern A (variable name) ──────────────────────────
$oldTT_A = "var _ci=COUNTRY_INFO[name];var _tt=(FR_NAMES[name]||name)+(_ci?'<br><small>'+_ci.cap+' \u00b7 '+_ci.pop+'</small>':'');layer.bindTooltip(_tt,{permanent:false,direction:'auto',sticky:true,className:'country-tooltip'});"
$newTT_A = "var _ci=COUNTRY_INFO[name];var _fr=FR_NAMES[name]||name;var _tt='<div class=""tt-row""><span class=""tt-name"">'+_fr+'</span><span class=""tt-pop"">'+(_ci?_ci.pop:'')+'</span></div>'+(_ci?'<div class=""tt-row""><span class=""tt-cap"">'+_ci.cap+'</span><span class=""tt-popcap"">'+_ci.popCap+'</span></div>':'');layer.bindTooltip(_tt,{permanent:false,direction:'auto',sticky:true,className:'country-tooltip'});"

# ── Traitement de chaque fichier ───────────────────────────────────────────────
Get-ChildItem "$dir\*.html" | ForEach-Object {
    $file = $_.FullName
    $c = Get-Content $file -Raw -Encoding UTF8
    $orig = $c

    # 1) CSS : remplacer le bloc .country-tooltip (1 ou plusieurs lignes) + ::before + small
    #    Regex multiline pour couvrir tous les variants
    $cssRegex = '(?s)\.country-tooltip\{[^}]+\}(\s*\n\s*\.country-tooltip::before\{[^}]+\})?(\s*\n\s*\.country-tooltip small\{[^}]+\})?'
    $c = [regex]::Replace($c, $cssRegex, $newCss)

    # 2) COUNTRY_INFO
    $ciRegex = "(?s)var COUNTRY_INFO=\{.*?\};"
    $c = [regex]::Replace($c, $ciRegex, $newCI)

    # 3) Tooltip JS — pattern B
    if ($c.Contains($oldTT_B)) {
        $c = $c.Replace($oldTT_B, $newTT_B)
    }
    # 4) Tooltip JS — pattern A
    if ($c.Contains($oldTT_A)) {
        $c = $c.Replace($oldTT_A, $newTT_A)
    }

    if ($c -ne $orig) {
        Set-Content $file $c -Encoding UTF8 -NoNewline
        Write-Host "OK : $($_.Name)"
    } else {
        Write-Host "AUCUN CHANGEMENT : $($_.Name)"
    }
}
Write-Host "Terminé."
