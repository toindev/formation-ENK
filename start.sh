#!/bin/bash

# À modifier avec l'IP ou le nom d'hôte de la machine
export PROXY_HOST=enk00.northeurope.cloudapp.azure.com

export PROXY_PORT=80

docker-compose -p enk stop
docker-compose -p enk rm
docker-compose -p enk up -d

#Permet de faire du nettoyage des potentiels précédents lancements, sans
#supprimer les images nécessaires (vu qu'elles sont déjà lancées)
docker system prune --all --volumes
