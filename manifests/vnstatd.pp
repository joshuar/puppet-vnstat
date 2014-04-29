class vnstat::vnstatd (

  $service_name = $vnstat::vnstatd::params::service_name,
  $log_file = $vnstat::vnstatd::params::log_file,
  $pid_file = $vnstat::vnstatd::params::pid_file,
  $update_interval = $vnstat::vnstatd::params::update_interval,
  $poll_interval = $vnstat::vnstatd::params::poll_interval,
  $save_interval = $vnstat::vnstatd::params::save_interval,
  $offline_save_interval = $vnstat::vnstatd::params::offline_save_interval,
  $saveonstatuschange = $vnstat::vnstatd::params::saveonstatuschange,
  $logging_target = $vnstat::vnstatd::params::logging_target,
  
  ) inherits vnstat::vnstatd::params {

    validate_bool($service_enable)
    validate_string($service_ensure)
    validate_string($service_name)
    validate_absolute_path($log_file)
    validate_absolute_path($pid_file)
    validate_bool($saveonstatuschange)
    validate_re($logging_target, [ '^syslog', '^logfile', '^none' ])

    if ! ($service_ensure in [ 'running', 'stopped' ]) {
      fail('service_ensure parameter must be running or stopped')
    }
    
    service { 'vnstat':
      ensure     => $service_ensure,
      enable     => $service_enable,
      name       => $service_name,
      hasstatus  => true,
      hasrestart => true,
    }
    
  }
