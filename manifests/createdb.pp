define vnstat::createdb {

  exec { "create-vnstat-db-${name}":
    path => '/usr/bin:/bin',
    command => "vnstat -u -i ${name}",
    creates => "${vnstat::database_directory}/${name}",
    require => Package['vnstat'],
  }
  
}
