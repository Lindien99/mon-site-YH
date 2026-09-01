# Conseils pour mon-site-YH

## Ajouter plusieurs tableaux efficacement

1. Créer ou terminer plusieurs fichiers HTML dans leur dossier de catégorie.
2. Demander en une seule fois :

   > Ajoute les liens de ces nouveaux tableaux à leurs index de catégorie, vérifie-les, puis fais un seul `git add -A`, un seul commit et un seul `git push`.

3. Vérifier que chaque nouvelle carte utilise le bon nom de fichier dans son `href`.

Cela produit un historique Git plus clair et évite de multiplier les demandes.

## Comprendre les lettres dans VS Code

- `U` : fichier nouveau, pas encore suivi par Git.
- `M` : fichier modifié depuis le dernier commit.
- Après `git add`, `git commit` et `git push`, les indicateurs disparaissent si tout est publié.

## Publier sur GitHub Pages

Depuis le dossier `mon-site-YH`, la séquence est toujours :

```powershell
git add -A
git commit -m "Description courte de la modification"
git push
```

GitHub Pages publie ensuite les fichiers du dépôt. La mise à jour peut prendre quelques minutes.

## Vérifier avant de publier

- Ouvrir le fichier HTML dans le navigateur.
- Cliquer sur le bouton de retour vers l'index de catégorie.
- Cliquer sur la nouvelle carte depuis l'index de la catégorie.
- Vérifier qu'il n'y a pas d'erreur dans le panneau Problems de VS Code.

## Bien formuler une demande à l'agent

Pour une tâche simple :

> Ajoute les liens des nouveaux fichiers HTML à l'index concerné, vérifie qu'il n'y a pas d'erreur, puis publie avec Git.

Pour une tâche plus importante, préciser :

- les fichiers concernés ;
- le résultat attendu ;
- si la publication GitHub Pages doit être faite ;
- le texte souhaité pour le commit, si tu en as un.

## Économiser les crédits

- Regrouper plusieurs nouveaux tableaux dans une même demande.
- Utiliser le modèle `Auto` pour les ajouts, liens et publications habituels.
- Réserver les modèles premium aux corrections difficiles, aux grosses refontes et aux analyses complexes.
- Donner une demande précise pour éviter les allers-retours.

## Quelques bonnes habitudes

- Garder des noms de fichiers simples et cohérents, par exemple `50_Nom_Du_Tableau.html`.
- Conserver le même dossier pour un tableau et son index de catégorie.
- Ne pas renommer un fichier déjà publié sans corriger les liens qui pointent vers lui.
- Faire un commit après une série de modifications cohérentes.
- Ne pas s'inquiéter d'un `U` : il indique seulement qu'un nouveau fichier attend d'être ajouté à Git.
