class vnstat::params {

  $use_vnstatd = true
  $use_vnstati = true
  $package_ensure = 'present'
  $interfaces = []
  $month_rotate = 1
  $day_format = '%x'
  $month_format = "%b '%y"
  $top_format = '%x'
  $rx_char = '%'
  $tx_char = ':'
  $rx_hour_char = 'r'
  $tx_hour_char = 't'
  $iec_units = true
  $rate_unit = 'bits'
  $output_style = 3
  $max_bandwidth = 0
  $interfaces_max_bandwidth = {}
  $sample_time = 5
  $boot_variation = 15
  $log_notraffic_days = true
  $config_template   = 'vnstat/vnstat.conf.erb'

  case $::osfamily {
    'RedHat': {
      $config = '/etc/vnstat.conf'
      $package_name   = 'vnstat'
      $database_directory = '/var/lib/vnstat'
    }
    'Debian': {
      $config = '/etc/vnstat.conf'
      $package_name   = 'vnstat'
      $database_directory = '/var/lib/vnstat'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::operatingsystem} distribution.")
    }
  }

}
