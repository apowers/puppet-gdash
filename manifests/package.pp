# == Class: gdash::package
#
# Full description of class gdash is in the README.
#
class gdash::package (
  $ensure         = $gdash::package_ensure,
  $path           = $gdash::package_path,
) {

  $packages = [ 'ruby-dev', 'git' ]
  ensure_packages($packages)

  vcsrepo { 'gdash':
    ensure    => $ensure,
    path      => $path,
    provider  => 'git',
    source    => 'https://github.com/ripienaar/gdash.git',
    require   => Package['git'],
  }

  bundler::install { $path:
    user        => 'root',
    group       => 'root',
    deployment  => true,
    without     => 'development test doc',
    require     => [ Package['ruby-dev'], Vcsrepo['gdash'] ],
  }

}
