# == Class: gdash
#
# This class installs and configures the gdash client.
# Full description of class gdash is in the README.
#
class gdash (
  $config_ensure  = 'present',
  $config_options = {},
  $package_ensure = 'installed',
  $service_ensure = 'running',
  $service_enable = true,
  $service_name   = $gdash::defaults::service_name,
  $package_name   = $gdash::defaults::package_name,
  $config_dir     = $gdash::defaults::config_directory,
  $config_file    = $gdash::defaults::config_file,
) inherits gdash::defaults {
  anchor { 'gdash::begin':   } ->
  class  { 'gdash::package': } ->
  class  { 'gdash::config':  } ~>
  class  { 'gdash::service': } ->
  anchor { 'gdash::end': }
}
