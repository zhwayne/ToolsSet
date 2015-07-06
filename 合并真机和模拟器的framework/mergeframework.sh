#!/bin/bash
clear

read -p "· Enter framework name >" framework_name

framework_for_iphoneos_path="Release-iphoneos/${framework_name}.framework"
framework_for_simulator_path="Release-iphonesimulator/${framework_name}.framework"


if [ -d "./$framework_for_iphoneos_path" ] && [ -d "./$framework_for_simulator_path" ]; then
	
	lipo_info_msg=`lipo -i $framework_for_iphoneos_path/$framework_name`
	echo · iphoneos framework support: ${lipo_info_msg#*are:}
	lipo_info_msg=`lipo -i $framework_for_simulator_path/$framework_name`
	echo · simulator framework support: ${lipo_info_msg#*are:}

	echo · start merge...

	# 合并
	lipo -c $framework_for_iphoneos_path/$framework_name $framework_for_simulator_path/$framework_name -o $framework_name
	# 复制framework
	cp -R $framework_for_iphoneos_path .
	cd $framework_name.framework
	# rm -rf $framework_name
	mv ../$framework_name .
	cd ../
	lipo_info_msg=`lipo -i $framework_name.framework/$framework_name`
	echo · universal framework support: ${lipo_info_msg#*are:}

	echo · merge finish, enjoy it.
	# open .
else
	echo · no such framework.
fi

