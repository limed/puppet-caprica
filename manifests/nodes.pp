# Default node, modules that go to all nodes go here
node basenode {
    include base
}

node 'caprica.sudoers.org' inherits basenode{
}
