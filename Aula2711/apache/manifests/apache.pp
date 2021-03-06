exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}


package { 'apache2':
  require => Exec['apt-update'],
  ensure => installed,
}

service { 'apache2':
  ensure => running,
}

file { "/var/www/html/index.html":
    source => "/vagrant/manifests/index.html",
    owner => root,
    group => root,
    mode => "0644",
    require => Package["apache2"],
    notify => Service["apache2"],
}
