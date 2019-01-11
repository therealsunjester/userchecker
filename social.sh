#!/bin/bash
#sunjester
echo "checking for username: "$@

RED=`tput setaf 1`
GRN=`tput setaf 2`
RST=`tput sgr0`

sites=(
	"https://www.facebook.com"
	"https://www.instagram.com"
	"https://www.twitter.com"
	"https://www.youtube.com/user"
	"https://www.reddit.com/user"
	"https://www.pinterest.com"
	"https://www.github.com"
	"https://www.patreon.com"
)

for site in "${sites[@]}"
do
	res=$(curl -Is $site"/"$@"/" >social;head -n1 social)
	code=`echo $res|cut -d' ' -f2`
	case $code in
		200)
		echo $GRN $site"/"$@"/" $RST
		;;
		404)
		echo $RED $site"/"$@"/" $RST
		;;
                301)
                echo $GRN $site"/"$@"/" $RST
                ;;
                405)
                echo $RED $site"/"$@"/" $RST
                ;;
	esac
done

rm social
