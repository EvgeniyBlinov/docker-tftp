[![MIT License][license-image]][license-url]

# Docker tftp-hpa

## Easy to serve firmware for routers

```
cp openwrt.bin ./tftp/${ROUTER_FIRMWARE_NAME}
docker-compose up -d
```

### Example with tp-link wr842n

[https://openwrt.org/toh/tp-link/tl-wr842nd#recovery_v2](https://openwrt.org/toh/tp-link/tl-wr842nd#recovery_v2)

First, enter failsafe mode:

* Remove the power plug from the router.
* Press and hold the WPS/RESET button.
* Insert the power plug without releasing the WPS/RESET button, wait a moment for the Lock LED to come on solid.
* Release the WPS/RESET button

```
ifconfig eth1:1 192.168.0.66/24 up

## watch for link state in other terminal
cat /sys/class/net/eth1/{carrier,operstate}
watch -n.2 ethtool eth1

export ROUTER_FIRMWARE_NAME=wr842nv2_tp_recovery.bin
cp openwrt.bin ./tftp/${ROUTER_FIRMWARE_NAME}
docker-compose up -d

## Check if tftp is up
netstat -tunlp | grep 69
```

## License

[![MIT License][license-image]][license-url]

## Author

- [Blinov Evgeniy](mailto:evgeniy_blinov@mail.ru) ([https://evgeniyblinov.ru/](https://evgeniyblinov.ru/))

[license-image]: http://img.shields.io/badge/license-MIT-blue.svg?style=flat
[license-url]: LICENSE

