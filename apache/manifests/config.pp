# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::config
class apache::config inherits apache {
  file { $::apache::config_path:
    ensure  => file,
    content => template('apache/http.conf.erb'),
  }
}
