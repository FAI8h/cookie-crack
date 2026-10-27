extends Node
class_name Utilities

static func clear_all_children(parent : Node) -> void:
	for c in parent.get_children():
		c.queue_free()
	
static func center_control(control_node : Control) -> void:
	control_node.pivot_offset_ratio = Vector2(0.5,0.5)
