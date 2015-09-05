# retroshare06_compile_script_for_android_arm
Compile script for use retroshare on android

# How-to use
This is not fully tested script, please edit compile script for your needs:

    ./rs06_compile_arm.sh
# How-to set up script
To use this script you need to set needed variables in your shell (terminal), example:

    export RS06_RSDIR=retroshare

Necessarily needed to set up variables:

1. RS06_COMPILE_BASE for compile retroshare libraries, "1" if compile, default "0"

2. RS06_COMPILE_NOGUI compiling retroshare-nogui, "1" if needed, default "0"

3. RS06_COMPILE_GUI for compile retroshare-gui, "1" if needed, default "0"

4. RS06_DOWNLOAD_RS for download old retroshare revision from SourceForge, default "0"

5. RS06_CLONE_RS_GITHUB for clone retroshare github repository, "1" if needed, default "0"

6. RS06_CPUCORES cpu cores for make (make -j1), default "1"

If you do not want to set up vars, you can use simple config, type this to your terminal:
    export RS06_COMPILE_BASE=1
    export RS06_COMPILE_NOGUI=1
    export RS06_COMPILE_GUI=1
    export RS06_DOWNLOAD_RS=0
    export RS06_CLONE_RS_GITHUB=1
    export RS06_CPUCORES=1

# P.s.
If you found error in the text, sorry, my English is bad :)
