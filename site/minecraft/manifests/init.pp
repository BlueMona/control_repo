class minecraft {
  include java
  java::adoptium { 'jdk17' :
      ensure  => 'present',
      version_major => '17',
      version_minor => '0',
      version_patch => '2',
      version_build => '1',
  }
  file {'/opt/minecraft': 
    ensure => directory, 
  }
  file {'/opt/minecraft/minecraft_server.jar':
    ensure => file,
    source => 'https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar',
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
  }
}
