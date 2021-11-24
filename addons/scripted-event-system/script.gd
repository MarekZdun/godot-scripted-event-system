class_name SESScript
extends SESActionEvent


var elements: Array = []
var current_element_index: int = 0

	
func _process_me(delta: float) -> void:
	while (
			current_element_index <= elements.size() - 1 
			and elements[current_element_index] is SESCommand
	):
		elements[current_element_index].execute()
		dequeue()
		
	if (
			current_element_index <= elements.size() - 1 
			and elements[current_element_index] is SESActionEvent
	):
		elements[current_element_index]._process(delta)
		
	if active and current_element_index > elements.size() - 1:
		action_done()
		
		
func _reset() -> void:
	active = false
	current_element_index = 0
	time_scale = 1
	
	for element in elements:
		if element is SESActionEvent: 
			element._reset()


func set_active(_active: bool) -> void:
	active = _active
	if (
			current_element_index <= elements.size() - 1
			and elements[current_element_index] is SESActionEvent
	):
		elements[current_element_index].set_active(_active)
		
		
func set_time_scale(_time_scale: float):
	time_scale = _time_scale
	
	for element in elements:
		if element is SESActionEvent: 
			element.set_time_scale(_time_scale)
	
	
func enqueue(element: Resource) -> void:
	elements.push_back(element)
	if element is SESActionEvent:
		element.connect("done", self, "_on_event_callback")
	
	
func dequeue() -> void:
	current_element_index += 1
	if (
			current_element_index <= elements.size() - 1 
			and elements[current_element_index] is SESActionEvent
	):
		elements[current_element_index].set_active(true)
	
	
func _on_event_callback(_element) -> void:
	dequeue()
	if current_element_index > elements.size() - 1:
		action_done()
	
