# Default node, modules that go to all nodes go here
node basenode {
    include base

    if $operatingsystem == 'Debian' {
        include apt
    }

    include motd
    include ntp
}

node 'caprica.sudoers.org' inherits basenode{
    include httpd
    include mysql
}
