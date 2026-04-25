# 📘 GitHub Docs — Résumé Visuel
> **Une seule page • Ultra clair • Couleurs modernes**
---

## 🗂️ STRUCTURE D'UN DÉPÔT (Repository)

| Élément | Rôle |
|---|---|
| `README.md` | Page d'accueil du projet (visible automatiquement) |
| `.gitignore` | Fichiers à ne PAS versionner (ex : node_modules/) |
| `LICENSE` | Type de licence du projet |
| `branches` | Versions parallèles du code |
| `commits` | Instantanés sauvegardés de l'historique |
| `tags` | Marquer une version stable (ex : v1.0) |

---

## ⚡ COMMANDES GIT ESSENTIELLES

```bash
# Initialiser / Cloner
git init                        # Nouveau dépôt local
git clone <url>                 # Copier un dépôt distant

# Sauvegarder
git add .                       # Tout préparer
git commit -m "message"         # Sauvegarder avec message
git push                        # Envoyer vers GitHub

# Récupérer
git pull                        # Récupérer les dernières modifs

# Branches
git branch ma-branche           # Créer une branche
git checkout ma-branche         # Changer de branche
git merge ma-branche            # Fusionner dans la branche active
```

---

## 🌿 WORKFLOW BRANCHES — Le cycle classique

```
main ──────●──────────────────────●── (stable)
            \                    /
feature      ●────●────●────●───/   (développement)
```

| Étape | Action |
|---|---|
| **1. Créer** | `git checkout -b ma-feature` |
| **2. Coder** | Faire les modifications |
| **3. Commit** | `git add . && git commit -m "..."` |
| **4. Pousser** | `git push origin ma-feature` |
| **5. PR** | Ouvrir une Pull Request sur GitHub |
| **6. Merger** | Fusionner dans `main` après relecture |

---

## 🔀 PULL REQUESTS (PR)

> Une PR = demande de fusionner une branche dans une autre.

- **Draft PR** → En cours, pas prête à être relue
- **Review required** → Un relecteur doit approuver
- **Merge** → 3 modes : *Merge commit* / *Squash* / *Rebase*
- **Close** → Abandon sans fusion

💡 *Toujours lier une PR à une Issue avec `Closes #42` dans la description.*

---

## 🐛 ISSUES — Suivi des tâches

| Fonctionnalité | Usage |
|---|---|
| **Labels** | Catégoriser (bug 🔴, enhancement 🟢, docs 🔵) |
| **Milestones** | Regrouper les issues par version / sprint |
| **Assignees** | Qui travaille dessus |
| **Templates** | Formulaire standard pour signaler un bug |

**Mots-clés pour fermer une Issue automatiquement dans un commit/PR :**
`Closes #n` • `Fixes #n` • `Resolves #n`

---

## ⚙️ GITHUB ACTIONS — Automatisation CI/CD

```yaml
# .github/workflows/deploy.yml
name: Déploiement
on:
  push:
    branches: [main]        # Se déclenche à chaque push sur main

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Build
        run: npm run build
```

| Terme | Signification |
|---|---|
| **Workflow** | Le fichier YAML d'automatisation |
| **Job** | Groupe d'étapes qui tourne sur une machine |
| **Step** | Une action ou commande dans un job |
| **Trigger** | Ce qui déclenche le workflow (`push`, `PR`, `schedule`…) |
| **Runner** | La machine virtuelle qui exécute le job |

---

## 🌐 GITHUB PAGES — Site statique gratuit

| Étape | Détail |
|---|---|
| **Activer** | Settings → Pages → Source → `main` / `/root` |
| **URL auto** | `https://username.github.io/nom-du-repo` |
| **Domaine custom** | Ajouter un CNAME + configurer chez le registrar |
| **Déploiement** | Automatique à chaque push sur la branche choisie |

---

## 🔐 SÉCURITÉ & PERMISSIONS

| Rôle | Droits |
|---|---|
| **Read** | Voir le code, cloner, ouvrir Issues |
| **Triage** | + Gérer Issues & PR |
| **Write** | + Push sur les branches |
| **Maintain** | + Paramètres du dépôt (sans suppression) |
| **Admin** | Contrôle total |

- 🔑 **Secrets** → `Settings → Secrets` (variables d'environnement chiffrées pour Actions)
- 🛡️ **Branch protection** → Empêcher les push directs sur `main`

---

## ⌨️ RACCOURCIS CLAVIER GITHUB

| Touche | Action |
|---|---|
| `T` | Chercher un fichier dans le dépôt |
| `G` `C` | Aller aux commits |
| `G` `I` | Aller aux Issues |
| `G` `P` | Aller aux Pull Requests |
| `.` | Ouvrir dans VS Code web (vscode.dev) |
| `Ctrl + K` | Palette de commandes GitHub |

---

## 🔗 LIENS UTILES

| Ressource | URL |
|---|---|
| Documentation officielle | https://docs.github.com |
| GitHub Skills (tutoriels) | https://skills.github.com |
| GitHub Status | https://githubstatus.com |
| Markdown Guide | https://docs.github.com/fr/get-started/writing-on-github |

---

> *Fiche créée le 25 avril 2026 • Projet Collection Européenne — Yvon H.*
