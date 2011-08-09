class hackabot {
    package { [
            'bc',
            'dc',
            'python-twisted',
            'python-mysqldb',
            'libsoap-lite-perl',
            'figlet'
        ]:
        ensure => installed
    }
}
