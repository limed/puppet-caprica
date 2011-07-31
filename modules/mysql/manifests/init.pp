class mysql {

    package { 'mysql-server':
        ensure => installed
    }

    package { 'mysql-client':
        ensure  => installed
    }

    service { 'mysqld':
        ensure      => running,
        hasrestart  => true,
        hasstatus   => true,
        start       => "/etc/init.d/mysql start",
        restart     => "/etc/init.d/mysql restart",
        require     => Package["mysql-server"]
    }
}
