class base {

    package { [
        "vim",
        "htop",
        "lsof",
        "mailx",
        "pwgen",
        "puppet",
        "php5-sqlite",
        "strace",
        "sysstat",
        "lsb-release"
    ]:
        ensure => installed
    }

    file { '/root/.vimrc':
        owner => root,
        group => root,
        mode => 644,
        source => "puppet:///files/root/dot.vimrc"
    }

    file { '/etc/cron.daily/garbagecollector':
        owner   => root,
        group   => root,
        mode    => 755,
        source  => "puppet:///files/etc/cron.daily/garbagecollector"

    }

    file { '/usr/local/bin/payment-reminder':
        owner   => root,
        group   => root,
        mode    => 755,
        source  => "puppet:///files/usr/local/bin/payment-reminder"
    }

    #tidy { '/tmp':
    #    age     => '1w',
    #    recurse => true
    #}
}
