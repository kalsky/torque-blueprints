package torque.environment
import future.keywords.if

result = { "decision": "Denied", "reason": "Requested environment duration exceeds 180 minutes" } if {
   input.duration_minutes >= 180
}

result = { "decision": "Approved", "reason": "Requested environment duration do not exceeds 180 minutes" } if {
   input.duration_minutes < 180
}

result = { "decision": "Approved", "reason": "duration_minutes not present in input; skipping duration check" } if {
   not input.duration_minutes
}
