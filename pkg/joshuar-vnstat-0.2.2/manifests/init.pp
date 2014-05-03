class vnstat (
  $use_vnstatd        = $vnstat::params::use_vnstatd,
  $use_vnstati        = $vnstat::params::use_vnstati,
  $package_ensure     = $vnstat::params::package_ensure,
  $package_name       = $vnstat::params::package_name,
  $interfaces         = $vnstat::params::interfaces ,
  $config             = $vnstat::params::config,
  $config_template    = $vnstat::params::config_template,
  $database_directory = $vnstat::params::database_directory,
  $month_rotate       = $vnstat::params::month_rotate,
  $day_format         = $vnstat::params::day_format,
  $month_format       = $vnstat::params::month_format,
  $top_format         = $vnstat::params::top_format,
  $rx_char            = $vnstat::params::rx_char,
  $tx_char            = $vnstat::params::tx_char,
  $rx_hour_char       = $vnstat::params::rx_hour_char,
  $tx_hour_char       = $vnstat::params::tx_hour_char,
  $iec_units          = $vnstat::params::iec_units,
  $rate_unit          = $vnstat::params::rate_unit,
  $output_style       = $vnstat::params::output_style,
  $max_bandwidth      = $vnstat::params::max_bandwidth,
  $sample_time        = $vnstat::params::sample_time,
  $boot_variation     = $vnstat::params::boot_variation,
  $log_notraffic_days = $vnstat::params::log_notraffic_days,
  
  ) inherits vnstat::params {

    validate_bool($use_vnstati)
    validate_bool($use_vnstatd)
    validate_string($package_ensure)
    validate_string($package_name)
    validate_array($interfaces)
    validate_absolute_path($database_directory)
    validate_absolute_path($config)
    validate_string($config_template)
    validate_re($month_rotate, ['^\d+$', ''])
    validate_re($day_format, ['^%.+$', ''])
    validate_re($month_format, ['^%.+$', ''])
    validate_re($top_format, ['^%.+$', ''])
    validate_re($rx_char, ['^\w$', ''])
    validate_re($tx_char, ['^\w$', ''])
    validate_re($rx_hour_char, ['^\w$', ''])
    validate_re($tx_hour_char, ['^\w$', ''])
    validate_bool($iec_units)
    validate_re($rate_unit, [ '^bits', '^bytes' ])
    validate_bool($log_notraffic_days)

    contain vnstat::vnstatd
    contain vnstat::vnstati
    
    anchor { 'vnstat::begin': } ->
    class { '::vnstat::install': } ->
    class { '::vnstat::config': } ->
    anchor { 'vnstat::end': }


}
