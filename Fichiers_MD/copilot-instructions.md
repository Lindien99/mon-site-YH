# Directives du projet — Collection Européenne (Yvon H.)

## Contexte
Site web statique de guides interactifs sur les pays d'Europe.
- **Déploiement** : GitHub (`Lindien99/mon-site-YH`) → Netlify automatique
- **URL** : https://taupe-starburst-97f87d.netlify.app
- **Langue** : tout le code et les réponses sont en français

## Structure
- `index.html` + `style.css` + `script.js` — page d'accueil avec grille des pays
- `pays/NOM-PAYS.html` — une page par pays (18 pays européens)
- Pas de framework, pas de bundler : HTML/CSS/JS pur

## Style visuel (CSS variables — `style.css`)
| Variable | Valeur | Usage |
|---|---|---|
| `--couleur-or` | `#d4af37` | Titres, bordures, accents |
| `--fond-sombre` | `#1a1a1a` | Fond général |
| `--parchemin` | `#f4e4bc` | Texte, cartes |
| `--texte-sombre` | `#2c2c2c` | Texte sur fond clair |

Pages pays : fond `#04060e`, or `#c9a84c`, police `Playfair Display` + `Cormorant Garamond`.

## Conventions des pages pays
- Même structure `<head>` avec Google Fonts + Leaflet CSS
- Carte Leaflet interactive (`#leaflet-map`, hauteur 710px)
- Grille de monuments (`.monument-card`) avec animation CSS
- Tout le CSS est inline dans `<style>` dans chaque page pays

## Git & Déploiement
- Commandes habituelles : `git add .`, `git commit -m "..."`, `git push`
- Chaque push sur `main` déclenche un déploiement automatique Netlify
- Ne jamais faire de `git push --force` sans confirmation

## Règles de codage
- Pas de framework JS externe (sauf Leaflet déjà présent)
- Conserver la cohérence visuelle entre toutes les pages pays
- Toujours tester le rendu mobile (viewport `width=device-width`)
