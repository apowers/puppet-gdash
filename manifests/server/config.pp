# == Class: gdash::server::config
#
# Full description of class gdash is in the README.
#
class gdash::server::config (
  $ensure      = $gdash::server::config_ensure,
  $options     = $gdash::server::config_options,
  $config_dir  = $gdash::server::config_dir,
  $config_file = $gdash::server::config_file,
) {
  $merged_options = merge($gdash::defaults::default_server_options, $options)
  $assignment_character = ' = '

  file { "${config_dir}/${config_file}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('gdash/config.erb')
  }
}

