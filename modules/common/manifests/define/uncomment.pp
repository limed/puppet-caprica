# Usage:
#   uncomment { 'filename':
#       file    => 'filename'
#       line    => 'line to uncomment'
#   }
#
define uncomment($file, $line) {
    exec { "/bin/sed -i -e'/${line}/s/#\\+//' '${file}'" :
        onlyif => "/bin/grep '${line}' '${file}' | /bin/grep '^#' | /usr/bin/wc -l"
    }
}
