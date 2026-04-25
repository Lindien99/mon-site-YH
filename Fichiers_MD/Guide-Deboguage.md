# Guide de Débogage — Mon Site Européen
### Pour les nuls, pas à pas, sans jargon inutile

---

## C'est quoi "déboguer" ?

Un **bug**, c'est quand quelque chose ne marche pas comme prévu.  
**Déboguer**, c'est jouer au détective pour trouver le coupable et le corriger.

Ce guide couvre les 3 fichiers de ton site :
- `index.html` — la page d'accueil avec la grille des pays
- `script.js` — le code JavaScript qui construit les cartes
- `pays/PAYS.html` — les pages individuelles de chaque pays
- `style.css` — la mise en page et les couleurs

---

## ÉTAPE 1 — Ouvre les Outils de Développement (DevTools)

C'est ton meilleur ami. C'est gratuit, déjà installé dans ton navigateur.

### Comment ouvrir les DevTools ?

| Navigateur | Raccourci clavier |
|---|---|
| Chrome / Edge | `F12` ou `Ctrl + Shift + I` |
| Firefox | `F12` ou `Ctrl + Shift + I` |

> **Astuce :** Clique droit sur n'importe quel élément de la page → **"Inspecter"**

Une fenêtre s'ouvre sur le côté ou en bas. Elle a plusieurs onglets.  
Les 3 qui t'intéressent :

| Onglet | À quoi ça sert |
|---|---|
| **Console** | Affiche les erreurs JavaScript en rouge |
| **Elements** | Montre le code HTML de la page en direct |
| **Network** | Montre si les fichiers se chargent correctement |

---

## ÉTAPE 2 — Lis la Console (l'onglet le plus utile)

Clique sur l'onglet **Console**.

### Tu vois un texte rouge ? C'est une erreur.

Les erreurs en rouge sont tes indices principaux. Exemples typiques :

---

#### Erreur n°1 : Fichier introuvable
```
GET file:///C:/mon-site/pays/BELGIQUE.html net::ERR_FILE_NOT_FOUND
```
**Traduction :** Le fichier `BELGIQUE.html` est introuvable.  
**Solution :** Vérifie que le fichier existe dans le dossier `pays/` et que son nom est exactement `BELGIQUE.html` (majuscules comprises).

---

#### Erreur n°2 : Erreur JavaScript
```
Uncaught TypeError: Cannot read properties of null (reading 'appendChild')
```
**Traduction :** Le script cherche un élément HTML qui n'existe pas.  
**Solution :** Vérifie que dans `index.html` l'élément avec l'id `grid-pays` est bien présent :
```html
<main id="grid-pays"></main>
```

---

#### Erreur n°3 : Police ou ressource externe bloquée
```
Failed to load resource: net::ERR_INTERNET_DISCONNECTED
```
**Traduction :** Ton site charge une police Google Fonts ou Leaflet depuis internet, mais tu n'as pas de connexion.  
**Solution :** Connecte-toi à internet, ou teste avec un autre navigateur.

---

#### Pas d'erreur rouge mais ça ne marche pas ?
Cherche les messages en **jaune** (avertissements) ou tape dans la Console :
```javascript
console.log("test")
```
Si tu vois `test` apparaître → la console fonctionne bien.

---

## ÉTAPE 3 — Problème d'affichage ? Inspecte les Elements

**Symptôme :** La page est blanche, une carte est mal positionnée, une couleur ne s'affiche pas.

1. Ouvre DevTools → onglet **Elements**
2. Passe ta souris sur le code HTML → les éléments se surlignent sur la page
3. Clique sur un élément → à droite tu vois ses **styles CSS** en direct
4. Tu peux même modifier les valeurs directement dans DevTools pour tester (les changements disparaissent au rechargement, c'est sans risque)

### Vérification rapide de la grille des pays
Dans la Console, tape :
```javascript
document.getElementById('grid-pays')
```
- Si tu vois `<main id="grid-pays">...</main>` → l'élément existe, c'est bon
- Si tu vois `null` → l'élément est absent du HTML, voilà ton problème

---

## ÉTAPE 4 — Rien ne s'affiche du tout ?

### Checklist à suivre dans l'ordre :

**1. Le fichier est-il bien ouvert dans le navigateur ?**
- L'adresse doit ressembler à : `file:///C:/Users/Y/Google Drive/mon-site-YH/index.html`
- Si l'adresse est vide ou bizarre → ferme et rouvre le fichier

**2. Le JavaScript est-il activé ?**
- Dans Chrome : `Paramètres → Confidentialité → Paramètres des sites → JavaScript → Autorisé`

**3. Le fichier `script.js` est-il bien lié ?**
- Ouvre `index.html` et cherche cette ligne tout en bas :
```html
<script src="script.js"></script>
```
- Si cette ligne manque ou est mal écrite → les cartes ne s'affichent jamais

**4. Y a-t-il une erreur de syntaxe dans `script.js` ?**
- Dans la Console, une erreur rouge avec `SyntaxError` indique une faute de frappe dans le code
- Exemple : une accolade `}` ou une virgule `,` manquante

---

## ÉTAPE 5 — Vérifier les fichiers pays (Network)

**Symptôme :** Tu cliques sur une carte de pays et la page ne s'ouvre pas.

1. Ouvre DevTools → onglet **Network**
2. Clique sur le bouton de rafraîchissement `F5`
3. Clique sur la carte du pays problématique
4. Dans l'onglet Network, cherche une ligne en **rouge** — elle indique le fichier qui n'a pas pu se charger

### Causes habituelles :

| Problème | Exemple |
|---|---|
| Mauvais nom de fichier | `Belgique.html` au lieu de `BELGIQUE.html` |
| Fichier dans le mauvais dossier | Fichier à la racine au lieu de dans `pays/` |
| Caractère spécial dans le nom | `PAYS-BAS.html` → le tiret doit être présent |

---

## ÉTAPE 6 — Méthode du `console.log`

C'est la technique la plus simple pour comprendre ce que fait ton code.

Ouvre `script.js` et ajoute des `console.log()` pour afficher des valeurs :

```javascript
paysData.forEach(p => {
    console.log("Je traite le pays :", p.nom); // ← ajoute cette ligne
    const carte = document.createElement('a');
    // ...
});
```

Sauvegarde → recharge la page → regarde la Console.  
Tu verras défiler les noms des pays. Si un pays manque → tu sais où est le problème.

**Quand tu as fini, retire ces lignes `console.log`.** Elles ne cassent rien, mais c'est une bonne habitude.

---

## ÉTAPE 7 — Vider le cache (quand tes modifications ne s'affichent pas)

Tu modifies un fichier, tu sauvegardes, tu recharges la page… et rien ne change ?  
C'est le **cache** du navigateur : il garde une vieille copie de tes fichiers.

**Solution :** Recharge en vidant le cache :
- `Ctrl + Shift + R` (Windows) — rechargement forcé

Ou depuis DevTools :
- Clic droit sur le bouton de rechargement → **"Vider le cache et recharger"**

---

## ÉTAPE 8 — Problème avec la carte Leaflet (carte géographique)

Les pages pays utilisent **Leaflet** (la carte interactive). Si la carte ne s'affiche pas :

1. **Vérifie la connexion internet** — Leaflet charge ses tuiles depuis le web
2. Dans la **Console**, cherche une erreur contenant `leaflet` ou `tile`
3. Dans la page pays, vérifie que ces deux lignes sont dans le `<head>` :
```html
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/>
<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
```
4. Vérifie que la `<div>` de la carte a une **hauteur définie** en CSS — Leaflet ne s'affiche pas si la div a une hauteur de 0

---

## Résumé — L'ordre d'investigation

```
Quelque chose ne marche pas
        ↓
① Ouvrir DevTools (F12)
        ↓
② Onglet Console → des erreurs en rouge ?
   OUI → lire l'erreur, trouver le fichier et la ligne concernés
   NON → continuer
        ↓
③ Onglet Elements → l'élément HTML est-il là ?
        ↓
④ Onglet Network → les fichiers se chargent-ils ?
        ↓
⑤ Ajouter des console.log() dans script.js pour tracer le problème
        ↓
⑥ Ctrl + Shift + R pour forcer le rechargement
```

---

## Messages d'erreur courants — Glossaire rapide

| Message | Signification simple |
|---|---|
| `404 Not Found` | Le fichier demandé n'existe pas à cet endroit |
| `SyntaxError` | Faute de frappe dans le code JavaScript |
| `TypeError` | On essaie d'utiliser quelque chose qui n'existe pas |
| `ReferenceError` | On utilise un nom de variable qui n'a jamais été déclaré |
| `net::ERR_FILE_NOT_FOUND` | Le fichier est introuvable sur le disque |
| `null` | L'élément HTML cherché est absent de la page |

---

## Conseil final

> **Ne change qu'une seule chose à la fois.**  
> Sauvegarde. Recharge. Vérifie si ça a changé.  
> Puis passe à la modification suivante.

Modifier plusieurs choses en même temps, c'est se condamner à ne plus savoir ce qui a causé quoi.

---

*Guide rédigé pour le projet Collection Européenne — Yvon H. — Avril 2026*
