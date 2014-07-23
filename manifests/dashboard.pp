# Create or manage a Dashboard in a Category
#
define gdash::dashboard(
  $category         = 'servers',
  $description      = '',
  $graph_properties = {},
  $graph_source     = undef,
) {
  Gdash::Category[$category] -> Gdash::Dashboard[$name]

  $dashboard_path = "${gdash::template_path}/${category}/${name}"

  if $graph_source {
    file { $dashboard_path:
      ensure  => 'directory',
      mode    => '0644',
      recurse => true,
      source  => $graph_source,
    }
  } else {
    file { $dashboard_path:
      ensure  => 'directory',
      mode    => '0755',
    }
  }
  file { "${dashboard_path}/dash.yaml":
    ensure  => 'file',
    mode    => '0644',
    content => template('gdash/dash.yaml.erb'),
    require => File[$dashboard_path],
  }
}
