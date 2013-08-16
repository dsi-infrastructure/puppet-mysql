# Class: mysql
#
#
class mysql(
    $client   = hiera('mysql::client'),
    $server   = hiera('mysql::server'),
    $password = hiera('mysql::password')
    ) {
    
    if $client == 'enable' {
        package { 'mysql-client':
            ensure  => installed
        }
    }

    if $server == 'enable' {

        file { '/var/preseed':
            ensure => directory,
            owner  => root,
            group  => root,
            mode   => 770,
        }

        file { '/var/preseed/mysql.preseed':
            ensure  => file,
            owner   => root,
            group   => root,
            mode    => 770,
            content => template("mysql/mysql.preseed.erb"),
        }

        package { 'mysql-server':
            ensure       => installed,
            responsefile => "/var/preseed/mysql.preseed",
        }

        file { '/etc/my.cnf':
            notify  => service["mysql"],
            ensure  => file,
            require => Package['mysql-server'],
            owner   => root,
            group   => root,
            mode    => 644,
            source  => "puppet:///modules/mysql/my.cnf",
        }

        service { 'mysql':
            ensure  => running,
            enable  => true,
            require => Package['mysql-server'],
        }

        File['/var/preseed'] ->
        File['/var/preseed/mysql.preseed'] ->
        Package['mysql-server']
    }
}
