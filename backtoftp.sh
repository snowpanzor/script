#!/usr/bin/expect -f
# Written by David

set bfile [lindex $argv 0]
set retval 1
set timeout 30

send "cd /home/oracle/backup"
spawn pftp 115.236.79.74 9527
expect "Name"
send "dumper\r"
expect "Password:"
send "dbbacker\r"
expect "ftp>"
set timeout -1
send "send $bfile \r"

expect {
  "keyword1" { send "action1" }
  ".*" {send "action2"}
  unpredicted stuff {send "action3"}
}

expect "ftp>"
send "bye\r"

expect "$"
send_user $retval

exit
