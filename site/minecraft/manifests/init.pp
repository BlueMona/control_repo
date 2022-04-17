class minecraft (
  $url = 'https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar',
  $install_dir = '/opt/minecraft'
){
  include minecraft::custom_java
  file {$install_dir: 
    ensure => directory, 
  }
  file {"${install_dir}/minecraft_server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  } 
  file {"${install_dir}/eula.txt":
    ensure => file, 
    content => 'eula=true',
  }
  file {'/etc/systemd/system/minecraft.service':
    ensure => file, 
    content => epp('minecraft/minecraft.service',{
      install_dir => $install_dir,
    })
  }
  service {'minecraft': 
    ensure => running, 
    enable => true,
    require => [Class['minecraft::custom_java'], File["${install_dir}/eula.txt"], File['/etc/systemd/system/minecraft.service']],
  }
}
