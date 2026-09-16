package torque.environment

# data.required_role — the account role required to perform this operation (e.g. "admin")
# Defaults to "admin" if not set by the space admin.

default required_role := "admin"

required_role := data.required_role if {
    data.required_role
}

result = { "decision": "Approved" } if {
    required_role in input.roles.account_roles
}

result = { "decision": "Denied", "reason": reason } if {
    not required_role in input.roles.account_roles
    reason := sprintf("This operation requires the '%v' account role. Your account roles: %v",
                      [required_role, input.roles.account_roles])
}
