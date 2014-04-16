## Utilisation du module

* Ce module utilise les "hiera", veuillez créer un répertoire "mysql" dans le dossier hieradata.
* Dans ce nouveau répertoire veuillez créer un fichier portant le nom suivant : srv1.dev.yaml
* Ce fichier doit contenir ce qui suit :

```
---
mysql::client   : 'enable'
mysql::server   : 'disabled'
mysql::password : 'PASSWORD'
```
Remarque : les variables mysql::client et mysql::server permettent d'activer, respectivement, l'installation des outils clientes ou du serveur de base de donnée.
