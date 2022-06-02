node 'puppetnode1' {
 include motd
 include sample
 class {'sample::newclass':
   param1 => 'I am parameter value'

}
}

node 'puppetnode2' {
  include sample  
  $siteppvariable = "I am site.pp variable"
  include myapache
  include testtemplate::newclass
  include testtemplate
}

node 'puppet' {
 include motd
}
