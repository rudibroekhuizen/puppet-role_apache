# == Class: role_apache::letsencrypt
#
class role_apache::letsencrypt {

  class { ::certbot:
    manage_dependencies => false,
    config              => $role_apache::letsencrypt_config,
  }

}
