# iptv
Satellite -> IPTV based on TVHeadend and Jellyfin
## Build
Install PI OS 64 bit
sudo rpi-update
sudo apt update
sudo apt upgrade -y
sudo apt install docker docker.io docker-compose
## Config
for h264-v4l2m2m to work, need to map through /dev/video*
### TV Headend
* Switch to expert view globally
* Add user for jellyfin, configure as per Jellyfin docs
* Set up network
* Add network to tuners & enable each of the 4 sub-tuners
* Enable each tuner
* Set muxes to DVB-S2
* Force-scan network
* For any stuck scans set scan status to IDLE then back to ACTIVE - should then complete OK
* For any FAIL items, set to DVB-S and rescan
* Choose bouquet and re-scan relevant mux - channels should get mapped
* Enable Open Sky UK EPG module, disable ALL others
* In muxes, set 11778V to Open Sky UK EPG auto-detect
* Change max allowed duration in EPG scan to 1hr
* Force OTA EPG scan
### Jellyfin
* Add TV Headend plugin
* Restart jellyfin
* Configure TV Headend plugin - use real IP for NIC, not localhost
* Restart jellyfin
* Dashboard -> LiveTV -> Rescan TV Guide - will take some time
* Dashboard -> Playback -> Transcoder -> Enable v4L2 Hardware acceleration
## Test
* Install Jellyfin on client
* View guide & watch TV
