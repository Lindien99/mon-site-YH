#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
add_theme_toggle.py
Ajoute le bouton JOUR/NUIT à toutes les pages HTML du site.
"""

import os, pathlib, re

ROOT = pathlib.Path(r"C:\Users\Y\Google Drive\mon-site-YH")

# ─────────────────────────────────────────────────────────────────
# BLOCS COMMUNS
# ─────────────────────────────────────────────────────────────────

BUTTON_SEPIA = '''
<!-- ★ BOUTON BASCULE THÈME ★ -->
<button id="themeToggle" aria-label="Basculer entre thème clair et sombre">
  <span class="toggle-icon" aria-hidden="true">☀️</span>
  <span class="toggle-label">Nuit</span>
</button>
'''

JS_SEPIA = '''
<script>
/* ===== THÈME JOUR/NUIT ===== */
(function () {
  var btn   = document.getElementById('themeToggle');
  if (!btn) return;
  var icon  = btn.querySelector('.toggle-icon');
  var label = btn.querySelector('.toggle-label');
  function applyTheme(dark) {
    if (dark) document.documentElement.classList.add('dark');
    else      document.documentElement.classList.remove('dark');
    icon.textContent  = dark ? '🌙' : '☀️';
    label.textContent = dark ? 'Jour' : 'Nuit';
    try { localStorage.setItem('site-theme', dark ? 'dark' : 'light'); } catch (e) {}
  }
  applyTheme(document.documentElement.classList.contains('dark'));
  btn.addEventListener('click', function () {
    applyTheme(!document.documentElement.classList.contains('dark'));
  });
}());
</script>
'''

BUTTON_DARK = '''
<!-- ★ BOUTON BASCULE THÈME ★ -->
<button id="themeToggle" aria-label="Basculer entre thème clair et sombre">
  <span class="toggle-icon" aria-hidden="true">☀️</span>
  <span class="toggle-label">Jour</span>
</button>
'''

JS_DARK = '''
<script>
/* ===== THÈME JOUR/NUIT ===== */
(function () {
  var btn   = document.getElementById('themeToggle');
  if (!btn) return;
  var icon  = btn.querySelector('.toggle-icon');
  var label = btn.querySelector('.toggle-label');
  function applyTheme(light) {
    if (light) document.documentElement.classList.add('light');
    else       document.documentElement.classList.remove('light');
    icon.textContent  = light ? '🌙' : '☀️';
    label.textContent = light ? 'Nuit' : 'Jour';
    try { localStorage.setItem('site-theme', light ? 'light' : 'dark'); } catch (e) {}
  }
  applyTheme(document.documentElement.classList.contains('light'));
  btn.addEventListener('click', function () {
    applyTheme(!document.documentElement.classList.contains('light'));
  });
}());
</script>
'''

# ─────────────────────────────────────────────────────────────────
# CSS DARK MODE (pour pages sépia claires → nuit)
# ─────────────────────────────────────────────────────────────────

CSS_DARK_SEPIA = '''
  /* ═══════════════════════════════════════════
     BOUTON BASCULE THÈME — toujours visible
  ═══════════════════════════════════════════ */
  #themeToggle {
    position: fixed; top: 1.1rem; right: 1.2rem; z-index: 9999;
    display: flex; align-items: center; gap: 0.5rem;
    padding: 0.48rem 1rem 0.48rem 0.72rem;
    background: var(--parch-card, #fdf6e3);
    border: 1.5px solid var(--sepia-light, #c9a97a);
    border-radius: 2rem; cursor: pointer;
    font-family: 'Cinzel', serif; font-size: 0.67rem;
    letter-spacing: 0.11em; text-transform: uppercase;
    color: var(--sepia-mid, #7a4f2d);
    box-shadow: 0 3px 14px var(--shadow, rgba(44,26,14,0.18));
    transition: background 0.35s, color 0.35s, border-color 0.35s, box-shadow 0.35s, transform 0.2s;
  }
  #themeToggle:hover {
    background: var(--sepia-dark, #2c1a0e); color: var(--gold-light, #d4a843);
    border-color: var(--gold, #b8860b);
    box-shadow: 0 6px 22px var(--shadow); transform: translateY(-2px);
  }
  #themeToggle:active { transform: translateY(0); }
  .toggle-icon { font-size: 1.15rem; line-height: 1; display: inline-block; transition: transform 0.45s ease; }
  #themeToggle:hover .toggle-icon { transform: rotate(22deg) scale(1.15); }

  /* ═══════════════════════════════════════════
     THÈME SOMBRE — html.dark overrides
  ═══════════════════════════════════════════ */
  html.dark {
    --parch-bg:   #0a0705; --parch-card: #120c07;
    --sepia-dark: #e8d8b8; --sepia-mid:  #c9a97a; --sepia-light: #8b6840;
    --ink:        #e8d8b8; --gold:       #c9a03a; --gold-light:  #eabb58;
    --shadow:     rgba(0,0,0,0.65);
  }
  html.dark body { background-color: var(--parch-bg, #0a0705); }
  html.dark table { background: var(--parch-card, #120c07); }
  html.dark tbody tr { border-bottom: 1px solid #1e1608; }
  html.dark tbody tr:hover { background: #1e1408; }
  html.dark tbody tr:nth-child(even) { background: #150e05; }
  html.dark tbody tr:nth-child(even):hover { background: #1e1408; }
  html.dark .filter-btn { background: #120c07; border-color: #2a1e0e; color: #c9a97a; }
  html.dark .filter-btn:hover,
  html.dark .filter-btn.active { background: #201408; color: var(--gold-light); border-color: var(--gold); }
  html.dark .btn-back { color: var(--sepia-mid); }
  html.dark #themeToggle {
    background: #1a1208; border-color: var(--gold); color: var(--gold-light);
    box-shadow: 0 3px 14px rgba(0,0,0,0.5), 0 0 10px rgba(201,160,58,0.15);
  }
  html.dark #themeToggle:hover { background: #251a0a; color: #f5cc70; border-color: #f5cc70; }
  html, body, table, tbody tr, .filter-btn, #themeToggle, header, footer {
    transition: background-color 0.35s ease, color 0.35s ease,
                border-color 0.35s ease, box-shadow 0.35s ease;
  }
'''

# ─────────────────────────────────────────────────────────────────
# CSS LIGHT MODE (pour pages sombres → jour)
# ─────────────────────────────────────────────────────────────────

CSS_LIGHT_DARK = '''
  /* ═══════════════════════════════════════════
     BOUTON BASCULE THÈME — toujours visible
  ═══════════════════════════════════════════ */
  #themeToggle {
    position: fixed; top: 1.1rem; right: 1.2rem; z-index: 9999;
    display: flex; align-items: center; gap: 0.5rem;
    padding: 0.48rem 1rem 0.48rem 0.72rem;
    background: rgba(201,168,76,0.12);
    border: 1.5px solid rgba(201,168,76,0.45);
    border-radius: 2rem; cursor: pointer;
    font-family: 'Cormorant Garamond', Georgia, serif;
    font-size: 0.67rem; letter-spacing: 0.11em; text-transform: uppercase;
    color: var(--gold, #c9a84c);
    box-shadow: 0 3px 14px rgba(0,0,0,0.3);
    transition: background 0.35s, color 0.35s, border-color 0.35s, box-shadow 0.35s, transform 0.2s;
  }
  #themeToggle:hover {
    background: rgba(201,168,76,0.28); border-color: var(--gold, #c9a84c);
    transform: translateY(-2px); box-shadow: 0 6px 22px rgba(0,0,0,0.45);
  }
  #themeToggle:active { transform: translateY(0); }
  .toggle-icon { font-size: 1.15rem; line-height: 1; display: inline-block; transition: transform 0.45s ease; }
  #themeToggle:hover .toggle-icon { transform: rotate(22deg) scale(1.15); }

  /* ═══════════════════════════════════════════
     MODE JOUR — html.light overrides
  ═══════════════════════════════════════════ */
  html.light body { background: #f5ead8 !important; color: #1a1a1a !important; }
  html.light .hero-eyebrow  { color: var(--gold, #c9a84c) !important; }
  html.light .hero-title    { color: #1a1a1a !important; }
  html.light .hero-title em { color: #7a5a20 !important; }
  html.light .hero-subtitle { color: rgba(26,26,26,0.62) !important; }
  html.light .hero-intro    { color: rgba(26,26,26,0.72) !important; }
  html.light .hero-year     { color: rgba(201,168,76,0.10) !important; }
  html.light .section-title { color: #1a1a1a !important; }
  html.light .section-tag   { color: var(--gold, #c9a84c) !important; }
  html.light .stat-num      { color: var(--gold, #c9a84c) !important; }
  html.light .stat-label    { color: rgba(26,26,26,0.5) !important; }
  html.light .monument-card {
    background: rgba(245,234,216,0.85) !important;
    border-color: rgba(201,168,76,0.3) !important;
  }
  html.light .monument-card:hover { background: rgba(245,234,216,1) !important; }
  html.light .card-name    { color: #1a1a1a !important; }
  html.light .card-context { color: rgba(26,26,26,0.65) !important; }
  html.light .card-city    { color: var(--gold, #c9a84c) !important; }
  html.light .carte-pays   { background: #f5ead8 !important; color: #1a1a1a !important; }
  html.light .nom-pays     { color: #1a1a1a !important; }
  html.light .timeline-year  { color: var(--gold, #c9a84c) !important; }
  html.light .timeline-event { color: rgba(26,26,26,0.7) !important; }
  html.light .timeline-event strong { color: #1a1a1a !important; }
  html.light .timeline-dot  { background: var(--gold, #c9a84c) !important; }
  html.light footer { border-top-color: rgba(201,168,76,0.25) !important; }
  html.light .footer-text  { color: rgba(26,26,26,0.45) !important; }
  html.light .footer-crest { opacity: 0.25 !important; }
  html.light .bg-glow      { display: none !important; }
  html.light .site-title   { color: #1a1a1a !important; }
  html.light .site-subtitle { color: rgba(26,26,26,0.6) !important; }
  html.light .eyebrow      { color: var(--gold, #c9a84c) !important; }
  html.light #themeToggle {
    background: rgba(26,26,26,0.06) !important;
    border-color: rgba(26,26,26,0.2) !important;
    color: #1a1a1a !important;
  }
  html.light #themeToggle:hover {
    background: rgba(26,26,26,0.12) !important;
    border-color: rgba(26,26,26,0.4) !important;
  }
  html, body, .monument-card, .section-title, #themeToggle, footer {
    transition: background-color 0.35s ease, color 0.35s ease,
                border-color 0.35s ease, box-shadow 0.35s ease;
  }
'''

# ─────────────────────────────────────────────────────────────────
# FONCTIONS
# ─────────────────────────────────────────────────────────────────

def already_done(content):
    return 'themeToggle' in content or 'site-theme' in content

def add_to_sepia_page(content):
    """Ajoute NUIT (html.dark) à une page sépia claire."""
    anti_flash = ('<script>(function(){try{if(localStorage.getItem(\'site-theme\')==\'dark\')'
                  'document.documentElement.classList.add(\'dark\');}catch(e){}}());</script>')
    # 1. Anti-flash après <meta charset="UTF-8">
    content = content.replace(
        '<meta charset="UTF-8">',
        '<meta charset="UTF-8">\n' + anti_flash
    )
    # 2. CSS avant la première </style> dans <head>
    content = content.replace('</style>', CSS_DARK_SEPIA + '</style>', 1)
    # 3. Bouton après <body>
    content = content.replace('<body>', '<body>' + BUTTON_SEPIA, 1)
    # 4. JS avant </body>
    content = content.replace('</body>', JS_SEPIA + '</body>', 1)
    return content

def add_to_dark_page(content):
    """Ajoute JOUR (html.light) à une page sombre."""
    anti_flash = ('<script>(function(){try{if(localStorage.getItem(\'site-theme\')==\'light\')'
                  'document.documentElement.classList.add(\'light\');}catch(e){}}());</script>')
    # 1. Anti-flash
    content = content.replace(
        '<meta charset="UTF-8">',
        '<meta charset="UTF-8">\n' + anti_flash
    )
    # 2. CSS avant la première </style>
    content = content.replace('</style>', CSS_LIGHT_DARK + '</style>', 1)
    # 3. Bouton
    content = content.replace('<body>', '<body>' + BUTTON_DARK, 1)
    # 4. JS
    content = content.replace('</body>', JS_DARK + '</body>', 1)
    return content

def process_file(path, transform_fn, label=''):
    try:
        content = path.read_text(encoding='utf-8')
    except Exception as e:
        print(f'  ERROR reading {path.name}: {e}')
        return
    if already_done(content):
        print(f'  SKIP (déjà fait): {path.relative_to(ROOT)}')
        return
    new_content = transform_fn(content)
    path.write_text(new_content, encoding='utf-8')
    print(f'  ✓ {path.relative_to(ROOT)}')

# ─────────────────────────────────────────────────────────────────
# LISTE DES FICHIERS
# ─────────────────────────────────────────────────────────────────

# Pages sépia (fond clair, ajout mode NUIT)
SEPIA_FILES = [
    'Mes_Tableaux/Arts_et_Culture/index.html',
    'Mes_Tableaux/Arts_et_Culture/50_Livres.html',
    'Mes_Tableaux/Histoires_et_Civilisations/index.html',
    'Mes_Tableaux/Histoires_et_Civilisations/01 Empires.html',
    'Mes_Tableaux/Histoires_et_Civilisations/02 Batailles.html',
    'Mes_Tableaux/Histoires_et_Civilisations/03 Traités.html',
    'Mes_Tableaux/Histoires_et_Civilisations/04 Révolutions.html',
    'Mes_Tableaux/Histoires_et_Civilisations/05 Inventions.html',
    'Mes_Tableaux/Histoires_et_Civilisations/06 Explorateurs.html',
    'Mes_Tableaux/Nature_et_Environnement/index.html',
    'Mes_Tableaux/Nature_et_Environnement/50_catastrophes_naturelles.html',
    'Mes_Tableaux/Nature_et_Environnement/50_Especes_Menacees.html',
    'Mes_Tableaux/Sciences_et_Savoirs/index.html',
]

# Pages sombres (fond dark, ajout mode JOUR)
DARK_STATIC_FILES = [
    'index.html',
    'Mes_Tableaux/index.html',
]

# ─────────────────────────────────────────────────────────────────
# EXÉCUTION
# ─────────────────────────────────────────────────────────────────

print('\n═══ PAGES SÉPIA (ajout mode NUIT) ═══')
for rel in SEPIA_FILES:
    p = ROOT / rel
    if p.exists():
        process_file(p, add_to_sepia_page)
    else:
        print(f'  NOT FOUND: {rel}')

print('\n═══ INDEX SOMBRES (ajout mode JOUR) ═══')
for rel in DARK_STATIC_FILES:
    process_file(ROOT / rel, add_to_dark_page)

print('\n═══ PAGES PAYS (ajout mode JOUR) ═══')
pays_dir = ROOT / 'pays'
for p in sorted(pays_dir.glob('*.html')):
    process_file(p, add_to_dark_page)

print('\n═══ TERMINÉ ═══')
