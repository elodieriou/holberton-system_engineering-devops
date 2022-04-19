# Install Nginx web server (w/ Puppet)
exec { 'install':
  provider => shell,
  command  => 'sudo apt-get update ; sudo apt-get -y upgrade ; sudo apt-get -y install nginx',
}

exec { 'echo Hello World':
  provider => shell,
  command  => 'echo "Holberton School" > /var/www/html/index.nginx-debian.html',
}

exec { 'redirect_me':
  provider => shell,
  command  => 'sed -i "/server_name _;/a location /redirect_me { rewrite ^ https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent; }" /etc/nginx/sites-available/default',
}

exec { 'service nginx restart':
  provider => shell,
  command  => 'sudo service nginx restart',
}
