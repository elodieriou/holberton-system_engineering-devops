package { 'nginx':
  ensure => installed,
}

file { 'Hello World':
  ensure  => 'present',
  path    => '/var/www/html',
  content => 'Hello World',
}

file_line { 'redirection 301 moved permanently':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'server_name _;',
  line   => 'location /redirect_me { rewrite ^ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent; }',
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
