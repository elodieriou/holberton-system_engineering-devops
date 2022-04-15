# Install puppet-lint
package { 'puppet-lint':
  name     => 'puppet-lint',
  ensure   => '2.5.2',
  provider => 'gem',
  }
