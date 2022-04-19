# Install Nginx web server (w/ Puppet)
package { 'nginx':
  ensure => installed,
}

file { '/var/www/html/index.nginx-debian.html':
  ensure  => 'present',
  path    => '/var/www/html',
  content => 'Hello World',
}

file_line { 'redirect_me':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'server_name _;',
  line   => 'location /redirect_me { rewrite ^ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent; }',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
