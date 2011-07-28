class httpd {

    $httpd_package = $operatingsystem ? {
        debian  => 'apache2',
        redhat  => 'httpd',
        centos  => 'httpd',
        default => 'apache2'
    }

    package { $httpd_package:
        ensure  => installed
        notify  => Service["$httpd_package"]
    }

    service { $httpd_package:
        ensure      => running,
        hasstatus   => true,
        hasrestart  => true,
        restart     => "/usr/sbin/apache2ctl graceful"
    }

}
