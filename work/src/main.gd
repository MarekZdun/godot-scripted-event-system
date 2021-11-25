extends Node


var action_events: Dictionary = {}
var script_factory: Resource = null


func _ready():
	script_factory = ScriptFactory.new(self)
	var script = script_factory.create(2)
	script.connect("done", self, "_on_Script_event_callback")
	script.set_active(true)
	if script.active:
		action_events[script.get_instance_id()] = script


func _process(delta):
	for ae_key in action_events:  
		action_events[ae_key].process(delta)


func _input(event):
	if event.is_action_pressed("ui_accept"):
		for ae_key in action_events:  
#			action_events[ae_key].set_active(!action_events[ae_key].active)

			if action_events[ae_key].active:
				action_events[ae_key]._reset()
			else:
				action_events[ae_key].set_active(true)
	elif event.is_action_pressed("ui_down"):
		for ae_key in action_events:
			action_events[ae_key].set_time_scale(0)
	elif event.is_action_pressed("ui_up"):
		for ae_key in action_events:
			action_events[ae_key].set_time_scale(1)		


func _on_BehaviorTimer_event_callback(ae):
	print("behavior done")
	var _success: bool = action_events.erase(ae.get_instance_id())
	
	
func _on_ActionList_event_callback(ae):
	print("action list done")
	var _success: bool = action_events.erase(ae.get_instance_id())


func _on_Script_event_callback(ae):
	print("script done")
	var _success: bool = action_events.erase(ae.get_instance_id())
	script_factory = null


func _on_post_event(name: String) -> void:
	print(name)
