class motd {

    file { '/etc/motd':
        ensure => 'symlink',
        target => '/etc/motd.static'
    }

    file { '/etc/motd.static':
        ensure  => 'present',
        group   => 'root',
        owner   => 'root',
        source  => "puppet:///files/etc/motd.static"
    }

}
