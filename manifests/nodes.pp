# Default node, modules that go to all nodes go here
node basenode {
    include base
    include base::edit # ugly ass hack

    if $operatingsystem == 'Debian' {
        include apt
        base::edit::line { '.bashrc':
            file    => '/root/.bashrc',
            line    => 'export LS_OPTIONS',
            ensure  => uncomment
        }
    }
    include ssh
    include logging
    include motd
    include ntp
}

node 'caprica.sudoers.org' inherits basenode{
    include httpd
    include mysql
}
