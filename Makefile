obj-m += simple.o

build:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

test:
	sudo dmesg -C
	sudo insmod simple.ko
	sudo rmmod simple
	sudo dmesg

.PHONY: build clean test
