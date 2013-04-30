class newrelic::repository {
    case $::operatingsystem {
        debian, ubuntu : {            
            exec { 'NR_Add_Key':
                unless  => '/usr/bin/apt-key list | /bin/grep -q 1024D/548C16BF',
                command => '/usr/bin/apt-key adv --keyserver hkp://subkeys.pgp.net --recv-keys 548C16BF',
            }

            exec { 'NR_Add_Repo':
                creates => '/etc/apt/sources.list.d/newrelic.list',
                command => '/usr/bin/wget -O /etc/apt/sources.list.d/newrelic.list http://download.newrelic.com/debian/newrelic.list',
            }

            exec { 'NR_Aptitude_Update':
                refreshonly => true,
                subscribe   => [Exec['NR_Add_Key'], Exec['NR_Add_Repo']],
                command     => '/usr/bin/aptitude update',
            }
        }
        darwin : {
        }
    }
}
