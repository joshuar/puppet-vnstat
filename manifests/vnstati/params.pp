class vnstat::vnstati::params inherits vnstat::params {

  $header_format = '%x %H:%M'
  $show_hourly_rate = true
  $show_rate_in_summary = true
  $summary_layout = 'new'
  $transparent_bg = false
  $image_cbackground = 'FFFFFF'
  $image_cedge = 'AEAEAE'
  $image_cheader = '606060'
  $image_cheadertitle = 'FFFFFF'
  $image_cheaderdate = 'FFFFFF'
  $image_ctext = '000000'
  $image_cline = 'B0B0B0'
  $image_clinel = '-'
  $image_crx = '92CF00'
  $image_ctx = '606060'
  $image_crxd = '-'
  $image_ctxd = '-'

  if $vnstat::use_vnstati {
    $package_ensure = 'installed'
  } else {
    $package_ensure = 'absent'
  }

  case $::osfamily {
    'RedHat': {
      $package_name = undef
    }
    'Debian': {
      $package_name = 'vnstati'
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::operatingsystem} distribution.")
    }
  }


}
