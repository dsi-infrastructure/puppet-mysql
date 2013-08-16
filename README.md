# Installation du module

```
$ mkdir mysql
$ cd mysql
$ git clone https://github.com/sipf-infrastructure/mysql.git

```

# Utilisation

Dans le fichier '/etc/puppet/manifests/site.pp', on définit ce qui suit :
```
node test {
        class { 'mysql':
                client  => enable,
                server  => enable,
        }

#       mysql::database { 'wikimedia':
#               databasename    => wikimedia,
#               account         => wikiuser,
#               password        => password,
#               localonly       => yes
#               grant           => ["all"]
#       }

#       mysql::account { 'root':
#               status          => enable,
#               account         => root,
#               password        => toto,
#               host            => all,
#               databases       => ["wikimedia","wordpress","drupal"],
#               grant           => ["select","insert","update","delete","all"]
#       }
}
```
