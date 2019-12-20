node default{

$packages = ['apache2','mysql-server']  

package {$packages:
     ensure => present,
}

 service { 'nginx':
    ensure => stopped,
}

$text = "This is awesome"
  file {'/tmp/status.txt':
     ensure => present,
     content => $text,
     mode => '0655',
}
exec { 'condition':
  command => '/bin/echo apache is installed > /tmp/apache.txt',
  onlyif => '/bin/which apache2',

}

exec { 'test':
  command => '/bin/echo nginx is not  installed > /tmp/ngnix.txt',
  unless => '/bin/which nginx',
}
}
