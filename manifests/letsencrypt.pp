# == Class: role_apache::letsencrypt
#
class role_apache::letsencrypt {

  class { ::cerbot:
    config => $role_apache::letsencrypt_config,
  }

}
