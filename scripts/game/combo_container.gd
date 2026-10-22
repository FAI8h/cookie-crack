extends Control

@export var combo_labels: Array[Label]

var next_label := 0
var combo : int

func _ready() -> void:
	EventBus.combo.connect(show_combo)



func show_combo() -> void:
	combo += 1
	var label := combo_labels[next_label]
	next_label = (next_label + 1) % combo_labels.size()

	label.text = "COMBO x%d" % combo
	label.scale = Vector2.ONE
	label.position.y = 74.0
	label.modulate.a = 1.0
	label.visible = true
	label.pivot_offset = label.size / 2.0
	label.set_anchors_preset(label.LayoutPreset.PRESET_CENTER)

	var tween := create_tween()
	tween.tween_property(label, "scale", Vector2(1.3, 1.3), 0.12)
	tween.tween_property(label, "position:y", 54.0, 0.4).set_ease(tween.EASE_IN)
	tween.tween_interval(0.3)
	tween.tween_property(label, "modulate:a", 0.0, 0.3)
	tween.tween_callback(func(): label.visible = false)
