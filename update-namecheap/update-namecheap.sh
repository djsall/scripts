################################################################################
# script for updating Namecheap's dynamic DNS service.
# Dependencies: curl 
# Author: DjSall
################################################################################

unset username password ip
update_url='dynamicdns.park-your-domain.com/update'
username=''
password=''
host='@'
ip=''

if [[ -z "${username}" || -z "${password}" ]]; then
    echo "A username (-u) and password (-p) must be specified."
fi

shift $(($OPTIND - 1))

url="https://${update_url}?host=${host}&domain=${username}&password=${password}"
if [[ $ip ]];
  then
    url="$url&ip=$ip"
  else
    ip="the ip the request was made from."
fi
echo "$url"

response=$(curl "${url}" 2> /dev/null)

echo "Successfully updated! TLD: $username SLD: $host with $ip"
