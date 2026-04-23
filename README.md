# 🏛️ Exploration Européenne — Collection Yvon H.

> *« Un guide interactif des merveilles de l'Europe, inspiré par l'esprit curieux de Léonard de Vinci. »*

---

## 🗺️ C'est quoi ce projet ?

Un **site web personnel** qui présente des guides de voyage interactifs pour **18 pays européens**.  
Pour chaque pays, le visiteur peut :

- Consulter **35 monuments** incontournables
- Explorer une **carte interactive** (Leaflet.js) avec des marqueurs colorés par catégorie
- Cliquer sur un monument pour ouvrir une **fenêtre Wikipedia** directement dans la page
- Lire une **frise chronologique** des grands moments de l'histoire du pays

Aucun serveur, aucune base de données — juste des fichiers HTML, CSS et JavaScript.

---

## 🌍 Les 18 pays couverts

| Pays | Pays | Pays |
|------|------|------|
| 🇩🇪 Allemagne | 🇫🇮 Finlande | 🇳🇴 Norvège |
| 🇦🇹 Autriche | 🇫🇷 France | 🇳🇱 Pays-Bas |
| 🇧🇪 Belgique | 🇬🇷 Grèce | 🇵🇱 Pologne |
| 🇩🇰 Danemark | 🇭🇺 Hongrie | 🇵🇹 Portugal |
| 🇪🇸 Espagne | 🇮🇹 Italie | 🇸🇪 Suède |
| — | 🇱🇺 Luxembourg | 🇨🇭 Suisse |
| — | — | 🇨🇿 Tchéquie |

---

## 📁 Structure des fichiers

```
mon-site-YH/
│
├── index.html          ← Page d'accueil (grille des 18 pays)
├── style.css           ← Styles de la page d'accueil
├── script.js           ← JavaScript : génère les cartes pays dynamiquement
├── .gitignore          ← Protection : fichiers exclus de Git/GitHub
├── README.md           ← Ce fichier
│
└── pays/               ← Un fichier HTML par pays
    ├── ALLEMAGNE.html
    ├── AUTRICHE.html
    ├── BELGIQUE.html
    ├── DANEMARK.html
    ├── ESPAGNE.html
    ├── FINLANDE.html
    ├── FRANCE.html
    ├── GRECE.html
    ├── HONGRIE.html
    ├── ITALIE.html
    ├── LUXEMBOURG.html
    ├── NORVEGE.html
    ├── PAYS-BAS.html
    ├── POLOGNE.html
    ├── PORTUGAL.html
    ├── SUEDE.html
    ├── SUISSE.html
    └── TCHEQUIE.html
```

---

## ⚙️ Comment ça fonctionne ?

### 1. La page d'accueil (`index.html` + `script.js`)

La page d'accueil est **vide par défaut** — c'est le JavaScript qui la construit.  
`script.js` contient la liste des 18 pays et crée automatiquement une carte cliquable pour chacun :

```javascript
const paysData = [
    { nom: "Allemagne", code: "ALLEMAGNE", emoji: "🇩🇪" },
    { nom: "France",    code: "FRANCE",    emoji: "🇫🇷" },
    // ... 16 autres pays
];

// Pour chaque pays, une carte est créée et ajoutée à la grille
paysData.forEach(p => {
    const carte = document.createElement('a');
    carte.href = `pays/${p.code}.html`;   // → lien vers le fichier pays
    carte.innerHTML = `<div>${p.emoji}</div><div>${p.nom}</div>`;
    grille.appendChild(carte);
});
```

> **À retenir :** pour ajouter un nouveau pays, il suffit d'ajouter une ligne dans `paysData` ET de créer le fichier `pays/NOMPAYS.html`.

---

### 2. Une page pays (`pays/ALLEMAGNE.html`)

Chaque page pays est **autonome** et suit toujours la même structure en 5 sections :

```
┌─────────────────────────────────────────┐
│  SECTION 1 — HÉRO                       │
│  Titre, sous-titre, emblème SVG,        │
│  statistiques (monuments, UNESCO…)      │
├─────────────────────────────────────────┤
│  SECTION 2 — CARTE INTERACTIVE          │
│  Carte Leaflet.js avec marqueurs        │
│  colorés par catégorie de lieu          │
├─────────────────────────────────────────┤
│  SECTION 3 — MONUMENTS                  │
│  Grille de 35 cartes numérotées         │
│  Clic → ouvre Wikipedia dans une modale │
├─────────────────────────────────────────┤
│  SECTION 4 — TIMELINE HISTORIQUE        │
│  Frise chronologique des événements clés│
├─────────────────────────────────────────┤
│  SECTION 5 — FOOTER                     │
│  Drapeau + crédits                      │
└─────────────────────────────────────────┘
```

---

### 3. La modale Wikipedia

Quand on clique sur un monument, une fenêtre s'ouvre **sans quitter la page** :

```html
<!-- Chaque carte monument appelle cette fonction -->
<button onclick="openWiki('https://fr.wikipedia.org/wiki/Château_de_Neuschwanstein', 'Neuschwanstein')">
    Explorer →
</button>
```

La fonction JavaScript charge la page Wikipedia dans un `<iframe>` (une fenêtre intégrée).  
Si Wikipedia bloque le chargement, un bouton de secours redirige vers Google.

---

### 4. Le design

Le thème visuel s'inspire des **manuscrits de la Renaissance** :

| Élément | Choix technique |
|---------|----------------|
| Couleurs | Or `#d4af37`, fond sombre `#1a1a1a`, parchemin `#f4e4bc` |
| Polices | `Playfair Display` (titres) + `Cormorant Garamond` (texte) via Google Fonts |
| Couleurs nationales | Chaque pays a ses propres variables CSS (ex. : `--rot`, `--gelb` pour l'Allemagne) |
| Responsive | CSS Grid `auto-fit minmax(250px, 1fr)` — s'adapte à tous les écrans |
| Animations | `@keyframes fadeUp` pour l'apparition des éléments au chargement |

---

## 🛠️ Technologies utilisées

| Technologie | Rôle | Coût |
|-------------|------|------|
| **HTML5** | Structure des pages | Gratuit |
| **CSS3** | Mise en forme et animations | Gratuit |
| **JavaScript (Vanilla)** | Génération des cartes, gestion des modales | Gratuit |
| **Leaflet.js** | Cartes interactives avec marqueurs | Gratuit (CDN) |
| **Google Fonts** | Polices Playfair Display & Cormorant Garamond | Gratuit (CDN) |
| **Wikipedia** | Contenu encyclopédique via iframe | Gratuit |

> Aucune installation, aucun framework, aucun serveur requis.  
> Le site fonctionne en ouvrant simplement `index.html` dans un navigateur.

---

## ✅ Qualité du code

Les bonnes pratiques suivantes ont été appliquées :

- **SEO** : chaque page possède une balise `<meta name="description">` descriptive
- **Accessibilité** : les modales utilisent `role="dialog"`, `aria-modal="true"` et `aria-labelledby` pour les lecteurs d'écran
- **Navigation clavier** : les cartes de l'accueil ont un état `:focus` visible (contour doré)
- **Sécurité** : les liens externes utilisent `rel="noopener"` pour éviter les attaques de type *tab-napping*
- **Protection** : un fichier `.gitignore` exclut les fichiers système et privés de Git

---

## 🚀 Pour ouvrir le site

1. Double-cliquer sur `index.html`  
   **ou**
2. Utiliser une extension de serveur local (ex. : *Live Server* dans VS Code) pour un rendu optimal

---

## ➕ Pour ajouter un nouveau pays

1. Créer le fichier `pays/NOMPAYS.html` en copiant un fichier existant comme modèle
2. Ajouter une ligne dans `script.js` :
   ```javascript
   { nom: "Roumanie", code: "ROUMANIE", emoji: "🇷🇴" },
   ```
3. C'est tout — la carte apparaît automatiquement sur l'accueil.

---

*© 2026 — Collection Personnelle Yvon H. · Réalisé avec Claude · Anthropic*
