class vnstat::install inherits vnstat {

  package { 'vnstat':
    ensure => $package_ensure,
    name   => $package_name,
  }

}
