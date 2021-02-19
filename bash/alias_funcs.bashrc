
alias android='/cygdrive/d/Android/sdk/tools/android.bat'
alias ll='ls -l --color=tty'
alias ls='ls -hF --color=tty'
alias monitor='/cygdrive/d/Android/sdk/tools/monitor.bat'
alias ndk-build='/cygdrive/d/Android/Ndk/android-ndk-r12b/ndk-build.cmd'
alias ndk-depends='/cygdrive/d/Android/Ndk/android-ndk-r12b/ndk-depends.cmd'
alias ndk-gdb='/cygdrive/d/Android/Ndk/android-ndk-r12b/ndk-gdb.cmd'
alias ndk-stack='/cygdrive/d/Android/Ndk/android-ndk-r12b/ndk-stack.cmd'
alias sdkmanager='/cygdrive/d/Android/sdk/tools/bin/sdkmanager.bat'
alias winx='/cygdrive/c/Windows/explorer.exe /e,`cygpath -w $PWD`'
#alias winx='nautilus ./'
#alias winx='xdg-open ./'
alias pkg='make packaging'
alias bm33='cd platform/tahiti/m33/ ; make ; cd -'
alias bcape='cd platform/tahiti/cape2/ ; make ; cd -'
alias bhifi='cd platform/tahiti/hifi3/ ; make ; cd -'
alias clean='make clean' 
alias cls='clear'
alias check='cppcheck --enable=all . &> cppcheck.rpt; notepad++ ./cppcheck.rpt &'
alias checkc='cppcheck --enable=all'
alias checkg='cppcheckgui'
alias cpg='cppcheckgui'
alias cfg='cat current_config' 
#read content from file and assign to one  variable in sh/bash 
#two ways to create the vars from command result for get content from one file 
#alias cfg_var='var=`cat current_config`'   
#alias cfg_var='var=$(<current_config)' 

#Note1: exploer only known the backslash 
#Note2: alias work with sed had conflict with single quote and double quote , below alias can not work as expect 

#alias  iload='var=$(<current_config); var2="bld/"$var"/release/fcp/orig_build/i2c_load.exe"; ./$var2 -s partition_boot2flash.img'
#alias  iload="var=$(<current_config); var2=./bld/'$var'/release/fcp/orig_build ; echo $var2; var3=$(echo $var2 | sed -e 's#\/#\\#g'); echo $var3 ; explorer $var3"

#below is workable (not sed )
alias  iflash='var=$(<current_config); var2="bld/"$var"/release/fcp/orig_build/i2c_flash_f3.exe";  var3=bld/"$var"/release/fcp/orig_build/partition_flash.img; var4=bld/"$var"/release/fcp/orig_build/iflash.bin; ./$var2 -b $var4 -s $var3'
alias  iload='var=$(<current_config); var2="bld/"$var"/release/fcp/orig_build/i2c_load.exe";  var3=bld/"$var"/release/fcp/orig_build/partition_boot2flash.img;./$var2 -s $var3'


#Note3: use function to solve the alias issue, because the single quote, double quote 
iloadf () {
	var=$(<current_config); 
	#echo $var
	var2=./bld/"$var"/release/fcp/orig_build ; 
	#echo $var2; 
	var3=$(echo $var2 | sed -e 's#\/#\\#g'); 
	#echo $var3
	#explorer $var3
    var4="$var2"/i2c_load.exe
	var5="$var2"/partition_boot2flash.img
	#echo $var4
	./$var4 -s $var5
}

iflashf () {
	var=$(<current_config); 
	#echo $var
	var2=./bld/"$var"/release/fcp/orig_build ; 
	#echo $var2; 
	var3=$(echo $var2 | sed -e 's#\/#\\#g'); 
	#echo $var3
	#explorer $var3
    var4="$var2"/i2c_flash_f3.exe
	var5="$var2"/partition_flash.img
	var6="$var2"/iflash.bin
	#echo $var4
	./$var4 -b $var6 -s $var5
}

ifcpf () {
	var=$(<current_config); 
	#echo $var
	var2=./bld/"$var"/release/fcp/orig_build ; 
	#echo $var2; 
	var3=$(echo $var2 | sed -e 's#\/#\\#g'); 
	#echo $var3
	explorer $var3
}




