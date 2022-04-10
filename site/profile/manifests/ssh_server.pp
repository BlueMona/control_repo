class profile::ssh_server {
	package {'openssh-server':
		ensure => present,
	}
	service { 'sshd':
		ensure => 'running',
		enable => 'true',
	}
	ssh_authorized_key { 'root@master.puppet.vm':
		ensure => present,
		user   => 'root',
		type   => 'ssh-rsa',
		key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCnWzfcdhV8qvkhKHy7LDJfYAY28D9PBclTRMNcGn4GO5cWVA8unXlIGFX6iNK4i8iRuQo08KvlLMkd+5hUEOgpay3Sfw3dxc0kfhzL0ws7ESEnQ2rzd8XoTaNncD0If3uUFRlg9CxB/yP/eEpiJDyc4wzeBSTcnmDJFKjk/KsXa5CbUArSSp9H1MQUC1h0tDv6oqTyKjGerbadFg6QPBt6nIVtKESl7v5BA2ewGLXwBy0pNQJwwdA15cfpV8/7CJ0S9aw87l45futsFBwiDfZcnRKAadGF9LlnXwmjGbUISlADhQnurWx5xuI4PZSu5yEQ3cVhospTjJIljV0ZRJ2v',
	}  
}
