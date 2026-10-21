extends Area2D
class_name Cookie

@export var stats : Stats

var spawn_manager : SpawnManager
var SPEED : float

signal cracked(score : int)

func _ready() -> void:
	SPEED = stats.speed
	spawn_manager = get_tree().get_first_node_in_group("SpawnManager")

var move_velocity : Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
	position.y += SPEED * delta
	pass

func _physics_process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:

	if body is Cracker:
		queue_free()
		body.queue_free()
		cracked.emit(1)
	
	pass
