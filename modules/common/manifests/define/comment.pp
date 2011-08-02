# Comments a line, this is to get cfengine like capabilities
#
# Usage:
#       comment { 'filename':
#           file   => 'filename',
#           line   => 'line to comment',
#       }

define comment($file, $line) {
    exec { "/bin/sed -i -e'/${line}/s/\\(.\\+\\)$/#\\1/' '${file}'":
        onlyif => "/usr/bin/test `/bin/grep '${line}' '${file}' | /bin/grep -v '^#' | /usr/bin/wc -l` -ne 0"
    }
}
