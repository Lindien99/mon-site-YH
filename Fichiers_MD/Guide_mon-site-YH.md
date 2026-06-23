# Guide — Mon Site YH : Collection Européenne

## Ce qu'on a accompli

Création d'un site web personnel présentant 18 pays européens avec cartes interactives,
puis mise en ligne pour y accéder depuis n'importe quel appareil (PC, tablette, téléphone).

---

## Structure du projet

```
mon-site-YH/
├── index.html        → Page d'accueil avec la grille des 18 pays
├── style.css         → Apparence du site (thème sombre, couleur or)
├── script.js         → Génération dynamique des cartes de pays
└── pays/
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

## Étapes de mise en ligne

### Étape 1 — Activation de GitHub Pages
- Aller sur **[github.com/Lindien99/mon-site-YH](https://github.com/Lindien99/mon-site-YH)**
- Onglet **Settings** → section **Pages**
- Source : branche `main`, dossier `/ (root)`
- Cliquer **Save**

### Étape 2 — Mise en ligne du site
Dans le terminal VS Code :
```
git add -A
git commit -m "mise en ligne initiale"
git push
```
GitHub Pages déploie automatiquement.

### Étape 3 — Site publié
- GitHub génère l'adresse automatiquement
- Le site est immédiatement accessible depuis n'importe quel appareil

### Étape 4 — Test sur tablette Android
- Ouvrir le navigateur sur la tablette
- Taper l'adresse du site dans la barre d'adresse
- Les 20 pays apparaissent exactement comme sur le PC

---

## Sécurité

- Le site est **public** : tout le monde peut le consulter
- Le site contient uniquement des guides de voyage — **aucune donnée personnelle**
- Google Drive, photos et documents personnels sont **totalement séparés** du site

---

## Adresse du site

🌍 **https://lindien99.github.io/mon-site-YH**
