class minecraft {
  include minecraft::custom_java
  file {'/opt/minecraft': 
    ensure => directory, 
  }
  file {'/opt/minecraft/minecraft_server.jar':
    ensure => file,
    source => 'https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar',
    before => Service['minecraft'],
  } 
  file {'/opt/minecraft/eula.txt':
    ensure => file, 
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file, 
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
  service {'minecraft': 
    ensure => running, 
    enable => true,
    require => [Class['minecraft::custom_java'], File['/opt/minecraft/eula.txt'], File['/etc/systemd/system/minecraft.service']],
  }
}
