# == Class: gdash::server
#
# This class installs and configures the gdash server.
# Full description of class gdash is in the README.
#
class gdash::server (
  $config_ensure  = 'present',
  $config_options = {},
  $package_ensure = 'installed',
  $service_ensure = 'running',
  $service_enable = true,
  $service_name   = $gdash::defaults::server_service_name,
  $package_name   = $gdash::defaults::server_package_name,
  $config_file    = $gdash::defaults::server_config_file,
) inherits gdash::defaults {
  anchor { 'gdash::server::begin':   } ->
  class  { 'gdash::server::package': } ->
  class  { 'gdash::server::config':  } ~>
  class  { 'gdash::server::service': } ->
  anchor { 'gdash::server::end': }
}
