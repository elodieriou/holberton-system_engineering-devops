# Configure SSH client with puppet
include stdlib

file_line { 'use private key':
  ensure   => present,
  path     => '/etc/ssh/ssh_config',
  line     => 'IdentityFile ~/.ssh/school',
  match    => '^IdentityFile',
  }

file_line { 'refuse authenticate pwd':
  ensure   => present,
  path     => '/etc/ssh/ssh_config',
  line     => 'PasswordAuthentication no',
  match    => '^PasswordAuthentication',
  }
