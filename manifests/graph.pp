# Create or manage a Graph in a Dashboard
#
define gdash::graph (
  $graph_title  = $name,
  $vtitle       = '',
  $description  = '',
  $area         = 'none',
  $alpha        = 0,
  $category     = 'servers',
  $dashboard    = $::fqdn,
  $ymin         = undef,
  $ymax         = undef,
  $hide_legend  = false,
  $fields       = {},
) {
  Gdash::Dashboard[$dashboard] -> Gdash::Graph[$name]

  validate_hash($fields)
  $dashboard_path = "${gdash::template_path}/${category}/${dashboard}"

  $data = {
    'title'       => $graph_title,
    'area'        => $area,
    'ymax'        => $ymax,
    'ymin'        => $ymin,
    'alpha'       => $alpha,
    'vtitle'      => $vtitle,
    'graph_name'  => $graph_title,
    'description' => $description,
    'hide_legend' => $hide_legend,
  }

  file { "${dashboard_path}/${name}.graph":
    ensure  => 'file',
    mode    => '0644',
    content => template('gdash/graph.erb'),
    require => File[$dashboard_path],
  }

}
