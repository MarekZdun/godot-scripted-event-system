class_name ScriptFactory
extends Resource


var parent: Node


func _init(_parent: Node):
	parent = _parent


func create(n) -> SESActionEvent:
	var script: SESActionEvent
	if n == 0:
		script = set_b()
	elif n == 1:
		script = set_b_b()
	elif n == 2:
		script = set_b_c()
	elif n == 3:
		script = set_b_b_c()
	elif n == 4:
		script = set_b_b_c_b()
	elif n == 5:
		script = set_b_c_c()
	elif n == 6:
		script = set_c()
	elif n == 7:
		script = set_c_c()
	elif n == 8:
		script = set_c_b()
	elif n == 9:
		script = set_c_c_b()
	elif n == 10:
		script = set_c_c_b_c()
	elif n == 11:
		script = set_c_b_b() 
	elif n == 12:
		script = set_s()
	elif n == 13:
		script = set_s_s()
	elif n == 14:
		script = set_s_b()
	elif n == 15:
		script = set_s_c()
	elif n == 16:
		script = set_b_s()
	elif n == 17:
		script = set_c_s()
	elif n == 18:
		script = set_c_a()
	elif n == 19:
		script = set_c_s_a_s()
	elif n == 20:
		script = set_a_is_ib()
	return script
	
	
func set_b() -> SESActionEvent:
	"""
	script + behavior
	"""
	var script = SESScript.new()

	script.enqueue(BehaviorTimer.new(2))

	return script
	
	
func set_b_b() -> SESActionEvent:
	"""
	script + behavior + behavior
	"""
	var script = SESScript.new()

	script.enqueue(BehaviorTimer.new(1))
	script.enqueue(BehaviorTimer.new(1))

	return script


func set_b_c() -> SESActionEvent:
	"""
	script + behavior + command
	"""
	var script = SESScript.new()

	script.enqueue(BehaviorTimer.new(2))
	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))

	return script


func set_b_b_c() -> SESActionEvent:
	"""
	script + behavior + behavior + command
	"""
	var script = SESScript.new()

	script.enqueue(BehaviorTimer.new(1))
	script.enqueue(BehaviorTimer.new(1))
	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))

	return script


func set_b_b_c_b() -> SESActionEvent:
	"""
	script + behavior + behavior + command + behavior
	"""
	var script = SESScript.new()

	script.enqueue(BehaviorTimer.new(1))
	script.enqueue(BehaviorTimer.new(1))
	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))
	script.enqueue(BehaviorTimer.new(1))

	return script


func set_b_c_c() -> SESActionEvent:
	"""
	script + behavior + command + command
	"""
	var script = SESScript.new()

	script.enqueue(BehaviorTimer.new(1))
	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))
	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["zdun"]))

	return script


func set_c() -> SESActionEvent:
	"""
	script + command
	"""
	var script = SESScript.new()

	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))

	return script


func set_c_c() -> SESActionEvent:
	"""
	script + command + command
	"""
	var script = SESScript.new()

	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))
	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["zdun"]))

	return script


func set_c_b() -> SESActionEvent:
	"""
	script + command + behavior
	"""
	var script = SESScript.new()

	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))
	script.enqueue(BehaviorTimer.new(2))

	return script


func set_c_c_b() -> SESActionEvent:
	"""
	script + command + command + behavior
	"""
	var script = SESScript.new()

	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))
	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["zdun"]))
	script.enqueue(BehaviorTimer.new(2))

	return script


func set_c_c_b_c() -> SESActionEvent:
	"""
	script + command + command + behavior + command
	"""
	var script = SESScript.new()

	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))
	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["zdun"]))
	script.enqueue(BehaviorTimer.new(1))
	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["kraczewice"]))

	return script


func set_c_b_b() -> SESActionEvent:
	"""
	script + command + behavior + behavior
	"""
	var script = SESScript.new()

	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))
	script.enqueue(BehaviorTimer.new(1))
	script.enqueue(BehaviorTimer.new(1))

	return script


func set_s() -> SESActionEvent:
	"""
	script + script
	"""
	var script = SESScript.new()

	var script_internal = SESScript.new()
	script_internal.enqueue(BehaviorTimer.new(1))
	script_internal.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))
	
	script.enqueue(script_internal)
	
	return script


func set_s_s() -> SESActionEvent:
	"""
	script + script + script
	"""
	var script = SESScript.new()

	var script_internal = SESScript.new()
	script_internal.enqueue(BehaviorTimer.new(1))
	script_internal.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))
	
	var script_internal2 = SESScript.new()
	script_internal2.enqueue(BehaviorTimer.new(1))
	script_internal2.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["zdun"]))
	
	script.enqueue(script_internal)
	script.enqueue(script_internal2)
	
	return script


func set_s_b() -> SESActionEvent:
	"""
	script + script + behavior
	"""
	var script = SESScript.new()

	var script_internal = SESScript.new()
	script_internal.enqueue(BehaviorTimer.new(1))
	script_internal.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))
	script.enqueue(script_internal)
	
	script.enqueue(BehaviorTimer.new(1))
	
	return script


func set_s_c() -> SESActionEvent:
	"""
	script + script + command
	"""
	var script = SESScript.new()

	var script_internal = SESScript.new()
	script_internal.enqueue(BehaviorTimer.new(1))
	script_internal.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))
	script.enqueue(script_internal)
	
	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["zdun"]))
	
	return script


func set_b_s() -> SESActionEvent:
	
	"""
	script + behavior + script
	"""
	var script = SESScript.new()

	script.enqueue(BehaviorTimer.new(1))

	var script_internal = SESScript.new()
	script_internal.enqueue(BehaviorTimer.new(1))
	script_internal.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))
	script.enqueue(script_internal)
	
	return script
	
	
func set_c_s() -> SESActionEvent:
	"""
	script + command + script
	"""
	var script = SESScript.new()

	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))

	var script_internal = SESScript.new()
	script_internal.enqueue(BehaviorTimer.new(1))
	script_internal.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["zdun"]))
	script.enqueue(script_internal)
	
	return script
	
	
func set_c_a() -> SESActionEvent:
	"""
	script + command + action
	"""
	var script = SESScript.new()

	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["to ja marek"]))

	var action_list_internal = SESActionList.new()
	action_list_internal.enqueue(BehaviorTimer.new(1), true)
	action_list_internal.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["zdun"]), false)
	action_list_internal.enqueue(BehaviorTimer.new(1), true)
	script.enqueue(action_list_internal)
	
	return script


func set_c_s_a_s() -> SESActionEvent:
	"""
	script + command + script + action + script
	"""
	var script = SESScript.new()

	script.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["pierwszy post event"]))

	var script_internal = SESScript.new()
	script_internal.enqueue(BehaviorTimer.new(1))
	script_internal.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["pierwszy skrypt"]))
	script.enqueue(script_internal)

	var action_list_internal = SESActionList.new()
	action_list_internal.enqueue(BehaviorTimer.new(1), true)
	action_list_internal.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["lista akcji"]), false)
	action_list_internal.enqueue(BehaviorTimer.new(1), true)
	script.enqueue(action_list_internal)
	
	var script_internal2 = SESScript.new()
	script_internal2.enqueue(BehaviorTimer.new(1))
	script_internal2.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["drugi skrypt"]))
	script.enqueue(script_internal2)
	
	return script


func set_a_is_ib() -> SESActionEvent:
	"""
	script + action + inside script
	"""
	var script = SESScript.new()

	var action_list_internal = SESActionList.new()
	
	var script_internal = SESScript.new()
	script_internal.enqueue(BehaviorTimer.new(1))
	script_internal.enqueue(CommandPostEvent.new(parent, "_on_post_event", ["pierwszy skrypt"]))
	action_list_internal.enqueue(script_internal, true)
	
	action_list_internal.enqueue(BehaviorTimer.new(1), false)
	
	script.enqueue(action_list_internal)
	
	return script
