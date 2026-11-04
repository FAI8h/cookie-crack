extends Control

@export var combo_labels: Array[Label]
var theme_epic : Theme = preload("uid://7hpaio81mote")
var theme_mid : Theme = preload("uid://c4k7mbxurm1bk")
var next_label := 0
var combo : int

func _ready() -> void:
	_clear_all_child_text()
	EventBus.combo.connect(show_combo)

func _change_combo_theme() -> void:
	
	pass
func show_combo() -> void:
	combo += 1
	if combo >= 50 and combo <= 100:
		theme = theme_epic
	elif combo > 100:		
		theme = theme_mid
	# print("curr theme : ", )
	var label := combo_labels[next_label]
	next_label = (next_label + 1) % combo_labels.size()

	label.text = "COMBO x%d" % combo
	label.scale = Vector2.ONE
	label.position.y = 609.5
	label.modulate.a = 1.0
	label.visible = true
	label.pivot_offset = label.size / 2.0
	label.set_anchors_preset(label.LayoutPreset.PRESET_CENTER)

	var tween := create_tween()
	tween.tween_property(label, "scale", Vector2(1.3, 1.3), 0.12)
	tween.tween_property(label, "position:y", 500.0, 0.4).set_ease(tween.EASE_IN)
	tween.tween_property(label, "scale", Vector2.ONE, 0.12)
	tween.tween_interval(0.3)
	tween.tween_property(label, "modulate:a", 0.0, 0.3)
	tween.tween_callback(func(): label.visible = false)


func _clear_all_child_text() -> void:
	var children : Array[Node] = get_children()

	for child : Label in children:
		child.text = ""
	
