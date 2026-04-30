# Migration Netlify → GitHub Pages
**Date : 28 avril 2026**

---

## Pourquoi cette migration ?

Le site Netlify a été **suspendu automatiquement** car il avait atteint les limites du plan gratuit (100 GB de bande passante/mois). Message affiché : *"Site not available — This site was paused as it reached its usage limits."*

---

## Qu'est-ce qu'un site statique ?

Le site Collection Européenne est un **site statique** : uniquement des fichiers HTML, CSS et JS. Pas de base de données, pas de serveur. C'est parfait pour GitHub Pages qui est fait exactement pour ça.

---

## Pourquoi GitHub Pages ?

| Critère | Netlify (avant) | GitHub Pages (maintenant) |
|---|---|---|
| Bande passante | 100 GB/mois (limité) | 100 GB/mois (très généreux) |
| Déploiement | git push → Netlify | git push → GitHub |
| Configuration | Compte externe à lier | Intégré à GitHub |
| Coût | Gratuit (limité) | Gratuit pour tous |
| Commandes Git | Inchangées | **Identiques** |

---

## Ce qui a été fait

### 1. Modification du code
- Mise à jour du commentaire dans `index.html` :
  - Avant : `<!-- Déploiement automatique via GitHub → Netlify -->`
  - Après : `<!-- Déploiement automatique via GitHub Pages -->`

### 2. Activation de GitHub Pages
1. GitHub.com → dépôt `Lindien99/mon-site-YH`
2. Onglet **Settings** → menu gauche **Pages**
3. Source : **Deploy from a branch**
4. Branch : **main** / Dossier : **/ (root)**
5. Clic sur **Save** → message *"GitHub Pages source saved."*

### 3. Push vers GitHub
```
git add .
git commit -m "Migration Netlify → GitHub Pages"
git push
```

---

## Nouvelle URL du site

**https://lindien99.github.io/mon-site-YH**

*(L'ancienne URL Netlify `taupe-starburst-97f87d.netlify.app` n'est plus utilisée)*

---

## Workflow désormais (inchangé !)

À chaque modification du site :
```
git add .
git commit -m "description du changement"
git push
```
→ GitHub Pages met le site à jour **automatiquement**.
