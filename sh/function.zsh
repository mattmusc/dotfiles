#
# Shell Function definitions

# get external ip address
function extip() {
$(curl -s 'http://ipecho.net/plain')
}

# check if i am home
function iamhome() {
  IP_ADDRESS="2.235.177.223"
  [ "$IP_ADDRESS" == "$(extip)" ] ; echo $?
}

