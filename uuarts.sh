### specific for my laptop. should use your serial USB ports by path.



#xterm -geometry 60x120+0+30  -fa Monaco -fs 12 -bg black -fg orange -e "minicom -D /dev/serial/by-path/pci-0000:00:14.0-usb-0:3:1.0" &
#xterm -geometry 60x120+674+30  -fa Monaco -fs 12 -bg  black -fg orange  -e "minicom -D /dev/serial/by-path/pci-0000:00:14.0-usb-0:1:1.0" &
#xterm -geometry 60x120+1280+230  -fa Monaco -fs 12 -bg black -fg orange -e "minicom -D /dev/serial/by-path/pci-0000:00:14.0-usb-0:2:1.0" &


#xterm -geometry 55x120+0+30  -fa Monaco -fs 14 -bg black -fg red -e "minicom -D /dev/serial/by-path/pci-0000:00:14.0-usb-0:3:1.0" &
#xterm -geometry 55x120+674+30  -fa Monaco -fs 14 -bg  blue -fg white  -e "minicom -D /dev/serial/by-path/pci-0000:00:14.0-usb-0:1:1.0" &
#xterm -geometry 55x120+2280+230  -fa Monospace -fs 14 -bg blue -fg white -e "minicom -D /dev/serial/by-path/pci-0000:00:14.0-usb-0:2:1.0" &


xterm -geometry 55x120+0+30  -fa Monaco -fs 15 -bg white -fg black -e "minicom -D /dev/serial/by-path/pci-0000:00:14.0-usb-0:3:1.0" &
xterm -geometry 55x120+674+30  -fa Monaco -fs 15 -bg  white -fg black  -e "minicom -D /dev/serial/by-path/pci-0000:00:14.0-usb-0:1:1.0" &
xterm -geometry 55x120+1380+230  -fa Monospace -fs 15 -bg white -fg black -e "minicom -D /dev/serial/by-path/pci-0000:00:14.0-usb-0:2:1.0" &


