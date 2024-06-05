# Replace icc (intel compiler) with the compiler used in your system.
# Put appropriate compiler options in CFLAGS.
CC=g++
FC=gfortran
CFLAGS=-std=c++11 -Ofast -w
FFLAGS=-Ofast -w

OBJ_DIR=obj
OBJ=$(OBJ_DIR)/model_basic.o\
    $(OBJ_DIR)/model.o
OBJ_FORTRAN=$(OBJ_DIR)/fortran_interface.o

TARGET=libidea
TARGET_FORTRAN=libidea_fortran

.PHONY : all clean test

all : mkobj $(TARGET) $(TARGET_FORTRAN)

mkobj :
	-mkdir $(OBJ_DIR)
	-mkdir library

test : all
	$(CC) -c main_example.cpp -o $(OBJ_DIR)/main_example.o -I./include
	$(CC) -o test $(OBJ_DIR)/main_example.o -L./library -lidea

test_fortran : all
	$(FC) -o test_fortran main_example.f90 -I./include -L./library -lidea_fortran -lstdc++

$(TARGET) : $(OBJ)
	ar rscv library/$(TARGET).a $(OBJ)

$(TARGET_FORTRAN) : $(OBJ) $(OBJ_FORTRAN)
	ar rscv library/$(TARGET_FORTRAN).a $(OBJ) $(OBJ_FORTRAN)

$(OBJ_DIR)/%.o : src/%.cpp
	$(CC) -c $< -o $@ $(CFLAGS) -I./src -I./include

$(OBJ_DIR)/%.o : src/%.f90
	$(FC) -c $< -o $@ $(FFLAGS) -I./src -I./include -J./include

clean :
	-rm $(OBJ_DIR)/*.o
	-rmdir $(OBJ_DIR)
	-rm include/*.mod
	-rm library/$(TARGET).a
	-rm library/$(TARGET_FORTRAN).a
	-rmdir library
	-rm test
	-rm test_fortran
