export WHTOP="$HOME/src/warehouse"

findtrtop()
{
	candidate=`pwd`
	while true; do
		if [[ -e "$candidate/GNUmaster" &&  -e "$candidate/tr" && -e "$candidate/Crawlers" ]]; then
			trtop $candidate
			break;
		else
			nextcandidate=${candidate%/*}
			if [[ "v$nextcandidate" == "v$candidate" || "v$nextcandidate" == "v" ]]; then
			break;
			fi
			candidate=$nextcandidate;
		fi
	done
}

trtop()
{
	if (( $# == 1 )); then
		oldscripts=$TRTOP/scripts:$TRTOP/scripts/build
		export TRTOP=$1
		export PATH=${PATH//:$oldscripts}:$TRTOP/scripts:$TRTOP/scripts/build
	else
		echo $TRTOP
	fi
}

# define profiles based on directories:
zstyle ':chpwd:profiles:/Users/wasche/src(|/|/*)' profile ta

# configuration for profile 'ta':
chpwd_profile_ta()
{
  [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1
  print "chpwd(): Switching to profile: $profile"
  findtrtop
}
