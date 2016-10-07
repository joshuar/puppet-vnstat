define vnstat::createdb (
  $user,
  $label = undef,
) {

  $args = '-u -i'
  if $label {
    $args = "-u -i --nick ${label}"
  }

  exec { "create-vnstat-db-${name}":
    path    => 'usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    command => "vnstat ${args} ${name}",
    creates => "${vnstat::database_directory}/${name}",
    user    => $user,
    require => Package['vnstat'],
  }

}
