FROM jenkins/jenkins:lts

USER root

# Mettre à jour les packages
RUN apt-get update

# Installer Maven
RUN apt-get install -y maven

# Installer les dépendances nécessaires
RUN apt-get install -y \
    wget \
    gnupg2 \
    unzip \
    curl \
    ca-certificates

# Ajouter la clé GPG de Google Chrome (nouvelle méthode)
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | \
    gpg --dearmor -o /usr/share/keyrings/google-chrome-keyring.gpg

# Ajouter le repository Chrome
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | \
    tee /etc/apt/sources.list.d/google-chrome.list

# Installer Google Chrome
RUN apt-get update && apt-get install -y google-chrome-stable

# Nettoyer le cache APT pour réduire la taille de l'image
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

USER jenkins