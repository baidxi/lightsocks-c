EVENTLIB?=-levent
BINDIR?=./bin
SERVERDIR?=./server
CLIENTDIR?=./client
LIB?=./lib
CC=gcc

$(shell mkdir -p $(BINDIR))


all: lib lightclient lightserver

lib: base64 log password securesocket parson

lightclient:
		$(CC) $(CFLAGS) -o $(BINDIR)/client $(CLIENTDIR)/client.c $(BINDIR)/base64.o $(BINDIR)/log.o $(BINDIR)/password.o $(BINDIR)/securesocket.o $(BINDIR)/parson.o $(EVENTLIB)

lightserver:
		$(CC) $(CFLAGS) -o $(BINDIR)/server $(SERVERDIR)/server.c $(BINDIR)/base64.o $(BINDIR)/log.o $(BINDIR)/password.o $(BINDIR)/securesocket.o $(BINDIR)/parson.o $(EVENTLIB)

# libs
base64:
		$(CC) $(CFLAGS) -c $(LIB)/base64.c -o $(BINDIR)/base64.o

log: 
		$(CC) $(CFLAGS) -c $(LIB)/log.c -o $(BINDIR)/log.o -DLOG_USE_COLOR

password:
		$(CC) $(CFLAGS) -c $(LIB)/password.c -o $(BINDIR)/password.o

securesocket:
		$(CC) $(CFLAGS) -c $(LIB)/securesocket.c -o $(BINDIR)/securesocket.o

parson:
		$(CC) $(CFLAGS) -c $(LIB)/parson.c -o $(BINDIR)/parson.o

clean:
		rm -rf bin
