# MINI-RESEAU-SOCIAL
## Description

MiniSocial est un contrat intelligent (smart contract) décentralisé développé sur la blockchain Ethereum, permettant à des utilisateurs de publier des messages, de les commenter, et d'interagir avec ces messages via des "likes" et des "unlikes". Ce projet démontre l'utilisation de la technologie des smart contracts pour créer un réseau social basique sur la blockchain. Le projet inclut des fonctionnalités telles que la publication de messages, l'ajout de commentaires, le like et l'unlike de posts et de commentaires.

### Fonctionnalités

- **Publier un message** : Les utilisateurs peuvent publier un message avec une longueur limitée (maximum 140 caractères).
- **Lire un message** : Les utilisateurs peuvent consulter un message spécifique.
- **Total des messages** : Fonction pour obtenir le nombre total de messages publiés.
- **Commenter un message** : Les utilisateurs peuvent ajouter des commentaires aux messages.
- **Likes sur les messages** : Les utilisateurs peuvent aimer ou ne pas aimer un message.
- **Likes sur les commentaires** : Les utilisateurs peuvent aimer ou ne pas aimer un commentaire.
- **Suppression de posts et de commentaires** : Les utilisateurs peuvent supprimer leurs propres posts et commentaires.

## Structure du Smart Contract

### Structures de données

- **Post** : Représente un message publié par un utilisateur. Il contient les informations suivantes :
  - `id`: Identifiant unique du message.
  - `message`: Le contenu du message.
  - `author`: L'adresse de l'auteur du message.
  - `likeCount`: Le nombre de likes sur le message.
  - `commentCount`: Le nombre de commentaires associés au message.
  - `exists`: Un booléen indiquant si le message est actif.

- **Comment** : Représente un commentaire sur un post. Il contient les informations suivantes :
  - `author`: L'adresse de l'auteur du commentaire.
  - `content`: Le contenu du commentaire.
  - `num_likes_com`: Le nombre de likes sur le commentaire.
  - `exists`: Un booléen indiquant si le commentaire est actif.

### Fonctionnalités

1. **publishPost** : Permet aux utilisateurs de publier un message. Ce message est ajouté à la liste des posts.
   
2. **likePost** : Permet aux utilisateurs de liker ou de retirer un like sur un post existant.

3. **addComment** : Permet aux utilisateurs d'ajouter un commentaire à un message spécifique.

4. **likeComment** : Permet aux utilisateurs de liker ou de retirer un like sur un commentaire existant.

5. **deletePost** : Permet aux utilisateurs de supprimer leurs propres posts.

6. **deleteComment** : Permet aux utilisateurs de supprimer leurs propres commentaires.

7. **getPost** : Récupère les détails d'un message spécifique (message, auteur, likes, commentaires, etc.).

8. **getComment** : Récupère les détails d'un commentaire spécifique.

9. **getTotalPosts** : Retourne le nombre total de posts publiés.

10. **getCommentCount** : Retourne le nombre de commentaires d'un post spécifique.

## Déploiement sur le Réseau Ethereum

### Outils nécessaires

- **MetaMask** : Extension pour interagir avec la blockchain Ethereum.
- **Remix IDE** : Environnement de développement intégré pour écrire, déployer et tester des smart contracts Solidity.
