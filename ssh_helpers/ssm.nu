#!/bin/nu

let HOST = open ~/.ssh/config | grep "Host " | fzf --reverse --height=30% |  awk '{print $2}' 

if ($HOST | is-empty) {
  print "Good bye."
  # ssh $HOST
} else {
  ssh $HOST
}
