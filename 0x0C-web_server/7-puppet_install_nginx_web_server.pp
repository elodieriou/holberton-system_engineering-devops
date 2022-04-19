# Install Nginx web server (w/ Puppet)

package { 'nginx':
  ensure => installed,
}

file_line { 'redirection 301 moved permanently':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => '/server_name _;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

file { 'var/www/html/index.nginx-debian.html':
  content => 'Hello World',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
