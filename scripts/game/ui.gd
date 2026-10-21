extends Control
class_name UI

var score_label : Label

@export var pause_menu : Control

func _ready() -> void:
	score_label = $Score

func chnage_score(score : int) -> void:
	score_label.update_score(score)


func _on_setting_pressed() -> void:
	pause_menu.visible = true
	get_tree().paused = true
	pass
