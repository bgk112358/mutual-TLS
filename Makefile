INCLUDE	=
CFLAGS	= -Wall -g
LIB	=  -lssl -lcrypto -ldl -lcurses

SRCS = $(wildcard ssl_client.c)
OBJS = $(patsubst %c, %o, $(SRCS))

TARGET = client

.PHONY:all clean

all: ${TARGET}

${TARGET}: ${OBJS}
	$(CXX) -o $@ $^ ${INCLUDE} ${CFLAGS} ${LIB}
	rm -f *.o

${OBJS}: ${SRCS}
	$(CXX) -c $^ ${INCLUDE} ${CFLAGS}

clean:
	rm -f ${TARGET} *.o
