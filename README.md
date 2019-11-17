# Ingestion du dataset des mails Enron

## Création des VM sur Azure pour le TP

* Se connecter au shell Azure
* Cloner ce repository
* Se placer dans le dossier Azure
* Éditer le fichier hostnames avec le bon nombre d'hôtes selon le nombre de participants
* Lancer le script `create_and_start_vms.sh`

## Détails des rôles des scripts

* `create_vms.sh` crée une machine virtuelle avec en argument son nom d'hôte, depuis l'image préparée en amont.
* `start_remote_vm.sh` démarre les processus Docker sur la machine créée
* `create_and_start_vms.sh` lit les noms d'hôtes dans le fichier hostnames et crée et démarre les VMs.

## URL des services

Les services devraient être disponibles aux adresses suivantes (adapter l'IP) :

* NiFi http://hostname.northeurope.cloudapp.azure.com/nifi/
* Kibana : http://hostname.northeurope.cloudapp.azure.com/kibana
* ElasticSearch : http://hostname.northeurope.cloudapp.azure.com/elastic

## Récupérer le dataset Enron

https://drive.google.com/open?id=1GakX7-xa4GqNJ4WzaZdZmjRtaRsWi9qX

Le dataset est déjà présent dans le container NiFi pour faciliter son accès.

## Installer le processor Apache OpenNLP pour Nifi

```
#Copier le script d'installation dans le conteneur
docker cp nifi-open-nlp-setup.sh enron_nifi_1:/nifi_data

#Lancer le script d'installation
docker exec -ti enron_nifi_1 bash /nifi_data/nifi-open-nlp-setup.sh

#Redémarrer le conteneur NiFi
docker restart enron_nifi_1
```

# Expression régulière extract body

Cette expression permet de faire un prétraitement sur le contenu du dataset. 

Il est important de se souvenir que beaucoup de soucis peuvent provenir du formatage de
la donnée !

```
^$\n(.*)
```

## Configuration du processeur Jolt

Parce que cela prend du temps à déterminer autrement, le TP est déjà bien chargé.

```
[
  {
    "operation": "shift",
    "spec": {
      "email.headers.from.*": "from",
      "email.headers.to.*": "to",
      "email.headers.cc.*": "cc",
      "email.headers.bcc.*": "bcc",
      "email.headers.sent_date": "sent_date",
      "email.headers.subject": "subject",
      "email.body": "body",
      "names": "names",
      "locations": "locations"
    }
  }
]
```
