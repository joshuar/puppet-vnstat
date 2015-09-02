class vnstat::config inherits vnstat {

  # The vnstat configuration file.
  file { $config:
    ensure  => file,
    owner   => 0,
    group   => $group,
    mode    => '0644',
    content => template($config_template),
  }

  # vnstat requires the database to be "initialised"
  # before running.  This is done by performing a
  # one-off database update for all interfaces to be
  # monitored.
  createdb { $interfaces:
    user => $::vnstat::user,
  }
}
