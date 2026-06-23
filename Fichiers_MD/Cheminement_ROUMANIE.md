# Création de ROUMANIE.html — Cheminement Complet

> **Date :** 18 mai 2026  
> **Objectif :** Reconstruire `pays/ROUMANIE.html` selon le modèle `ESPAGNE.html`  
> **Résultat :** ✅ Page complète, déployée sur GitHub Pages

---

## 1. Le Problème de Départ

### 4 tentatives échouées en session précédente
La page `ROUMANIE.html` (~850 lignes) était trop volumineuse pour être créée en une seule réponse par l'IA. Chaque tentative se heurtait à **la limite de longueur** du contexte :

```
❌ Tentative 1 — response hit the length limit
❌ Tentative 2 — response hit the length limit
❌ Tentative 3 — response hit the length limit
❌ Tentative 4 — response hit the length limit (via subagent)
```

### La solution : diviser le travail
Au lieu de créer le fichier en une seule fois, la stratégie adoptée fut :
1. **Copier** `ESPAGNE.html` → `ROUMANIE.html` (base de 836 lignes)
2. **Remplacer par blocs** via PowerShell, section par section
3. **Gérer l'encodage UTF-8** explicitement (problème critique découvert en cours de route)

---

## 2. Architecture de la Page

La page suit le modèle `ESPAGNE.html` (gold standard) :

```
ROUMANIE.html
├── <head> CSS — variables couleurs, styles
├── <body>
│   ├── .hero — bandeau principal + SVG aigle roumain
│   ├── section-header — "Carte interactive — 15 catégories"
│   ├── .map-section — carte Leaflet interactive
│   ├── section-header — "Des Daces aux Carpates"
│   ├── .monuments-section — grille de 35 cartes
│   ├── section-header — "Histoire de la Roumanie"
│   ├── .timeline-section — 7 événements historiques
│   └── <footer>
├── <script> Leaflet.js
│   ├── Icônes SVG (mkIcon)
│   ├── var DATA — 15 catégories × ~45 points GPS
│   ├── var groups — filtres carte
│   ├── FcControl — panneau filtres latéral (15 ROWS)
│   └── McControl — 5 tuiles de fond de carte
```

---

## 3. Étapes Réalisées

### Étape 1 — Copie et base CSS
```powershell
Copy-Item pays\ESPAGNE.html pays\ROUMANIE.html
```
Puis remplacements PowerShell des variables CSS :
```css
--rosu:#CE1126;      /* rouge roumain */
--galben:#FCD116;    /* jaune roumain */
--negru:#020408;
--albastru:#002B7F;
body { background:#020408; }
```
Drapeau tricolore dans `.hero::after` : bleu/jaune/rouge.

---

### Étape 2 — Section Hero
Tous les textes du bandeau principal remplacés :

| Élément | Contenu |
|---------|---------|
| `hero-year` | `ROMÂNIA` |
| `hero-eyebrow` | `Roumanie · Guide du Voyageur` |
| `hero-title` | `Châteaux de Dracula, Monastères & Danube` |
| `hero-subtitle` | `Bucarest la Belle · Transylvanie · Bucovine · Delta` |
| `hero-intro` | Texte d'introduction sur la Roumanie |
| `hero-stats` | 15 Catégories / 35 Monuments / 9 UNESCO / 19M hab |

**SVG aigle roumain** (160×160) remplaçant le taureau espagnol :
- Couronne dorée, écu tricolore (albastru/galben/rosu)
- Annotation `Aquila Română`

---

### Étape 3 — Paramètres carte et navigation
```javascript
map.setView([45.94, 24.97], 7)   // Centre Roumanie
_wikiCurrentTitle = title || 'Roumanie'
openWiki(url, title + ' Roumanie')
```

---

### Étape 4 — Problème d'encodage UTF-8 🔴

**Problème découvert :** Le script PowerShell 5.1 lit les fichiers `.ps1` sans BOM en Windows-1252, corrompant les caractères roumains :
```
Château de Bran  →  ChÃ¢teau de Bran   ❌
Brașov           →  BraÈ™ov            ❌
```

**Solution adoptée :** Utiliser les classes .NET directement pour forcer l'encodage :
```powershell
# AVANT (corrompt les accents)
Set-Content $f $content -Encoding UTF8

# APRÈS (correct)
$e = [System.Text.Encoding]::UTF8
$bytes = [System.IO.File]::ReadAllBytes("fichier.txt")
$text = $e.GetString($bytes)
[System.IO.File]::WriteAllBytes("sortie.html", $e.GetPreamble() + $e.GetBytes($text))
```

**Stratégie fichiers intermédiaires :** Les blocs de contenu volumineux avec caractères spéciaux (créés par `create_file` en UTF-8) sont lus par PowerShell via `ReadAllBytes` puis injectés dans le HTML.

---

### Étape 5 — DATA JavaScript (15 catégories)

Fichier intermédiaire : `data_roumanie.txt`

Les 15 catégories avec leurs icônes et points GPS :

| Cat | Icône | Points | Exemples |
|-----|-------|--------|---------|
| `chateau` | 🏰 rouge | 4 | Bran, Peleș, Corvin, Alba Iulia |
| `monastere` | ⛪ violet | 5 | Voroneț, Sucevița, Moldovița… |
| `ville` | 🏛️ doré | 6 | Bucarest, Brașov, Sibiu… |
| `unesco` | ⭐ doré | 5 | Delta, Sighișoara, Viscri… |
| `nature` | 🌿 vert | 4 | Retezat, Piatra Craiului… |
| `montagne` | ⛰️ gris | 3 | Transfăgărășan, Făgăraș, Bucegi |
| `gastro` | 🍲 orange | 3 | Mămăligă, Sarmale, Tuica |
| `musee` | 🏛️ bleu | 3 | MNAR, Brukenthal, ASTRA |
| `lac` | 🌊 bleu | 3 | Delta, Lac Rouge, Sfânta Ana |
| `artiste` | 🎨 violet | 3 | Brâncuși, Enescu, Cantacuzino |
| `grotte` | 🦇 ardoise | 3 | Scărișoara, Ours, Muierilor |
| `festival` | 🎪 jaune | 3 | TIFF, Electric Castle, FITS |
| `village` | 🏡 doré brun | 3 | Viscri, Rimetea, Maramureș |
| `vin` | 🍷 bordeaux | 3 | Dealu Mare, Murfatlar, Cotnari |
| `spa` | ♨️ bleu | 3 | Herculane, Eforie Nord, Covasna |

**Nouvelles icônes SVG créées** (n'existaient pas dans ESPAGNE) :
- `iconMontagne` — silhouette de sommet enneigé
- `iconGrotte` — arche de caverne avec stalactites
- `iconVin` — verre de vin bordeaux
- `iconSpa` — vapeurs thermales sur eau

---

### Étape 6 — FcControl ROWS (15 lignes de filtre)

Fichier intermédiaire : `rows_roumanie.txt`

Remplacement des 17 catégories espagnoles par 15 roumaines.  
Corrections de couleurs :

```
#c60b1e  →  #CE1126   (rouge espagnol → rouge roumain)
#3a0a08  →  #020408   (fond espagnol → fond roumain)
"17 catégories"  →  "15 catégories"
```

---

### Étape 7 — 35 Cartes Monuments

Fichier intermédiaire : `cards_roumanie.txt`

Format des cartes (différent d'Espagne — Wikipedia au lieu de Google) :
```html
<div onclick="openWiki('https://fr.m.wikipedia.org/wiki/...?useskin=vector','Titre')"
     class="monument-card reveal" style="cursor:pointer;">
  <div class="card-number">01</div>
  <div class="card-city">Bran, Brașov</div>
  <h3 class="card-name">Château de Bran</h3>
  <p class="card-context">Description...</p>
  <div class="card-footer">
    <span class="card-link">Wikipedia <svg>→</svg></span>
  </div>
</div>
```

Distribution des 35 cartes :

```
01–04   Châteaux & Forteresses (4)
05–09   Monastères Peints UNESCO (5)
10–15   Villes Historiques (6)
16–20   Sites UNESCO (5)
21–24   Carpates & Nature (4)
25–27   Musées (3)
28–29   Artistes (2)
30–31   Grottes (2)
32–35   Thermes, Villages, Vins, Festival (4)
```

---

### Étape 8 — Timeline Historique (7 événements)

Fichier intermédiaire : `timeline_roumanie.txt`

| Période | Événement |
|---------|-----------|
| ~82 av. J.-C. | Royaume Dace de Burebista |
| 106 ap. J.-C. | Conquête de Trajan — Dacie Romaine |
| XIVe–XVe s. | Les Trois Principautés (Mircea, Étienne le Grand, Vlad) |
| 1600 | Michel le Brave — 1ère unification |
| 1859–1918 | Naissance de la Grande Roumanie |
| 1945–1989 | Régime Ceaușescu |
| 1989–aujourd'hui | Révolution & adhésion UE (2007) |

---

### Étape 9 — Nettoyage et correction finale

- Section-header avant timeline : `"Des Ibères aux Rois Catholiques"` → `"Des Daces aux Carpates"`
- Section-title : `"Histoire de l'Espagne"` → `"Histoire de la Roumanie"`
- Vérification : 0 référence espagnole résiduelle (`Alhambra`, `Sagrada`, `Prado`…)

---

### Étape 10 — Git Push

```
git add -A
git commit -m "Roumanie : ROUMANIE.html complet (FcControl 15 cat, 35 monuments, timeline 7 evenements, DATA roumain)"
git push
```

**Résultat :** `6 files changed, 932 insertions(+), 650 deletions(-)` ✅

---

## 4. Fichiers Intermédiaires Créés

| Fichier | Rôle | Peut être supprimé |
|---------|------|-------------------|
| `data_roumanie.txt` | DATA JS + aliases icônes | Oui |
| `rows_roumanie.txt` | FcControl ROWS (15 cat) | Oui |
| `cards_roumanie.txt` | 35 cartes monuments HTML | Oui |
| `timeline_roumanie.txt` | 7 événements timeline HTML | Oui |
| `patch_roumanie.ps1` | Script PS1 (première tentative) | Oui |

---

## 5. Leçons Apprises

### ✅ Ce qui a fonctionné
- **Stratégie incrémentale** : diviser le fichier en blocs thématiques gérables
- **Fichiers intermédiaires UTF-8** : écrits par `create_file` (BOM), lus par PowerShell via `ReadAllBytes`
- **`[System.IO.File]::WriteAllBytes()`** avec `GetPreamble()` : seul moyen fiable de forcer UTF-8 BOM sous PS 5.1

### ❌ À éviter
- **Here-strings PowerShell avec caractères accentués** : PowerShell 5.1 lit le script en CP1252 sans BOM → corruption garantie
- **`Set-Content -Encoding UTF8`** en PS 5.1 : ajoute un BOM non souhaité et peut corrompre
- **Créer un fichier 850 lignes en une réponse** : toujours dépasser la limite de contexte

### 💡 Bonne pratique pour les pages pays futures
1. Copier depuis ESPAGNE.html ou un pays existant
2. Créer les fichiers `.txt` avec `create_file` (UTF-8 garanti)
3. Injecter via PowerShell avec `ReadAllBytes`/`WriteAllBytes`
4. Vérifier avec `Select-String` avant de push

---

## 6. Résultat Final

```
pays/ROUMANIE.html — 800 lignes
├── ✅ CSS couleurs roumaines (#CE1126, #FCD116, #002B7F)
├── ✅ Hero : aigle roumain SVG + textes + stats
├── ✅ Carte Leaflet centrée sur Roumanie [45.94, 24.97]
├── ✅ FcControl : 15 catégories filtrables
├── ✅ McControl : 5 tuiles (Standard, Couleurs, Relief, Aquarelle, Satellite)
├── ✅ 35 cartes monuments (liens Wikipedia)
├── ✅ Timeline 7 événements (~82 av. J.-C. → 2007)
└── ✅ Footer 🇷🇴 · 15 Catégories
```

**Déployé sur :** https://lindien99.github.io/mon-site-YH/pays/ROUMANIE.html
