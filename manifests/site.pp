import "nodes.pp"
import "modules.pp"

$nameservers = ["128.193.4.20", "128.193.0.10"]

Exec { path => "/bin:/sbin:/usr/bin:/usr/sbin" }
