extends Control
class_name UI

var score_label : Label

func _ready() -> void:
	score_label = $Score
	EventBus.cracked.connect(chnage_score)

func chnage_score(score : int) -> void:
	score_label.update_score(score)


func _on_setting_pressed() -> void:
	EventBus.setting.emit()
