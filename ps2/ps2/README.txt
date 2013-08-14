Files for CS229 Problem set 2.  Please do not circulate this data outside this class.

Installing and Using LIBLINEAR
------------------------------

Download LIBLINEAR 2.7 from http://www.csie.ntu.edu.tw/~cjlin/liblinear/ .

Read liblinear-1.7/README for an overview of the LIBLINEAR library.

Matlab on Linux/Unix
--------------------
On Unix machines you should download liblinear-1.7.tar.gz to your local ps2/ directory.  Next extract the files from the tarball:

tar xzf liblinear-1.7.tar.gz

liblinear-1.7/matlab contains the Matlab interface, which you will need to compile.  We've included a modified Makefile for LIBLINEAR in the ps2/ directory, with paths updated to work on the corn.stanford.edu machines.  If you use a different machine than corn, you should change the MATLABDIR variable in the liblinear-1.7/matlab/Makefile to point to your version of Matlab.  You can locate it with the command 'which matlab'.  You should copy this Makefile to the liblinear-1.7/matlab directory, change to that directory, and run make:

cp Makefile liblinear-1.7/matlab
cd liblinear-1.7/matlab
make

See liblinear-1.7/matlab/README for information on what functions to call.  In particular, you will need to call the train and predict functions.  Use the default parameter settings for these functions.

Windows or Octave
-----------------
If you use Windows or Octave, we recommend that you use the command line versions of the train and predict functions, which are located in liblinear-1.7/windows for Windows and liblinear-1.7/ for Linux/Unix.  You first need to convert the dataset from our format to the LIBLINEAR format by calling the function liblinearwrite('inputfile', 'outputfile') in Matlab, for example liblinearwrite('MATRIX.TRAIN', 'MATRIX.LIBLINEAR.TRAIN').  You can then use these files as input to the train and predict programs.  You can find out how to use the predict.exe and train.exe programs by calling them without arguments.
