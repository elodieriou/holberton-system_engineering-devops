# Install puppet-lint
package { 'puppet-lint':
  ensure   => '2.5.2',
  name     => 'puppet-lint',
  provider => 'gem',
  }
