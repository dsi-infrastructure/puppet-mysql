# Define: mysql::databases
# Parameters:
# arguments
#
define mysql::databases ($arguments) {

    include mysql

    exec { "command-${name}":
        unless  => "/usr/bin/mysql -u${account} -p${password} ${name}",
        command => "/usr/bin/mysql -uroot -e \"create database ${name}; grant all on ${name}.* to ${account}@localhost identified by '${password}';\"",
    }
}
