# This file belongs to the Open Source Community Africa, permissions are
# hereby granted to distribute, modify or even commercialized so long as 
# this ownership notice is kept and the commercialized version retains an
# explicit license from OSCA. And therefore abiding all Community Licence
#
# NOTE: We therefore own it that we are the makers and architects of the
# Opensource Community Licence (OCL). visit http://oscakampala.org/licence
# for more and https://oscakampala.org/contribution for the ever best 
# contribution practices.
#
# The future is Open!
 
# Author: Phrunsys Emmason
# Email: phrunsys@scpel.org
# Bug reports: https://bugmania.oscakampala.org/

# Compiler and flags
SPL := scpel
CFLAGS := -Wall -Iinc

# Source and object files
SRC_DIR := source
INC_DIR := includes
OBJ_DIR := forge
EXA_DIR := examples
TST_DIR := testsuite

# List of source files
SRC_FILES := $(wildcard $(SRC_DIR)/*.scpel)

# Generate a list of object files from source files
OBJ_FILES := $(patsubst $(SRC_DIR)/%.scpel, $(OBJ_DIR)/%.o, $(SRC_FILES))

# Target for the static library
LIB_NAME := libsdv.a
LIB_TARGET := $(LIB_NAME)

# Targets
all: $(LIB_TARGET)

$(LIB_TARGET): $(OBJ_FILES)
	ar rcs $(LIB_NAME) $(OBJ_FILES)

# Rule to compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.scpel
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(LIB_NAME)

.PHONY: all clean