extends Control
class_name UI

func _on_setting_pressed() -> void:
	EventBus.setting.emit()
