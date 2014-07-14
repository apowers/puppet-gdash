# == Class: gdash::defaults
#
# Full description of class gdash is in the README.
#
class gdash::defaults {
  $config_directory  = $::osfamily ? {
    'Debian' => '/etc/gdash',
    default  => fail('Unsupported Platform')
  }
  $package_name = $::osfamily ? {
    'Debian' => 'gdash',
    default  => fail('Unsupported Platform')
  }
  $config_file  = $::osfamily ? {
    'Debian' => 'gdash.conf',
    default  => fail('Unsupported Platform')
  }

  $default_options = {
  }

  $service_name = $::osfamily ? {
    'Debian' => 'gdash',
    default  => fail('Unsupported Platform')
  }
  $server_package_name = $::osfamily ? {
    'Debian' => 'gdash',
    default  => fail('Unsupported Platform')
  }
  $server_config_file  = $::osfamily ? {
    'Debian' => 'gdash.conf',
    default  => fail('Unsupported Platform')
  }
  $server_service_name = $::osfamily ? {
    'Debian' => 'gdash',
    default  => fail('Unsupported Platform')
  }

  $default_server_options = {
  }

}
