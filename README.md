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
  }

Installation with Hiera

  ---
  class:  - gdash
  gdash::config::ensure:  'present'
  gdash::config::options:
    option: value
  gdash::package::ensure:  'true'

# Creating Graphs

Every graph has a tree structure as Catagory -> Dashboard -> Graph

Example Graph

  $load_graph_fields = {
    'short' => {
      'color' => 'red',
      'alias' => 'Short term (1 minute)',
      'data'  => '#{@properties[:host]}.load.load.shortterm'
    },
    'mid' => {
      'color' => 'orange',
      'alias' => 'Mid term (5 minutes)',
      'data'  => '#{@properties[:host]}.load.load.midterm'
    },
    'long' => {
      'color' => 'yellow',
      'alias' => 'Long term (15 minutes)',
      'data'  => '#{@properties[:host]}.load.load.longterm'
    }
  }

  gdash::category { 'servers': }
  gdash::dashboard { $fqdn:
    graph_properties  => { 'host' => $fqdn }
  }
  gdash::graph { "servers-${fqdn}-load_graph":
    graph_title => 'load',
    vtitle      => 'processes',
    description => 'CPU Load',
    category    => 'servers',
    dashboard   => $fqdn,
    fields      => $load_graph_fields,
  }

Alternatly, you can install graphs from a location:

  gdash::category { 'servers': }
  gdash::dashboard { $::fqdn:
    graph_properties  => { 'host' => $::fqdn },
    graph_source      => 'puppet:///files/gdash/graphs',
  }

# License

  See LICENSE

# Contact


# Support

Please log tickets and issues at our [Projects site](https://github.com/seattle-biomed/puppet-gdash)
