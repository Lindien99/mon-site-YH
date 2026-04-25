# Correction & Mise à jour du site — GitHub + Netlify

---

## Méthode actuelle (upload manuel)

Pour corriger un fichier (ex. `pays/ALLEMAGNE.html`) et voir la correction en ligne :

1. **Modifier le fichier** dans VS Code et sauvegarder (`Ctrl+S`)
2. Aller sur **[app.netlify.com](https://app.netlify.com)**
3. Cliquer sur votre site (`taupe-starburst-97f87d`)
4. Aller dans l'onglet **"Deploys"**
5. Faire glisser le dossier **entier** `mon-site-YH` dans la zone *"drag and drop your site output folder here"*
6. Netlify redéploie automatiquement — la correction est en ligne en quelques secondes

> **Important** : Toujours re-uploader le dossier **complet**, pas seulement le fichier modifié.

---

## Méthode recommandée — Connecter GitHub à Netlify

### GitHub : aucun abonnement nécessaire

Un compte **GitHub gratuit** est largement suffisant pour ce projet. Il inclut :
- Dépôts privés et publics illimités
- Intégration complète avec Netlify
- GitHub Pages (hébergement gratuit optionnel)

Créer un compte gratuit sur **[github.com](https://github.com)**.

---

### Le principe

```
Votre PC (VS Code)  →  GitHub (sauvegarde)  →  Netlify (mise en ligne auto)
```

Au lieu de re-uploader le dossier manuellement à chaque fois, vous faites une seule action et tout se met à jour automatiquement.

---

### Le flux de travail au quotidien (une fois configuré)

1. Vous **corrigez** un fichier dans VS Code
2. Vous **« poussez »** la correction vers GitHub (3 commandes ou 2 clics dans VS Code)
3. Netlify **détecte automatiquement** le changement
4. Le site est **mis à jour en ligne** en ~30 secondes — sans rien faire de plus

---

### La mise en place (une seule fois)

1. Créer un compte gratuit sur **[github.com](https://github.com)**
2. Créer un dépôt (« repository ») et y uploader le dossier `mon-site-YH`
3. Sur Netlify : connecter le site à ce dépôt GitHub au lieu du dépôt manuel
4. C'est terminé — la connexion est permanente

---

## Adresse du site actuel

🌍 **https://taupe-starburst-97f87d.netlify.app**
