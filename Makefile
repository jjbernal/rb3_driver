LDLIBS += -lusb-1.0 -lportmidi
PKGCFG += `pkg-config libusb-1.0 --cflags`

all: rb3_driver

%.o: %.c
	$(CC) -c -o $@ $(CCFLAGS) $(PKGCFG) $^

rb3_driver: rb3_driver.o myusb_utils.o myusb_atexit.o my_atexit.o
	$(CC) -o $@ $(CCFLAGS) $(LDFLAGS) $^ $(LDLIBS)
