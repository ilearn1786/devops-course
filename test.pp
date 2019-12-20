file { '/tmp/works.txt':
  ensure => present,
  mode => '0644',
  content => "it works on ${ipaddress_eth0}!\n",
}
