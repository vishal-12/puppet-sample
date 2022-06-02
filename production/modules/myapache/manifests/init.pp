# Class: myapache
# ===========================
#
# Full description of class myapache here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'myapache':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2022 Your name here, unless otherwise noted.
#
class myapache {

   if $facts[os][family] == 'RedHat' {

      $webserver = 'httpd'
      $reponame = 'yum update'
   
 } elsif $facts[os][family] == 'Debian' {
   
   $webserver = 'apache2'
   $reponame = 'apt-get update'

#   exec {'update-repo':
#   command => '/usr/bin/apt-get update'
     
 }else {
    fail ('This is not a supported distribution')
  }

   exec {'update-repo':
       command => $reponame,
       path => ['/usr/bin'],
       before => [Package['install-apache'], Service['start-webserver']]

      }


   package {'install-apache':
#            name => apache2,
#            ensure => installed
             name => $webserver,
             ensure => installed,
             require => Exec['update-repo']

      }

  service {'start-webserver':
         name => $webserver,
         enable => true,
         ensure => running,
         require => Package['install-apache']
     }

   #Exec['update-repo']

}
