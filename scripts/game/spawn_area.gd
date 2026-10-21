extends Area2D
class_name SpawnArea

@export var arena_container : Node
@export var cracker_scene : PackedScene

func _ready() -> void:
	# print("cracker scene loaded : ",cracker_scene)
	pass

func spawn(unit) -> void:
	arena_container.add_child(unit)


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	# print(event)
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			var cracker := cracker_scene.instantiate()
			_set_position(event.position, cracker)
			spawn(cracker)


func _set_position(mouse_pos : Vector2, unit) -> void:
	var rect : ColorRect = $ColorRect

	unit.global_position.x = rect.global_position.x + rect.size.x / 2.0
	unit.global_position.y = mouse_pos.y


func _on_area_entered(area: Area2D) -> void:
	if area is Cookie:
		get_tree().quit()
