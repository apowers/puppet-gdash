# == Class: gdash::package
#
# Full description of class gdash is in the README.
#
class gdash::package (
  $ensure       = $gdash::package_ensure,
  $package_name = $gdash::package_name,
) {
  package { $package_name:
    ensure => $ensure,
  }
}
