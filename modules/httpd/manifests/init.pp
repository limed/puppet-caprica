class httpd {

    $httpd_package = $operatingsystem ? {
        debian  => 'apache2',
        redhat  => 'httpd',
        centos  => 'httpd',
        default => 'apache2'
    }

    package { $httpd_package:
        ensure  => installed,
        notify  => Service["$httpd_package"]
    }

    package { 'cronolog':
        ensure  => installed
    }

    service { $httpd_package:
        ensure      => running,
        hasstatus   => true,
        hasrestart  => true,
        restart     => "/usr/sbin/apache2ctl graceful"
    }

}

class httpd::vhost inherits httpd {
}

class httpd::mod inherits httpd {
}
