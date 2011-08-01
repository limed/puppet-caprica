class logging {

    package { 'sysklogd':
        ensure  => installed
    }

    service { 'syslogd':
        ensure  => running,
        start   => "/etc/init.d/sysklogd start",
        restart => "/etc/init.d/sysklogd restart",
        require => Package["sysklogd"]
    }
}

class logging::node inherits logging {
}
