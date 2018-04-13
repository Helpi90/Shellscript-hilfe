###############################
###### Funktionen #############
###############################

log() {
   echo "$*"
   logger init "$*"
   esxcfg-init --set-boot-status-text "$*"
}

