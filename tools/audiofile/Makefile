CXX := g++

libaudiofile.a: audiofile.o
	ar rcs libaudiofile.a audiofile.o

audiofile.o: audiofile.cpp audiofile.h aupvlist.h
	$(CXX) -std=c++11 -O2 -I. -c audiofile.cpp

clean:
	rm -f audiofile.o libaudiofile.a

.PHONY: clean
