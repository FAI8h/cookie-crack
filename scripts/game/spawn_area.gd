extends Area2D
class_name SpawnArea

@export var arena_container : Node
@export var cracker_scene : PackedScene

@onready var timer : Timer = $Timer
@export var interval : float = 0.2

var can_spawn : bool = true

@onready var layer = 1
var is_god_mode : bool = false

func _ready() -> void:
	timer.wait_time = interval
	timer.autostart = false
	timer.timeout.connect(_on_timer_timeout)

	EventBus.god_mode.connect(toggle_god_mode)
	pass

func spawn(unit) -> void:
	arena_container.add_child(unit)
	timer.start()
	can_spawn = false


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	# print(event)
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if not can_spawn:
				return
			var cracker := cracker_scene.instantiate()
			_set_position(event.position, cracker)
			spawn(cracker)


func _set_position(mouse_pos : Vector2, unit) -> void:
	var rect : ColorRect = $ColorRect

	unit.global_position.x = rect.global_position.x + rect.size.x / 2.0
	unit.global_position.y = mouse_pos.y


func _on_area_entered(area: Area2D) -> void:
	if area is Cookie:
		EventBus.died.emit()

func _on_timer_timeout () -> void:
	can_spawn = true;


func _check_spawn_position() -> void:
	pass

func toggle_god_mode() -> void:
	god_mode()

func god_mode() -> void:
	if not is_god_mode :
		is_god_mode = true
		collision_mask = 2
	else:
		is_god_mode = false
		collision_mask = 1

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("God Mode"):
		god_mode()
			
