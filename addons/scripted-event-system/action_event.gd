class_name SESActionEvent
extends Resource


signal done(emitter)

var active: bool = false setget set_active
var time_scale: float = 1.0 setget set_time_scale


func process(delta: float) -> void:
	if active == false: 
		return
	_process_me(delta)

	
func _process_me(delta: float) -> void:
	assert(false, "Override activate in subtypes")

	
func _reset() -> void:
	assert(false, "Override activate in subtypes")

	
func action_done() -> void:
	active = false
	emit_signal("done", self)

	
func set_active(_active: bool) -> void:
	active = _active

	
func get_active() -> bool:
	return active

	
func set_time_scale(_time_scale: float) -> void:
	time_scale = _time_scale

	
func get_time_scale() -> float:
	return time_scale
