NAME=time_modifier
obj-m += $(NAME).o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	gcc -o changer changer.c -std=c11
	gcc -o changer_gui changer_gui.c -Wall `pkg-config --cflags --libs gtk+-3.0 gmodule-2.0` -export-dynamic -rdynamic

clean: 
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
	rm -f changer
	rm -f changer_gui
