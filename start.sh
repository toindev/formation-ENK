#!/bin/bash

# C'est le dossier référence d'installation
cd ~/formation-ENK

# Le premier argument du script est le nom d'hôte
export PROXY_HOST=$1

export PROXY_PORT=80

docker-compose -p enk stop
docker-compose -p enk rm -f
docker-compose -p enk up -d

# Permet de faire du nettoyage des potentiels précédents lancements, sans
# supprimer les images nécessaires (vu qu'elles sont déjà lancées)
docker system prune -f --all --volumes
