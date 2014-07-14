# == Class: gdash::server::service
#
# Full description of class gdash is in the README.
#
class gdash::server::service (
  $ensure       = $gdash::server::service_ensure,
  $enable       = $gdash::server::service_enable,
  $service_name = $gdash::server::service_name,
) {
  service { $service_name:
    ensure => $ensure,
    enable => $enable,
  }
}
