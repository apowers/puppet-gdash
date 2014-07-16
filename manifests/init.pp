# == Class: gdash
#
# This class installs and configures the gdash client.
# Full description of class gdash is in the README.
#
class gdash (
  $package_ensure = 'present',
  $package_path   = $gdash::defaults::package_path,
  $config_ensure  = 'present',
  $config_options = {},
  $graphite_path  = $gdash::defaults::graphite_path,
  $graphite_host  = $gdash::defaults::graphite_host,
  $template_path  = $gdash::defaults::template_path,
  $whisper_path   = $gdash::defaults::whisper_path,

) inherits gdash::defaults {
  anchor { 'gdash::begin':   } ->
  class  { 'gdash::package': } ->
  class  { 'gdash::config':  } ->
  anchor { 'gdash::end': }
}
