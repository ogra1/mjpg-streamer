[![Snap Status](https://build.snapcraft.io/badge/ogra1/mjpg-streamer.svg)](https://build.snapcraft.io/user/ogra1/mjpg-streamer)

# mjpg-streamer

Snap of the UVC webcam streaming tool

MJPG-streamer takes JPGs from Linux-UVC compatible webcams, filesystem or other input plugins and streams them as M-JPEG via 
HTTP to webbrowsers, VLC and other software. It is the successor of uvc-streamer, a Linux-UVC streaming application with 
Pan/Tilt.

## Shipped modules
This snap ships the input_uvc, input_file, input_http and input_ptp2 as well as the output_file, output_http, output_rtsp, 
output_udp and output_viewer plugins by default, opencv is currently not supported.

## Snap interfaces

Please make sure to run ```snap connect mjpg-streamer:camera``` to allow the app (or the service) to access /dev/video*.

## Service

Additionally to the mjpg-streamer command the snap ships a service that can be configured via the /var/snap/mjpg-streamer/current/config 
file. Set the DAEMON= option in there to "true", then run "snap restart mjpg-streamer" (or reboot the system) to get the 
mjpg-streamer service up and running.

If you use the daemon it will automatically create /var/snap/mjpg-streamer/current/www with the default website content that 
the app ships and use this.

If you do not use the included daemon you are free to use i.e. ~/snap/mjpg-streamer/current/www to ship your own websites so -w 
must be explicitly provided in "manual mode" (Note that you can always use "http://<YOUR_IP>:<PORT>/?action=stream" to access
the camera even without a www dir set).

See also "snap info mjpg-streamer" as well as the package homepage at https://snapcraft.io/mjpg-streamer/ for info about this snap package.
