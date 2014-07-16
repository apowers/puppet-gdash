# == Class: gdash::defaults
#
# Full description of class gdash is in the README.
#
class gdash::defaults {

  $package_path  = '/opt/gdash'
  $graphite_path = '/opt/graphite'
  $graphite_host = "graphite.${::fqdn}"
  $template_path  = '/opt/gdash/graph_templates'
  $whisper_path   = '/opt/graphite/storage/whisper'

  $default_options  = {
  }

}
