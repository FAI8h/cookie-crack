extends Control
class_name UI

var score_label : Label

func _on_setting_pressed() -> void:
	EventBus.setting.emit()
