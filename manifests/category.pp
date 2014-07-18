# Create or manage a Category
#
define gdash::category () {
  file { "${gdash::defaults::template_path}/${name}":
      ensure  => 'directory',
      mode    => '0755',
      require => Class['gdash::config'],
  }
}
