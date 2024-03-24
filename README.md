# IPTV on Raspberry PI

## Hardware
You'll need a TV tuner in order to capture the TV signal and make it available to TVHeadend. For my satellite TV setup, I use a Telestar Digibit R1 quad-tuner but feasibly any TV tuner should work for this. For example, a Hauppauge digital TV tuner for digital, terrestrial TV should work just fine.

## Build
* Install PI OS 64 bit
```
sudo rpi-update
sudo apt update
sudo apt upgrade -y
sudo apt install docker docker.io docker-compose
```
* Pull this code
```
git clone https://github.com/jeffspiinthesky/iptv.git
```
* Set up required directories and user
```
cd iptv
chmod +x ./setup.sh
./setup.sh
```
* Start TVHeadend container
```
docker-compose -f iptv.yml up -d
```

## Set up TV Headend
* Switch to expert view globally
* Add user for jellyfin, configure as per Jellyfin docs
* Set up network
* Add network to tuners & enable each of the 4 sub-tuners
* Set muxes to DVB-S2
* Enable each tuner
* Enable Open Sky UK EPG module, disable ALL others
* In muxes, set 11778V to Open Sky UK EPG auto-detect
* Force-scan network
* For any stuck scans set scan status to IDLE then back to ACTIVE - should then complete OK
* For any FAIL items, set to DVB-S and rescan
* Choose bouquet and re-scan relevant mux - channels should get mapped
* Change max allowed duration in EPG scan to 1hr
* Force OTA EPG scan
