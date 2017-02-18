printf "%-20s %-10s %s\n" "LOGIN" "UID" "PATH"; cat /etc/passwd | sed 's/ //g' | sed 's/:/ /g' | awk '{printf("%-20s %-10s %s \n", $1, $3, $6)   }'
