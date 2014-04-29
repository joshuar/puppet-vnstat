#vnstat

##Overview

This Puppet module installs, configures and manages vnstat.

##Setup

### What vnstat affects

* vnstat package.
* vnstat configuration file.
* vnstatd service and configuration.
* vnstati program and configuration.

##Usage

```puppet
class { '::vnstat':
    interfaces => [ 'p3p1', 'wlan0' ],
}
```
##Reference

###Public Classes

* vnstat: main class, installs and configures vnstat.
* vnstat::vnstatd: installs and configures vnstatd.
* vnstat::vnstati: installs and configures vnstati.

###vnstat Class Public Parameters

Many of the parameters below directly correspond to
vnstat/vnstatd/vnstati options.  Refer to the man pages **vnstat(1)**,
**vnstati(1)**, **vnstatd(1)** and **vnstat.conf(5)** for further details.

* `use_vnstatd` : whether to configure the vnstatd service. Can be **true**
  or **false**.  *Defaults to* **true**.
* `use_vnstati` : whether to configure the vnstati program. Can be **true**
  or **false**.  *Defaults to*  **true**.
* `package_ensure` : sets the vnstat package to be installed. Can be
  set to **present**, **latest**, or a specific version.
* `package_name` : determines the name of the package to
  install. *Defaults to 'vnstat' on most operating systems*.
* `interfaces` : should be set to an array of network interfaces 
  which vnstat should monitor. **Required parameter**.
* `config` : sets the file that vnstat/vnstatd/vnstati configuration
  is written into. *Defaults to* ``/etc/vnstat.conf`` *on most
  operating systems*.
* `config_template` : determines which template Puppet should use for
  the vnstat/vnstatd/vnstati configuration.
* `database_directory` : sets the location that vnstat/vnstatd store
  databases for interface details. *Defaults to* ``/var/lib/vnstat`` *on most
  operating systems*.
* `month_rotate` : day of month that months are expected to
  change. *Defaults to 1*.  Change if you want to track, say, monthly
  billed traffic from a certain day of the month.
* `day_format`, `month_format`, `top_format` : formatting  of  date in
  available outputs. Uses the same format as **date(1)**.
* `tx_char`, `rx_char` :  single character used for displaying the
  percentage share of received and transmitted traffic in daily
  output.
* `tx_hour_char`, `rx_hour_char` :  single character used for displaying the
  percentage share of received and transmitted traffic in hourly
  output.
* `iec_units` : whether to use IEC unit prefixes (e.g., KiB/MiB/GiB,
  etc.) or binary prefixes (i.e., KB/MB/GB, etc.). Can be **true**
  or **false**.  *Defaults to*  **true**.
* `rate_unit` : what unit (*bits* or *bytes*) to display the traffic
  rate. *Defaults to 'bits'*.
* `output_style` : modifies the content and style of text outputs in
   vnstat and vnstati. 0 = minimal and narrow output for terminal with
   limited width, 1 = normal output with bar column visible, 2 = same
   as 1 except rate is visible in summary and weekly outputs, 3 = rate
   column  is  visible  in  all  outputs where it is supported.
* `max_bandwidth` : maximum bandwidth expected on any interface.
  *Defaults to 0 (don't track max bandwidth)*.
* `sample_time` : number of seconds by default to sample traffic when
  using the ``-tr`` argument to vnstat. *Defaults to 5*.
* `boot_variation` : time in seconds how much the boot time reported
  by system  kernel  can  variate  between updates. *Defaults to 15*.
* `log_notraffic_days` : whether to log days which have no recorded
  traffic to the daily list. Can be **true** or **false**.  *Defaults
  to* **true**.

##Limitations

This module has been tested on Puppet 3.5.0 but should work on:

* Puppet 3.x and higher.

The module has been tested on Ubuntu 13.10 but should work on the
latest stable releases of:

* Ubuntu
* Debian
* Fedora
* RedHat
