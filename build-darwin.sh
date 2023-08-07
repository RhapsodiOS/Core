#!/bin/bash

# We should have the debs in BuildDebs directory, then the source directories from Git next to it

# create our log directory
LOGDIR=/usr/src/apple/logs
mkdir -p $LOGDIR

# clear out our temporary roots directory
rm -rf /tmp/roots

# create our package directory to hold completed packages
BUILTDEBSDIR=/build
mkdir -p $BUILTDEBSDIR

# grab our current directory holding the already completed packages
DEBSDIR=`pwd`/BuildDebs

# change into the Commands directory and start building
echo Starting build of Commands projects at `date`
echo Starting build of Commands projects at `date` > $LOGDIR/MasterBuild.log
echo ==========================
echo ========================== > $LOGDIR/MasterBuild.log
pushd Commands
for CommandsProj in *; do
   name=$(basename $CommandsProj)
   echo Starting build of $name at `date`
   echo Starting build of $name at `date` > $LOGDIR/$name.log
   darwin-buildpackage --dir --target all $name $DEBSDIR $BUILTDEBSDIR >> $LOGDIR/$name.log 2>&1
   echo Finished at `date` >> $LOGDIR/$name.log
   
   if [ $? -eq 0 ]; then
      echo Finished build of $name at `date`
   else
      echo *** FAILED $name ***
   fi
done;
popd

echo ==========================
echo ========================== > $LOGDIR/MasterBuild.log

# change into the Core directory and start building
echo Starting build of Core projects at `date`
echo Starting build of Core projects at `date` > $LOGDIR/MasterBuild.log
echo ==========================
echo ========================== > $LOGDIR/MasterBuild.log
pushd Core
for CoreProj in *; do
   name=$(basename $CoreProj)
   echo Starting build of $name at `date`
   echo Starting build of $name at `date` > $LOGDIR/$name.log
   darwin-buildpackage --dir --target all $name $DEBSDIR $BUILTDEBSDIR >> $LOGDIR/$name.log 2>&1
   echo Finished at `date` >> $LOGDIR/$name.log
   
   if [ $? -eq 0 ]; then
      echo Finished build of $name at `date`
   else
      echo *** FAILED $name ***
   fi
done;
popd

echo ==========================
echo ========================== > $LOGDIR/MasterBuild.log

# change into the GNU directory and start building
echo Starting build of GNU projects at `date`
echo Starting build of GNU projects at `date` > $LOGDIR/MasterBuild.log
echo ==========================
echo ========================== > $LOGDIR/MasterBuild.log
pushd GNU
for GNUProj in *; do
   name=$(basename $GNUProj)
   echo Starting build of $name at `date`
   echo Starting build of $name at `date` > $LOGDIR/$name.log
   darwin-buildpackage --dir --target all $name $DEBSDIR $BUILTDEBSDIR >> $LOGDIR/$name.log 2>&1
   echo Finished at `date` >> $LOGDIR/$name.log
   
   if [ $? -eq 0 ]; then
      echo Finished build of $name at `date`
   else
      echo *** FAILED $name ***
   fi
done;
popd

echo ==========================
echo ========================== > $LOGDIR/MasterBuild.log

# change into the Kernel directory and start building
echo Starting build of Kernel projects at `date`
echo Starting build of Kernel projects at `date` > $LOGDIR/MasterBuild.log
echo ==========================
echo ========================== > $LOGDIR/MasterBuild.log
pushd Kernel
for KernelProj in *; do
   name=$(basename $KernelProj)
   echo Starting build of $name at `date`
   echo Starting build of $name at `date` > $LOGDIR/$name.log
   darwin-buildpackage --dir --target all $name $DEBSDIR $BUILTDEBSDIR >> $LOGDIR/$name.log 2>&1
   echo Finished at `date` >> $LOGDIR/$name.log
   
   if [ $? -eq 0 ]; then
      echo Finished build of $name at `date`
   else
      echo *** FAILED $name ***
   fi
done;
popd

echo ==========================
echo ========================== > $LOGDIR/MasterBuild.log

# change into the Libraries directory and start building
echo Starting build of Libraries projects at `date`
echo Starting build of Libraries projects at `date` > $LOGDIR/MasterBuild.log
echo ==========================
echo ========================== > $LOGDIR/MasterBuild.log
pushd Libraries
for LibrariesProj in *; do
   name=$(basename $LibrariesProj)
   echo Starting build of $name at `date`
   echo Starting build of $name at `date` > $LOGDIR/$name.log
   darwin-buildpackage --dir --target all $name $DEBSDIR $BUILTDEBSDIR >> $LOGDIR/$name.log 2>&1
   echo Finished at `date` >> $LOGDIR/$name.log
   
   if [ $? -eq 0 ]; then
      echo Finished build of $name at `date`
   else
      echo *** FAILED $name ***
   fi
done;
popd

echo ==========================
echo ========================== > $LOGDIR/MasterBuild.log

# change into the Services directory and start building
echo Starting build of Services projects at `date`
echo Starting build of Services projects at `date` > $LOGDIR/MasterBuild.log
echo ==========================
echo ========================== > $LOGDIR/MasterBuild.log
pushd Services
for ServicesProj in *; do
   name=$(basename $ServicesProj)
   echo Starting build of $name at `date`
   echo Starting build of $name at `date` > $LOGDIR/$name.log
   darwin-buildpackage --dir --target all $name $DEBSDIR $BUILTDEBSDIR >> $LOGDIR/$name.log 2>&1
   echo Finished at `date` >> $LOGDIR/$name.log
   
   if [ $? -eq 0 ]; then
      echo Finished build of $name at `date`
   else
      echo *** FAILED $name ***
   fi
done;
popd

echo ==========================
echo ========================== > $LOGDIR/MasterBuild.log
echo Finished all builds at `date`
echo Finished all builds at `date` > $LOGDIR/MasterBuild.log