package { 'apache2':
  ensure => installed,
}

package { 'php':
  ensure => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}

service { 'apache2':
  ensure => running,
  enable => true,
  require => [Package['apache2'], Package['php']]
}

package { 'libapache2-mod-php':
  ensure => installed,
  require => [Package['apache2'], Package['php']],
}

package { 'php-cli':
  ensure => installed,
  require => [Package['php']],
}

package { 'php-mysql':
  ensure => installed,
  require => [Package['php']],
}

file { '/var/www/html/phpinfo.php':
  ensure  => file,
  source  => 'file:///home/umaymadahir/umayma_inet4031_puppet_lab9/phpinfo.php',
  require => Package['php'],
  notify  => Service['apache2'],
}

package { 'mariadb-server':
  ensure => installed,
}

service { 'mariadb':
  ensure => running,
  enable => true,
  require => [Package['mariadb-server']],
}

