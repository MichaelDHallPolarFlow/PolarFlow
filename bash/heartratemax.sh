#This rule is made for when a user specifies ONE Training Activity in bash/jq.sh bash script. i.e. "POOL_SWIMMING"
jq '.heartRate.max' $1

#This rule is made for when a user does not specify a Training Activity, and therefore ALL Training Activities are in output files
jq '.exercises[].heartRate.max' $1
