# == Class: gdash::service
#
# Full description of class gdash is in the README.
#
class gdash::service (
  $ensure       = $gdash::service_ensure,
  $enable       = $gdash::service_enable,
  $service_name = $gdash::service_name,
) {
  service { $service_name:
    ensure => $ensure,
    enable => $enable,
  }
}
