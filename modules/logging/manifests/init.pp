class logging {

    package { 'sysklogd':
        ensure  => installed
    }

    file { '/etc/syslog.conf':
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/syslog.conf"
    }

    service { 'syslogd':
        ensure      => running,
        start       => "/etc/init.d/sysklogd start",
        restart     => "/etc/init.d/sysklogd restart",
        subscribe   => File["/etc/syslog.conf"],
        require => Package["sysklogd"]
    }
}

class logging::node inherits logging {
}
