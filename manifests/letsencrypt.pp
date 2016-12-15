# == Class: role_apache::letsencrypt
#
class role_apache::letsencrypt {

  class { ::certbot:
    config => $role_apache::letsencrypt_config,
  }

}
