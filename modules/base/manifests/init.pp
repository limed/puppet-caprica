class base {

    package { [
        "vim",
        "htop",
        "lsof",
        "pwgen",
        "puppet",
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

    tidy { '/tmp':
        age     => '1w',
        recurse => true
    }
}
