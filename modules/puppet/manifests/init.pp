class puppet {

    file { '/etc/puppet/puppet.conf':
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/puppet/puppet.conf"
    }

}
