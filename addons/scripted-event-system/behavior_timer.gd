class_name BehaviorTimer
extends SESActionEvent


var time: float = 0
var duration: float


func _init(_duration: float):
	duration = _duration

	
func _process_me(delta: float) -> void:
	time += delta * time_scale
	if time >= duration:
		action_done()

		
func _reset() -> void:
	active = false
	time = 0
	time_scale = 1
