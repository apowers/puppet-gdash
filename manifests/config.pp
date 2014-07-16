# == Class: gdash::config
#
# Full description of class gdash is in the README.
#
class gdash::config (
  $ensure         = $gdash::config_ensure,
  $path           = $gdash::package_path,
  $options        = $gdash::config_options,
  $graphite_path  = $gdash::graphite_path,
  $graphite_host  = $gdash::graphite_host,
  $template_path  = $gdash::template_path,
  $whisper_path   = $gdash::whisper_path,
) {
  $merged_options = merge($gdash::defaults::default_options, $options)
  $assignment_character = ': '

  file { "${path}/config":
    ensure  => directory,
    group   => 'www-data',
    mode    => '0555',
    require => Vcsrepo['gdash'],
  }

  file { "${path}/config/gdash.yaml":
    content => template('gdash/gdash.yaml.erb'),
    group   => 'www-data',
    mode    => '0444',
    require => File["${path}/config"],
  }

}

