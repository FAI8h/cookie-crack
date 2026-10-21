extends CharacterBody2D
class_name Cracker

@export var stats : Stats
@export var SPEED : float

func _ready() -> void:
    SPEED = stats.speed

func _process(_delta: float) -> void:
    if Input.is_action_pressed("up"):
        velocity = Vector2.UP * SPEED
    move_and_slide()
