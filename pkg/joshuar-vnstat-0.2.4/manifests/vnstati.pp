class vnstat::vnstati (

  $header_format = $vnstat::vnstati::params::header_format,
  $show_hourly_rate = $vnstat::vnstati::params::show_hourly_rate,
  $show_rate_in_summary = $vnstat::vnstati::params::show_rate_in_summary,
  $summary_layout = $vnstat::vnstati::params::summary_layout,
  $transparent_bg = $vnstat::vnstati::params::transparent_bg,
  $image_cbackground = $vnstat::vnstati::params::image_cbackground,
  $image_cedge = $vnstat::vnstati::params::image_cedge,
  $image_cheader = $vnstat::vnstati::params::image_cheader,
  $image_cheadertitle = $vnstat::vnstati::params::image_cheadertitle,
  $image_cheaderdate = $vnstat::vnstati::params::image_cheaderdate,
  $image_ctext = $vnstat::vnstati::params::image_ctext,
  $image_cline = $vnstat::vnstati::params::image_cline,
  $image_clinel = $vnstat::vnstati::params::image_clinel,
  $image_crx = $vnstat::vnstati::params::image_crx,
  $image_ctx = $vnstat::vnstati::params::image_ctx,
  $image_crxd = $vnstat::vnstati::params::image_crxd,
  $image_ctxd = $vnstat::vnstati::params::image_ctxd,

  ) inherits vnstat::vnstati::params {

    validate_string($header_format)
    validate_bool($show_hourly_rate)
    validate_bool($show_rate_in_summary)
    validate_re($summary_layout, [ '^new', '^old' ])
    validate_bool($transparent_bg)
    validate_string($image_cbackground)
    validate_string($image_cedge)
    validate_string($image_cheader)
    validate_string($image_cheadertitle)
    validate_string($image_cheaderdate)
    validate_string($image_ctext)
    validate_string($image_cline)
    validate_string($image_clinel)
    validate_string($image_crx)
    validate_string($image_ctx)
    validate_string($image_crxd)
    validate_string($image_ctxd)

    if $package_name {
      package { 'vnstati':
        ensure => $package_ensure,
        name   => $package_name,
      }
    }
}
