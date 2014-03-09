require 'socket'

default[:le][:userkey] = ""
default[:le][:hostname] = Socket.gethostname
default[:le][:logs_to_follow] = ["/var/log/syslog"]
