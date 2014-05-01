define vnstat::createdb ($label = undef) {

  $args = '-u -i'
  if $label {
    $args = "-u -i --nick ${label}"
  }

  exec { "create-vnstat-db-${name}":
    path => '/usr/bin:/bin',
    command => "vnstat ${args} ${name}",
    creates => "${vnstat::database_directory}/${name}",
    require => Package['vnstat'],
  }

}
