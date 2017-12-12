# Ingestion du dataset des mails Enron

## Installation de docker

### Windows 7 

Docker toolbox : https://download.docker.com/win/stable/DockerToolbox.exe

### Windows 10

Docker for Windows : https://docs.docker.com/docker-for-windows/install/

### Linux et Mac

Les moteurs de recherche sont là pour vous :)

## Configuration de la machine docker

* Avec docker-toolbox pour Mac ou Windows, utilisant VirtualBox

`docker-machine create -d virtualbox --virtualbox-memory "8192" default`

* Avec Docker for Windows

Voir dans les paramètres de Docker pour passer la VM à 8GB de RAM.

* Linux 

Pas de VM, on tourne dans le même noyau

* Docker for Mac 

???

## Installation de docker-compose

Si docker-compose n'est pas installé par la distribution de Docker : 

https://docs.docker.com/compose/install/#install-compose

## Lancer les conteneurs

* Lancement dans le dossier contenant le docker-compose.yaml ``docker-compose -p enron up -d``
* Compter un certain temps pour télécharger toutes les images lors du premier lancement (2-3 GB)
* Récupérer l'IP de l'hôte docker (hors linux, où il s'agit de localhost) ``docker-machine ip default``

Les services devraient être disponibles aux adresses suivantes (adapter l'IP) :

* Nifi http://192.168.99.100:8080/nifi/
* Kibana : http://192.168.99.100:5601/
* Cerebro : http://192.168.99.100:9000
* ElasticSearch : http://192.168.99.100:9200/

## Récupérer le dataset Enron

https://drive.google.com/open?id=1GakX7-xa4GqNJ4WzaZdZmjRtaRsWi9qX

## Préparer le dataset Enron pour l'ingestion

* Copier le tar dans le volume de données de Nifi : `docker cp enron_small.tgz enron_nifi_1:/nifi_data/`
* Changer le propriétaire des fichiers dans le volume : `docker exec -u 0 -ti enron_nifi_1 chown -R nifi:nifi /nifi_data`
* Décompresser les données : `docker exec -ti enron_nifi_1 tar -xf /nifi_data/enron_small.tgz -C /nifi_data`
* Vérification ``docker exec -ti enron_nifi_1 ls /nifi_data/maildir ` devrait donner quelque chose de ressemblant au bloc ci-dessous :

```
allen-p      fischer-m       kitchen-l        phanis-s       smith-m
arnold-j     forney-j        kuykendall-t     pimenov-v      solberg-g
arora-h      fossum-d        lavorato-j       platter-p      south-s
badeer-r     gang-l          lay-k            presto-k       staab-t
```

