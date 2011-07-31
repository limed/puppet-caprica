class apt {

    file { '/etc/cron.daily/package.list':
        owner   => root,
        group   => root,
        mode    => 755,
        source  => "puppet:///files/etc/cron.daily/package.list"
    }

    file { "/etc/apt/sources.list":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => $lsbdistcodename ? {
            "squeeze"   => "puppet:///files/etc/apt/sources.list.squeeze",
            default     => "puppet:///files/etc/apt/sources.list.squeeze"
        }
    }

    file { '/etc/apt/apt.conf.d/10puppet' :
        ensure  => present,
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/apt/apt.conf.d/10puppet"
    }

    file { '/usr/local/sbin/check-updates':
        owner   => root,
        group   => root,
        mode    => 755,
        source  => "puppet:///files/usr/local/bin/check-updates"
    }

    exec { 'apt-update':
        command     => "/usr/bin/apt-get -qq update",
        logoutput   => false,
        refreshonly => true,
        subscribe   => [File["/etc/apt/sources.list"]]
    }

}
