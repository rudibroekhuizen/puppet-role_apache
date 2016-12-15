# == Class: role_apache::letsencrypt
#
class role_apache::letsencrypt {

  class { ::certbot:
    manage_dependencies => false, # otherwise duplicate declaration package git in ubuntu 14.04
    config              => $role_apache::letsencrypt_config,
  }

}
