class resolv {
    define resolv_conf ($domain, $nameserver) {
        file { '/etc/resolv.conf':
            owner   => root,
            group   => root,
            mode    => 644,
            path    => "/etc/resolv.conf",
            content => template("templates/etc/resolv.conf.erb")
        }
    }
}
