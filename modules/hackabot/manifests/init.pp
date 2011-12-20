class hackabot {
    package { [
            'bc',
            'dc',
            'python-twisted',
            'python-mysqldb',
            'libsoap-lite-perl',
            'figlet',
            'fortune',
            'liblist-moreutils-perl',
        ]:
        ensure => installed
    }
}
