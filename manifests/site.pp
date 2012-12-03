#
# site.pp - defines all global defaults
#


# global defaults
File { backup => '.original' }
Exec { path => "/usr/bin:/usr/sbin/:/binsbin" }
