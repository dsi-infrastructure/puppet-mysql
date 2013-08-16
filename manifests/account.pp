# Define: mysql::account
# Parameters:
# arguments
#
define mysql::account (
    $database,
    $password) {
    
    include mysql

    exec { "command-${database}-${name}":
        unless  => "/usr/bin/mysql -u${name} -p${password} ${database}",
        command => "/usr/bin/mysql -uroot -e \"grant all on ${database}.* to ${name}@localhost identified by '${password}';\"",
    }
}

