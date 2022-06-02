
class sample::newclass ($param1) {

file {'create-file':
   path => '/param1.txt',
   content => $param1

}

}
