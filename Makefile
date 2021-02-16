# This makefile is for use with the Raspberry Pi. The wiringpi library is needed.

#CPPFLAGS  = -g -Wall -std=c++11 -DHAVE_LOG_H -DRASPBERRY_PI -I/usr/local/include
CPPFLAGS  = -g -Wall -std=c++11
#LIBS    = -lwiringPi -lwiringPiDev -lpthread
LIBS    = -lpthread

SRCS = $(wildcard *.cpp)
OBJS = $(SRCS:.cpp=.o)
DEPS = $(SRCS:.cpp=.d)

EXE = MMDVMHost

$(EXE) : $(OBJS)
		g++ $(OBJS) $(CFLAGS) $(LIBS) -o $(EXE)

%.o : %.cpp
	g++ -MMD -MD $(CPPFLAGS) -c $< -o $@

.PHONY : clean

clean :
	$(RM) $(EXE) *.o *.d

-include $(DEPS)
