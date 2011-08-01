class ssh {
    package { 'ssh':
        name    => $operatingsystem ? {
            'Debian'  => ["openssh-server", "openssh-client"],
            default => "openssh"
        },
        ensure  => present
    }

    service { 'sshd':
        ensure      => running,
        hasrestart  => true,
        hassttus    => true,
        require     => Package["ssh"]
    }
}
