class_name CommandPostEvent
extends SESCommand
# Wach out for cyclic dependency!
# If object of this class belongs to script or action, 
# then do not set "reciver" property as this specyfic script or action


var receiver: Object
var event_name: String
var arg_array: Array


func _init(_receiver: Object, _event_name: String, _arg_array: Array):
	receiver = _receiver
	event_name = _event_name
	arg_array = _arg_array


func _execute_me() -> void:
	if receiver and receiver.has_method(event_name):
		receiver.callv(event_name, arg_array)
