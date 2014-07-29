# Create or manage a Graph in a Dashboard
#
define gdash::graph (
  $graph_title  = $name,
  $category     = 'servers',
  $dashboard    = $::fqdn,
  $options      = {},
  $fields       = {},
) {
  Gdash::Dashboard[$dashboard] -> Gdash::Graph[$name]

  validate_hash($fields)
  validate_hash($options)
  $dashboard_path = "${gdash::template_path}/${category}/${dashboard}"

  $data = merge($options,{'title' => $graph_title})

  file { "${dashboard_path}/${name}.graph":
    ensure  => 'file',
    mode    => '0644',
    content => template('gdash/graph.erb'),
    require => File[$dashboard_path],
  }

}
