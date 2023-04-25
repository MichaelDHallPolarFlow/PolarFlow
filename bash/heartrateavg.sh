#Please comment at least one of these rules out
#This rule is made for when user specifies ONE Training Activity in bash/jq.sh bash script i.e. "POOL_SWIMMING"
jq '.heartRate.avg' $1

#This rule is made for when user does not specify a Training Activity, and therefore, ALL Training Activity is made in output files
jq '.exercises[].heartRate.avg' $1
