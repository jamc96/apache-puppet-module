# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   apache::vhost { 'namevar': }
define apache::vhost (
  Enum['absent','present'] $ensure = 'present',
  $virtual_host_port               = 80,
  $server_admin                    = 'webmaster@example.com',
  $document_root                   = '/var/www/example.com/public_html',
  $server_name                     = 'www.example.com',
  $server_alias                    = 'example.com',
  $error_log                       = '/var/www/example.com/error.log',
  $custom_log                      = '/var/www/example.com/requests.log',
) {
  file { "${apache::vhost_path}/${name}.conf":
    ensure  => $ensure,
    content => template('apache/conf.d/vhost.erb'),
  }
}
