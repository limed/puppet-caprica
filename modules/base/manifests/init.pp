class base {

    packages { [
        "vim",
        "htop",
        "lsof",
        "pwgen",
        "puppet",
        "strace",
        "sysstate",
        "lsb-release"
    ]:
        ensure => installed
    }

    file { '/root/.vimrc':
        owner => root, group => root, mode => 644,
        source => "puppet://${policy_host}/files/root/dot.vimrc"
    }

}
