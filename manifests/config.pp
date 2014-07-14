# == Class: gdash::config
#
# Full description of class gdash is in the README.
#
class gdash::config (
  $ensure      = $gdash::config_ensure,
  $options     = $gdash::config_options,
  $config_dir  = $gdash::config_dir,
  $config_file = $gdash::config_file,
) {
  $merged_options = merge($gdash::defaults::default_options, $options)
  $assignment_character = ' = '

  file { "${config_dir}/${config_file}":
    ensure  => $ensure,
    mode    => '0440',
    content => template('gdash/config.erb')
  }
}

