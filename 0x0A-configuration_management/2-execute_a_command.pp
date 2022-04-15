# Create a manifest that kills a process named killmenow
exec { 'kill process':
  command => 'pkill killmenow',
  path    => '/usr/bin',
  }
