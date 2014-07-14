# == Class: gdash::server::package
#
# Full description of class gdash is in the README.
#
class gdash::server::package (
  $ensure       = $gdash::server::package_ensure,
  $package_name = $gdash::server::package_name,
) {
  package { $package_name:
    ensure => $ensure,
  }
}
