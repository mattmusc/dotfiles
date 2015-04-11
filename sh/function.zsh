#
# Shell Function definitions

# get external ip address
extip() {
  curl -s http://ipecho.net/plain
}

# check if i am home
iamhome() {
  IP_ADDRESS="2.235.177.223"
  if [ "$IP_ADDRESS" = "$(extip)" ] ; then
    true
  else
    false
  fi
}

