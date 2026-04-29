# Journal des Modifications — Collection Européenne Yvon H.

---

## Session du 28 avril 2026

### Fichiers modifiés
- `pays/ALLEMAGNE.html`
- `Artefact/Google_Search.html` *(nouveau fichier créé)*

---

### 1. Bouton CLIQUER ICI → Google_Search.html dynamique

**Fichier :** `pays/ALLEMAGNE.html`

Chaque marqueur Leaflet possède un bouton **▶ CLIQUER ICI** dans son info-bulle.  
Avant : ce bouton ouvrait la modale Wikipédia.  
Après : il ouvre `Google_Search.html` en **popup** avec le nom du monument en paramètre URL.

```
../Artefact/Google_Search.html?q=Cathédrale de Cologne Allemagne&from=ALLEMAGNE
```

---

### 2. Création de Google_Search.html dynamique

**Fichier :** `Artefact/Google_Search.html` *(créé)*

Page d'options de recherche Google avec 9 cartes cliquables :
- 🤖 Mode IA (Gemini)
- 🔎 Tout
- 🖼️ Images
- 📰 Actualités
- 🎬 Vidéos
- 📱 Vidéos courtes
- 🗺️ Maps
- ➕ Plus…
- ⚙️ Outils

Le paramètre `?q=` est lu via `URLSearchParams` et injecté dynamiquement dans tous les liens.  
Les recherches Google s'ouvrent dans une **popup séparée** (1100×780px) — la page `Google_Search.html` reste visible derrière.

---

### 3. Navbar 5 parties — sticky en haut de page

**Fichier :** `pays/ALLEMAGNE.html`

Barre de navigation collante (`position: sticky`) ajoutée en haut de chaque page pays.

| Bouton | Action |
|--------|--------|
| 🌍 Pays | Retour à `index.html` |
| 📖 Guide | Ancre `#guide` (section héro) |
| 🗺️ Carte | Ancre `#carte` (carte Leaflet) |
| 🏛️ Monuments | Ancre `#monuments` (grille des 35 monuments) |
| 🔍 Google | Ouvre `Google_Search.html` en popup |
| ✖ Fin | Ferme l'onglet (`window.close()`) |

Ancres `id` ajoutées sur :
- `<section id="guide" class="hero">`
- `<div id="carte" class="map-section">`
- `<div id="monuments" class="monuments-section">`

---

### 4. Navbar identique dans Google_Search.html

**Fichier :** `Artefact/Google_Search.html`

Même navbar sticky ajoutée, avec liens retour vers les sections de `ALLEMAGNE.html` via le paramètre `?from=ALLEMAGNE`.

---

### 5. Option C essayée puis annulée

Panneau Google **coulissant depuis la droite** intégré directement dans `ALLEMAGNE.html`.  
→ **Annulé** à la demande d'Yvon. Remplacé par l'Option B (popup séparée).

---

### 6. Option B retenue — Popup Google séparée

**Fichier :** `pays/ALLEMAGNE.html` + `Artefact/Google_Search.html`

- Bouton **🔍 Google** dans la navbar → popup `gsearch` (700×750px)
- Bouton **▶ CLIQUER ICI** sur un marqueur → même popup réutilisée avec le nom du monument
- Liens dans `Google_Search.html` → popup `gpopup` (1100×780px) pour Google réel

---

### Commits Git

| Hash | Message |
|------|---------|
| `e0c23c9` | ALLEMAGNE : bouton CLIQUER ICI ouvre Google_Search.html dynamique |
| `54ab759` | ALLEMAGNE : barre de navigation 5 parties |
| `daef738` | ALLEMAGNE + Google_Search : navbar persistante + bouton Fin |
| `9a40051` | ALLEMAGNE : panneau Google coulissant intégré (Option C) |
| `10707a7` | ALLEMAGNE : retrait Option C, implémentation Option B |

---

*Document généré par Assistant YH — 28 avril 2026*
