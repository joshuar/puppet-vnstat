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

Install and configure vnstat, vnstatd and vnstati for interfaces
specified:

```puppet
class { '::vnstat':
    interfaces => [ 'p3p1', 'wlan0' ],
}
```
Install and configure vnstat but don't run the vnstatd daemon:

```puppet
class { '::vnstat':
    interfaces  => [ 'p3p1', 'wlan0' ],
    use_vnstatd => false,
}
```
Install and configure vnstat et. al. and specify seperate bandwidth
limits on each interface:

```puppet
class { '::vnstat':
    interfaces               => [ 'p3p1', 'wlan0' ],
    interfaces_max_bandwidth => {
      'p3p1'  => '1000', # gigabit wired ethernet
      'wlan0' => '54', # 802.11a wireless
    },
}
```
##Reference

### Classes ###

* **vnstat** : main class, installs and configures vnstat.
* **vnstat::vnstatd** : installs and configures vnstatd.
* **vnstat::vnstati** : installs and configures vnstati.

### Parameters

Many of the parameters below directly correspond to
vnstat/vnstatd/vnstati options.  There is no need to set them as they
will default to the values set by the vnstat author. Refer to the man
pages **vnstat(1)**, **vnstati(1)**, **vnstatd(1)** and
**vnstat.conf(5)** for further details.

#### vnstat Class ####

* `use_vnstatd` : whether to configure the vnstatd service. Can be *true*
  or *false*.  Defaults to *true*.
* `use_vnstati` : whether to configure the vnstati program. Can be *true*
  or *false*.  Defaults to  *true*. This parameter is only useful for
  distributions which package vnstati seperately (i.e., Debian, Ubuntu
  based distributions).
* `interfaces` : should be set to an array of network interfaces
  which vnstat should monitor. *This parameter is required*.
* `package_ensure` : sets the vnstat package to be installed. Can be
  set to *present*, *latest*, or a specific version.
* `package_name` : determines the name of the package to
  install. Defaults to 'vnstat' on most operating systems.
* `config` : sets the file that vnstat/vnstatd/vnstati configuration
  is written into. Defaults to ``/etc/vnstat.conf`` on most
  operating systems.
* `config_template` : determines which template Puppet should use for
  the vnstat/vnstatd/vnstati configuration.
* `database_directory` : sets the location that vnstat/vnstatd store
  databases for interface details. Defaults to ``/var/lib/vnstat`` on most
  operating systems.
* `month_rotate` : day of month that months are expected to
  change. *Defaults to 1*.  Change if you want to track, say, monthly
  billed traffic from a certain day of the month.
* `day_format`, `month_format`, `top_format` : formatting  of  date in
  available outputs. Uses the same format as **date(1)**.
* `tx_char`, `rx_char` :  single character used for displaying the
  percentage share of received and transmitted traffic in daily
  output. *Defaults to ':' and '%' respectively*.
* `tx_hour_char`, `rx_hour_char` :  single character used for displaying the
  percentage share of received and transmitted traffic in hourly
  output. *Defaults to 't' and 'r' respectively*.
* `iec_units` : whether to use IEC unit prefixes (e.g., KiB/MiB/GiB,
  etc.) or binary prefixes (i.e., KB/MB/GB, etc.). Can be *true*
  or *false*.  *Defaults to*  *true*.
* `rate_unit` : what unit (*bits* or *bytes*) to display the traffic
  rate. Defaults to *bits*.
* `output_style` : modifies the content and style of text outputs in
   vnstat and vnstati. 0 = minimal and narrow output for terminal with
   limited width, 1 = normal output with bar column visible, 2 = same
   as 1 except rate is visible in summary and weekly outputs, 3
   (default) = rate column  is  visible  in  all  outputs where it is supported.
* `max_bandwidth` : maximum bandwidth expected on any interface. Value
  in Mbits/s (e.g., '1000' for GbE). Defaults to 0 (i.e., don't check bandwidth limit).
* `interfaces_max_bandwidth` : hash with interface name as keys and
  max bandwidth (in Mbit/s) as values.
* `sample_time` : number of seconds by default to sample traffic when
  using the ``-tr`` argument to vnstat. *Defaults to 5*.
* `boot_variation` : time in seconds how much the boot time reported
  by system  kernel  can  variate  between updates. *Defaults to 15*.
* `log_notraffic_days` : whether to log days which have no recorded
  traffic to the daily list. Can be *true* or *false*.  Defaults
  to *true*.

#### vnstatd Class ####

* `update_interval` : seconds between updating interface
  data. *Defaults to 30*.
* `poll_interval` : seconds between checking for interface status
  changes. Defaults to 5 seconds.
* `save_interval` : minutes between saving cached interface
  data. *Defaults to 30*.
* `saveonstatuschange` : if the interface status changes, force save
  data. Can be *true* or *false*.  Defaults to *true*.
* `logging_target` : enable or disable daemon logging and set target.
  Can be *syslog* for logging to system log, *logfile* for logging to
  a seperate file or *none* to disable logging. Defaults to *none*.
* `log_file` : file to write log to if `logging_target` is *logfile*.

#### vnstati Class ####

* `header_format` : formatting of date in header output. Uses the same
  format as **date(1)**.
* `show_hourly_rate` : show hours with rate instead of transfered
  amount. Can be *true* or *false*.  Defaults to *true*.
* `show_rate_in_summary` : show rate in summary output. Can be *true*
  or *false*.  Defaults to *true*.
* `transparent_bg` : set background colour as transparent. Can be *true*
  or *false*.  Defaults to *false*.
* `image_cbackground` : background color. Hex code without the '#'.
* `image_cedge` :  edge color if visible. Hex code without the '#'.
* `image_cheader` : header background colour. Hex code without the
  '#'.
* `image_cheadertitle` : header title text color. Hex code without the '#'.
* `image_cheaderdate` : header date text color. Hex code without the '#'.
* `image_ctext` : common text color.  Hex code without the '#'.
* `image_cline` : line color.  Hex code without the '#'.
* `image_clinel` : lighter version of line color. Set to '-' in order
  to use a calculated  value  based  on CLine.
* `image_crx` : color for received data. Hex code without the '#'.
* `image_crxd` :   darker  version  of  received  data color. Set to
  '-' in order to use a calculated value based on CRx.
* `image_ctx` : color for transmitted data.  Hex code without the '#'.
* `image_ctxd` : darker version of transmitted data color. Set to '-'
  in order to use a calculated  value based on CTx.

##Limitations

###Compatibility

This module has been tested on Puppet 3.5.0 but should work on:

* Puppet 3.x and higher.

The module has been tested on Ubuntu 13.10 but should work on the
latest stable releases of:

* Ubuntu
* Debian
* Fedora
* RedHat

###Cron

* There is no support for configuring a cron job to run vnstat.
