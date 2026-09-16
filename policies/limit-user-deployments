package torque.environment

import future.keywords.if

# The purpose of this policy is to enforce a maximum number of active environments in space per owner.
# It takes the following number as an argument (in the data object):
#   max_active_envs_in_space_per_owner
#
# An example of a data object for this policy looks like this:
# {
#   "max_active_envs_in_space_per_owner": 5,
# }
#
# In this example we set the maximum number of active environments in space for a given owner to be 5. 

equals(a, b) if {
  a == b
}

contains_case_insensitive(arr, elem) if {
  lower_elem := lower(elem)
  equals(lower(arr[_]), lower_elem)
}

result := {"decision": "Denied", "reason": "max_active_envs_in_space_per_owner must be a number"} if {
  data.max_active_envs_in_space_per_owner
  not is_number(data.max_active_envs_in_space_per_owner)
}

result := {"decision": "Approved"} if {
  is_number(data.max_active_envs_in_space_per_owner)
  contains_case_insensitive(data.admin_emails, input.user_email)
}

result := {"decision": "Denied", "reason": "You have reached the maximum number of active environments allowed (1). Please try again after terminating your currently active environment."} if {
  not contains_case_insensitive(data.admin_emails, input.user_email)
  data.max_active_envs_in_space_per_owner < input.owner_active_environments_in_space + 1
}

result := {"decision": "Approved"} if {
  is_number(data.max_active_envs_in_space_per_owner)
  data.max_active_envs_in_space_per_owner >= input.owner_active_environments_in_space + 1
} 
