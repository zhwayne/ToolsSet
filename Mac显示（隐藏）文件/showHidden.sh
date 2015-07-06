#########################################################################
# File Name: showHidden.sh
# Author: wayne
# mail: zhwayne@qq.com
# Created Time: 三  6/10 09:39:42 2015
#########################################################################
#!/bin/bash

defaults write com.apple.finder AppleShowAllFiles -bool $1
killall Finder
