class baseconfig {
	exec { 'apt-get update':
		command => '/usr/bin/apt-get update';
	}
	package { 'nginx':
		ensure => present
	}
	service { 'nginx': 
		ensure => running
	}
	file {
		'/usr/share/nginx/html/index.html':
		owner => "www-data",
		group => "www-data",
		mode => '0664',
		source => 'puppet:///modules/baseconfig/index.html'
	}
}