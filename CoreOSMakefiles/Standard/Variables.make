##
# Standard Variables
#
# Wilfredo Sanchez | wsanchez@apple.com
# Copyright (c) 1997-1999 Apple Computer, Inc.
#
# @APPLE_LICENSE_HEADER_START@
# 
# "Portions Copyright (c) 1999 Apple Computer, Inc.  All Rights
# Reserved.  This file contains Original Code and/or Modifications of
# Original Code as defined in and that are subject to the Apple Public
# Source License Version 1.0 (the 'License').  You may not use this file
# except in compliance with the License.  Please obtain a copy of the
# License at http://www.apple.com/publicsource and read it before using
# this file.
# 
# The Original Code and all software distributed under the License are
# distributed on an 'AS IS' basis, WITHOUT WARRANTY OF ANY KIND, EITHER
# EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
# INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE OR NON-INFRINGEMENT.  Please see the
# License for the specific language governing rights and limitations
# under the License."
# 
# @APPLE_LICENSE_HEADER_END@
##

##
# Where to find Makefiles
##
ifndef CoreOSMakefiles
CoreOSMakefiles = $(MAKEFILEPATH)/CoreOS
else
CoreOSMakefiles := $(shell cd $(CoreOSMakefiles) && pwd)
endif

##
# Verbosity
##
ifeq ($(RC_JASPER),YES)
VERBOSE = YES
else
VERBOSE = NO
endif

_v = $(subst NO,@,$(subst YES,,$(VERBOSE)))
_q = $(subst YES,@,$(subst NO,,$(VERBOSE)))

##
# Working Directory
##
WD := $(shell pwd)

##
# User
##
USER = $(shell whoami)

##
# Host Platform
##
ifeq ($(wildcard $(UNAME)),)
OSName    := unknown
OSVersion := unknown
else
OSName    := $(shell $(UNAME) -s)
OSVersion := $(shell $(UNAME) -r)
endif

##
# Find Garbage
##
Cruft      = CVS RCS SCCS *~ .*~ .nfs\* .*.wmd
Find_Cruft = '(' $(Cruft:%=-name '%' -or) -name '' ')' -print

##
# Install
##
Install_User            = root
Install_File_User       = $(Install_User)
Install_Program_User    = $(Install_User)
Install_Directory_User  = $(Install_User)
Install_Group           = wheel
Install_File_Group      = $(Install_Group)
Install_Program_Group   = $(Install_Group)
Install_Directory_Group = $(Install_Group)
Install_Mask            = 0022
Install_File_Mode       = 0444
Install_Program_Mode    = 0555
Install_Directory_Mode  = 0755

##
# Locations
##
AUTOMOUNTDIR          = $(NSNETWORKDIR)/Servers
BINDIR                = /bin
CORESDIR              = /cores
DEVDIR                = /dev
ETCDIR                = /private/etc
LIBDIR                = /lib
LIBEXECDIR            = $(USRDIR)/libexec
LOGDIR                = $(VARDIR)/log
MANDIR                = $(SHAREDIR)/man
MAILDIR               = $(VARDIR)/mail
MISCDIR               = $(SHAREDIR)/misc
NSADMINDIR            = $(NSDEFAULTLOCATION)$(NSADMINSUBDIR)
NSADMINSUBDIR         = /Administration
NSAPPLICATIONDIR      = $(NSDEFAULTLOCATION)$(NSAPPLICATIONSUBDIR)
NSAPPLICATIONSUBDIR   = /Applications
NSDEFAULTLOCATION     = $(NSSYSTEMDIR)
NSDEMODIR             = $(NSDEFAULTLOCATION)$(NSDEMOSUBDIR)
NSDEMOSUBDIR          = /Demos
NSDEVELOPERAPPSDIR    = $(NSDEVELOPERDIR)$(NSAPPLICATIONSUBDIR)
NSDEVELOPERDIR        = $(NSDEFAULTLOCATION)$(NSDEVELOPERSUBDIR)
NSDEVELOPERSUBDIR     = /Developer
NSDOCUMENTATIONDIR    = $(NSDEFAULTLOCATION)$(NSDOCUMENTATIONSUBDIR)
NSDOCUMENTATIONSUBDIR = /Documentation
NSFRAMEWORKDIR        = $(NSDEFAULTLOCATION)$(NSFRAMEWORKSUBDIR)
NSFRAMEWORKSUBDIR     = $(NSLIBRARYSUBDIR)/Frameworks
NSLIBRARYDIR          = $(NSDEFAULTLOCATION)$(NSLIBRARYSUBDIR)
NSLIBRARYSUBDIR       = /Library
NSLOCALDIR            = /Local
NSNETWORKDIR          = /Network
NSSOURCEDIR           = $(NSDEVELOPERDIR)$(NSSOURCESUBDIR)
NSSOURCESUBDIR        = /Source
NSSYSTEMDIR           = /System
RUNDIR                = $(VARDIR)/run
SBINDIR               = /sbin
SHAREDIR              = $(USRDIR)/share
SPOOLDIR              = $(VARDIR)/spool
TMPDIR                = /tmp
USRBINDIR             = $(USRDIR)/bin
USRDIR                = /usr
USRINCLUDEDIR         = $(NSSYSTEMDIR)$(NSFRAMEWORKSUBDIR)/System.framework/Versions/B/Headers/bsd
USRLIBDIR             = $(USRDIR)/lib
USRSBINDIR            = $(USRDIR)/sbin
VARDIR                = /var
VARTMPDIR             = $(VARDIR)/tmp

##
# Targets
##
showvar:
	@echo $($(VAR))
