#This rule is made for when a user would like to filter their JSON Training Data by a specific sport like Strength Training 
jq '.exercises[] | select(.sport == "STRENGTH_TRAINING")' Training/*.json

#This rule is made for when a user does not specify a Unique Training Activity, and therefore, by default ALL Training Activities are made in output files
jq '.' Training/*.json
