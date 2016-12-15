# == Class: role_apache
#
# Full description of class role_apache here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'role_apache':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class role_apache (
  $vhosts_hash = undef,
  $letsencrypt_config = undef,
  ) {
  
  # Install Apache
  class { 'apache':
    mpm_module             => 'prefork',
    root_directory_options => [
      'Indexes',
      'FollowSymlinks',
      'MultiViews'
    ],
  }

  # Create instances
  class { 'apache::vhosts':
    vhosts => $vhosts_hash,
  }

  # Apache php module, ppa:ondrej/php is needed for php v7, installed by php module, so require php
  class {'::apache::mod::php':
    php_version => '7.0',
    require     => Class['::php']
  }
  
  # Other Apache modules
  class { 'apache::mod::expires': }
  class { 'apache::mod::headers': }
  class { 'apache::mod::rewrite': }
  class { 'apache::mod::vhost_alias': }
  
  # Letsencrypt
  class { 'role_apache::letsencrypt':
    require => Class['::apache']
  }
  
}
