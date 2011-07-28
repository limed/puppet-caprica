# Default node, modules that go to all nodes go here
node basenode {
    include base

    if $operatingsystem == 'debian' {
        include apt
    }

    include motd
}

node 'caprica.sudoers.org' inherits basenode{
    include httpd
}
