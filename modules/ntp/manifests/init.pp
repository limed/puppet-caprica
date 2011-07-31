class ntp {

    package { [
        "ntp",
        "ntpdate"
    ]:
        ensure => installed
    }

    file { '/etc/ntp.conf':
        ensure  => present,
        owner   => root,
        group   => root,
        require => Package["ntp"],
        source  => "puppet:///files/etc/ntp.conf"
    }

    service { 'ntpd':
        ensure      => running,
        start       => "/etc/init.d/ntp start",
        restart     => "/etc/init.d/ntp restart",
        require     => Package["ntp"],
        subscribe   => File["/etc/ntp.conf"]
    }

}
