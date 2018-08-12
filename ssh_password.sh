#!/usr/bin/expect -f

set user [lindex $argv 0]
set host [lindex $argv 1]
set port [lindex $argv 2]
set password [lindex $argv 3]

spawn ssh $user@$host -p $port
expect {
    "yes/no" { send "yes\r";
               exp_continue }
    "password:" { send "$password\r" }
}
interact