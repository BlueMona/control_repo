class custom_java { 
  include java
    file {'/custom': 
      ensure => directory, 
    }
    java::adoptium { 'jdk17' :
        ensure  => 'present',
        version_major => '17',
        version_minor => '0',
        version_patch => '2',
        version_build => '8',
        basedir => '/custom/java',
    }
}
