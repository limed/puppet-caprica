class ssh {
    package { 'ssh':
        name    => $operatingsystem ? {
            'Debian'  => ["openssh-server", "openssh-client"],
            default => "openssh"
        },
        ensure  => present
    }

    service { 'ssh':
        ensure      => running,
        hasrestart  => true,
        hasstatus    => true,
        require     => Package["ssh"]
    }
}
