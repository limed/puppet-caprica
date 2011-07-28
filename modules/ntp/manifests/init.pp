class ntp {

    package{ [
        "ntp",
        "ntpdate"
    ]:
        ensure => installed
    }

    service { 'ntpd':
        ensure      => running,
        hasstatus   => true,
        hasrestart  => true,
        start       => "/etc/init.d/ntp start",
        restart     => "/etc/init.d/ntp restart",
        require     => Package["ntp"]
    }

}
