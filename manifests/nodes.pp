# Default node, modules that go to all nodes go here
node default {
    include base

    if $operatingsystem == 'Debian' {
        include apt
    }
    include ssh
    include logging
    include motd
    include ntp
}

node 'caprica.sudoers.org' inherits default{
    include httpd
    include mysql

    package { 'python-twisted':
        ensured => installed
    }
}
