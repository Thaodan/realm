include ../rules.mk
# app config
APPNAME			= usenew
REALM_VER     	 	= 1.24
WSYSTEMRC		= 0
SYSTEMRC		= /etc/$(APPNAME)rc
WUSERRC			= 0
GIT_REV    		= $(shell ./../tools/git_revgen)
USERRC			= "$\{XDG_CONFIG_HOME\:-$HOME/.config}"
SCRIPTS			= realm
HOST			= $(shell uname --kernel-name )
SHPP_FLAGS 		=
ifeq ($(HOST),BSD)
else ifeq ($(HOST),Linux)
SHPP_FLAGS+=-Dunix -DWINE
endif

ifeq ($(HOST),MINGW*)
SHPP_FLAGS+=-Dmingw
endif

ifeq ($(HOST),Darwin)
SHPP_FLAGS+=-Dmac_os_x
endif

all: $(SCRIPTS)

$(SCRIPTS): ${SCRIPTS:=.in.sh} config.shh
	$(SHPP) $(SHPP_FLAGS) $(@).in.sh -o $@

config.shh: 
	@echo $@: generating 
	@echo '#\\define VER=$(REALM_VER)' > $@
#	@echo '#\\define prefix=$(PREFIX)' >> $@
	@echo '#\\define git_rev=$(GIT_REV)' >> $@



install: $(SCRIPTS)
	$(INSTALL) -dm755 $(bindir)
	$(INSTALL) -m755 $(^) $(bindir) 

clean:
	rm -f $(SCRIPTS)
	rm -f config.shh

.PHONY: all clean libuse install
