# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache
class apache(
  $package_name,
  $config_path,
  $server_root,
  $pid_file,
  $time_out,
  $vhost_path,
  $service_name,
  Enum['running','stopped']$service_ensure,
  $manage_service,
) {
  # include modules
  include ::apache::install
  include ::apache::config
  include ::apache::service

  # class relationship
  Class['::apache::install']
  -> Class['::apache::config']
  ~> Class['::apache::service']
}
