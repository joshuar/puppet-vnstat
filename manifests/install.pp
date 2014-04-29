class vnstat::install inherits vnstat {

  package { 'vnstat':
    ensure => $package_ensure,
    name   => $package_name,
  }

  if $vnstati_package_ensure && $vnstati_package_name {
    package { 'vnstati':
      ensure => $vnstati_package_ensure,
      name   => $vnstati_package_name,
    }
  }

}
