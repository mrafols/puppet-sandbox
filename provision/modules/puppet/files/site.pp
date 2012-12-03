#
# site.pp - defines all global defaults
#

import 'nodes'

# global defaults
File { backup => '.original' }
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }
