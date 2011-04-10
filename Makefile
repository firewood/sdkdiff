# THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF 
# ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
# PARTICULAR PURPOSE.
#
# Copyright 2002 Microsoft Corporation.  All Rights Reserved.
#
#
# Processor independent makefile

# Nmake macros for building makefile
!include <win32.mak>

PROJ = SDKDIFF 

all: $(OUTDIR) $(OUTDIR)\sdkdiff.exe $(OUTDIR)\sdkdiff.hlp

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"
    
#--------------------------------------------------------------------#
    
SOURCES=bar.cpp      \
        compitem.cpp \
        complist.cpp \
	errorout.cpp \
        file.cpp     \
	findgoto.cpp \
	gfile.cpp    \
	gutils.cpp   \
        line.cpp     \
	list.cpp     \
        profile.cpp  \
        scandir.cpp  \
        section.cpp  \
	status.cpp   \
	table.cpp    \
	tpaint.cpp   \
	tprint.cpp   \
	tree.cpp     \
	tscroll.cpp  \
	utils.cpp    \
        view.cpp     \
        sdkdiff.cpp   
    
OBJS=$(OUTDIR)\bar.obj      \
     $(OUTDIR)\compitem.obj \
     $(OUTDIR)\complist.obj \
     $(OUTDIR)\errorout.obj \
     $(OUTDIR)\file.obj     \
     $(OUTDIR)\findgoto.obj \
     $(OUTDIR)\gfile.obj    \
     $(OUTDIR)\gutils.obj   \
     $(OUTDIR)\line.obj     \
     $(OUTDIR)\list.obj     \
     $(OUTDIR)\profile.obj  \
     $(OUTDIR)\scandir.obj  \
     $(OUTDIR)\section.obj  \
     $(OUTDIR)\status.obj   \
     $(OUTDIR)\table.obj    \
     $(OUTDIR)\tpaint.obj   \
     $(OUTDIR)\tprint.obj   \
     $(OUTDIR)\tree.obj     \
     $(OUTDIR)\tscroll.obj  \
     $(OUTDIR)\utils.obj    \
     $(OUTDIR)\view.obj     \
     $(OUTDIR)\sdkdiff.obj   

ELIBS=shell32.lib  \
    Comdlg32.lib \
    User32.lib   \
    Advapi32.lib \
    Gdi32.lib

# Build rules for resource files
    
$(OUTDIR)\sdkdiff.res: sdkdiff.rc 
    $(rc) $(rcflags) $(rcvars) /fo $(OUTDIR)\sdkdiff.res sdkdiff.rc
    

$(OBJS): $(SOURCES)
    $(cc) $(cdebug) $(cflags) $(cvarsmt) /Fo"$(OUTDIR)\\" /Fd"$(OUTDIR)\\"  $(SOURCES)
    
$(OUTDIR)\sdkdiff.exe: $(OBJS) $(OUTDIR)\sdkdiff.res
	$(link) $(linkdebug) $(guiflags) -out:$(OUTDIR)\sdkdiff.exe $(OBJS) $(ELIBS) $(OUTDIR)\sdkdiff.res 
	
# Build rule for help file
$(OUTDIR)\sdkdiff.hlp: sdkdiff.rtf sdkdiff.hpj
    $(hc) -o .\$(OUTDIR)\sdkdiff.hlp $(hcvars) sdkdiff.hpj 
    copy sdkdiff.hlp $(OUTDIR)\sdkdiff.hlp

clean:
	$(CLEANUP)
