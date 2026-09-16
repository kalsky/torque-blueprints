package torque.environment

import future.keywords.if

result := {
	"decision": "Denied",
	"reason": sprintf("DEBUG owner_active=%v max_config=%v full_input=%v full_data=%v", [
		input.owner_active_environments_in_space,
		data.max_active_envs_in_space_per_owner,
		input,
		data,
	]),
}
