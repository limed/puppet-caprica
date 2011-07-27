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
        owner => root, group => root, mode => 644,
        source => "puppet:///files/root/dot.vimrc"
    }

}
