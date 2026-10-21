extends Label

func _ready() -> void:
	visible = false
	EventBus.time_left.connect(_update_label)
	EventBus.start_resume.connect(_show_timer_label)
	EventBus.resume.connect(_hide_timer_label)

func _show_timer_label()-> void:
	visible = true

func _update_label(sec : float) -> void:
	text = str(int(ceil(sec)))

func _hide_timer_label() -> void:
	visible = false
