extends Label

var curr_sec : int = 0

func _ready() -> void:
	visible = false
	EventBus.time_left.connect(_update_label)
	EventBus.start_resume.connect(_show_timer_label)
	EventBus.resume.connect(_hide_timer_label)

func _show_timer_label()-> void:
	visible = true

func _set_timer_value() -> void:
	text = str(curr_sec)


func _update_label(sec : float) -> void:
	if int(ceil(sec)) != curr_sec :
		curr_sec = int(ceil(sec))
		_set_timer_value()


	pass

func _hide_timer_label() -> void:
	visible = false
