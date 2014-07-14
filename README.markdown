# gdash

This is the gdash module.

# Requirements

* Puppetlabs/stdlib

# Installation

  puppet module install seattle-biomed/gdash

# Synopsis

  Install and manage gdash service.

# Parameters

- *config_ensure* (Default: 'present')
- *config_options* (Default: Empty)
- *package_ensure* (Default: 'true')
- *service_ensure* (Default: 'running')
- *service_enable* (Default: 'true')

# Examples

Basic Installation

  include '::gdash'

Parameterized Installation

  $config_options = {
    option => value
  }

  class { '::gdash':
    config_ensure  => 'present',
    config_options => $config_options,
    package_ensure => 'true',
    service_ensure => 'running',
    service_enable => 'true',
  }

Installation with Hiera

  ---
  class:  - gdash
  gdash::config::ensure:  'present'
  gdash::config::options:
    option: value
  gdash::package::ensure:  'true'
  gdash::service::ensure:  'running'
  gdash::service::enable:  'true'

# License

  See LICENSE

# Contact


# Support

Please log tickets and issues at our [Projects site](https://github.com/seattle-biomed/gdash)
