class vnstat::vnstatd::params inherits vnstat {

  $update_interval = 30
  $poll_interval = 5
  $save_interval = 5
  $offline_save_interval = 30
  $saveonstatuschange = true
  $logging_target = 'syslog'

  if $vnstat::use_vnstatd {
    $service_enable = true
    $service_ensure = 'running'
  } else {
    $service_enable = false
    $service_ensure = 'stopped'
  }
  
  case $::osfamily {
    'RedHat': {
      $service_name = 'vnstat'
      $log_file = '/var/log/vnstat.log'
      $pid_file = '/run/vnstat/vnstat.pid'
    }
    'Debian': {
      $service_name = 'vnstat'
      $log_file = '/var/log/vnstat.log'
      $pid_file = '/run/vnstat/vnstat.pid'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::operatingsystem} distribution.")
    }
  }

}
