# Install Nginx web server (w/ Puppet)
include stdlib

package { 'nginx':
  ensure => installed,
}

file { 'var/www/html/index.nginx-debian.html':
  ensure  => 'file',
  content => 'Hello World',
  }

file_line { 'redirection 301 moved permanently':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => '/server_name _;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  }

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
  }
