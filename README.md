# Projet E-commerce PHP/MySQL – Conteneurisation avec Docker

## Présentation
Ce projet est une application e-commerce développée en PHP avec une base de données MySQL. L'environnement de développement et de déploiement est entièrement conteneurisé grâce à Docker.

---

## Prérequis
- [Docker](https://www.docker.com/products/docker-desktop) installé
- [Docker Compose](https://docs.docker.com/compose/) installé
- (Optionnel) [XAMPP](https://www.apachefriends.org/fr/index.html) pour MySQL local

---

## Structure du projet
- `Dockerfile` : Image PHP/Apache personnalisée
- `docker-compose.yml` : Orchestration des services
- `site_connection.php` : Connexion à la base de données
- `mail/` : Gestion des emails (PHPMailer)
- `Databse (XAMPP).sql` : Dump de la base de données

---

## Lancement rapide

1. **Cloner le projet**
   ```bash
   git clone <repo-url>
   cd projet_Ecommerce
   ```

2. **Configurer la base de données**
   - Importez le fichier `Databse (XAMPP).sql` dans votre MySQL local (XAMPP ou autre).
   - Vérifiez que la base `pratik_ecommerce_project` existe et contient les tables.

3. **Configurer les variables d'environnement**
   Créez un fichier `.env` (optionnel) ou modifiez `docker-compose.yml` :
   ```env
   MYSQL_HOST=host.docker.internal
   MYSQL_USER=root
   MYSQL_PASSWORD=
   MYSQL_DATABASE=pratik_ecommerce_project
   ```

4. **Lancer l'application**
   ```bash
   docker-compose up --build
   ```
   Accédez à [http://localhost:8080](http://localhost:8080)

---

## Sécurité & Bonnes pratiques
- **Ne jamais utiliser root sans mot de passe en production**
- Utiliser un utilisateur MySQL dédié avec des droits limités
- Stocker les secrets dans un fichier `.env` (non versionné)
- Garder Docker, PHP, Apache et MySQL à jour
- Désactiver l'affichage des erreurs PHP en production
- Utiliser HTTPS en production (voir Traefik ou Nginx en reverse proxy)
- Sauvegarder régulièrement la base de données

---

## Commandes utiles

- **Voir les conteneurs actifs**
  ```bash
  docker ps
  ```
- **Arrêter les conteneurs**
  ```bash
  docker-compose down
  ```
- **Accéder au shell du conteneur**
  ```bash
  docker exec -it <nom_conteneur> bash
  ```
- **Voir les logs**
  ```bash
  docker logs <nom_conteneur>
  ```

---

## Dépannage
- **Erreur de connexion MySQL** : Vérifiez que MySQL est bien démarré sur votre machine hôte et que les identifiants sont corrects.
- **Problème de droits** : Vérifiez les permissions des fichiers et dossiers (utilisateur www-data dans le conteneur).
- **Problème de dépendances PHP** : Exécutez `composer install` dans le dossier `mail/`.

---

## Aller plus loin
- Ajouter Xdebug pour le débogage
- Ajouter un reverse proxy (Nginx, Traefik) pour HTTPS
- Déployer sur un cloud (AWS, Azure, GCP)
- Mettre en place CI/CD (GitHub Actions, GitLab CI)

---

## Auteur
- Abdelwahid Amdjar
- Projet pédagogique – 2024
