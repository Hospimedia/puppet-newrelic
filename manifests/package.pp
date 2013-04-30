class newrelic::package {
    include newrelic::repository

    package { 'newrelic-sysmond':
        ensure  => latest,
        notify  => Class['newrelic::server'],
        require => Class['newrelic::repository'];
    }
}
