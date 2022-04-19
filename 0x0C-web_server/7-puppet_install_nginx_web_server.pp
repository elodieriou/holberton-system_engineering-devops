# Install Nginx web server (w/ Puppet)
include stdlib

package { 'nginx':
  ensure => installed,
}

file { 'hello world':
  content => 'Hello World',
  path    => 'var/www/html/index.nginx-debian.html',
  }

file_line { 'redirection 301 moved permanently':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => '/server_name _;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
  }

service { 'restart nginx':
  ensure  => running,
  restart => '/usr/sbin/nginx restart',
  }
