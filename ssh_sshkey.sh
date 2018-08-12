#!/usr/bin/expect -f

set user [lindex $argv 0]
set host [lindex $argv 1]
set port [lindex $argv 2]
set password [lindex $argv 3]
set keyFile [lindex $argv 4]

spawn ssh $user@$host -p $port -i $keyFile

expect {
    "yes/no" { send "yes\r";
               exp_continue }
    "Enter passphrase for key" { send "$password\r" }
}
interact