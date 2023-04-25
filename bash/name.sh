#This rule is made for when a user specifies a UNIQUE Training Activity in bash/jq.sh bash script
jq '.sport' $1

#This rule is made for when a user does not specify a UNIQUE Training Activity, and therefore, by default, ALL Training Activity is made in output files
jq '.exercises[].sport' $1
