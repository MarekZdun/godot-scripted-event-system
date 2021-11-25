class_name SESActionList
extends SESActionEvent


var elements: Array = []

	
func _process_me(delta: float) -> void:
	for element in elements:
		if active and element is SESActionEvent:
			element.process(delta)
		
		
func _reset() -> void:
	active = false
	time_scale = 1
	
	for element in elements:
		if element is SESActionEvent: 
			element._reset()


func set_active(_active: bool) -> void:
	active = _active
	
	var listen_for_anyone = false
	for element in elements:
		if element is SESActionEvent: 
			element.set_active(_active)
			if element.is_connected("done", self, "_on_event_callback"):
				listen_for_anyone = true
		elif active and element is SESCommand:
			element.execute()
			
	if active and not listen_for_anyone:
		action_done()
		
		
func set_time_scale(_time_scale: float) -> void:
	time_scale = _time_scale
	
	for element in elements:
		if element is SESActionEvent: 
			element.set_time_scale(_time_scale)
		

func enqueue(element: Resource, listen_to_callback: bool) -> void:
	elements.push_back(element)
	if listen_to_callback and element is SESActionEvent:
		element.connect("done", self, "_on_event_callback")

		
func _on_event_callback(_element) -> void:
	action_done()

