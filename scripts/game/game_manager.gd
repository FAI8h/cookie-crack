extends Node

var score : int = 0
var fired : bool = false

@onready var resume_timer : Timer = $"../../Timers/ResumeTimer"

@export var arena : Node
@export var god_mode : bool

func _ready() -> void:
	resume_timer.wait_time = 3.0
	resume_timer.autostart = false
	resume_timer.timeout.connect(_on_resume_timer_timeout)
	EventBus.start_resume.connect(start_resume_timer)
	EventBus.cracked.connect(_save_score)
	EventBus.died.connect(get_score)
	EventBus.main_menu.connect(_on_main_menu_pressed)
	EventBus.restart.connect(_on_restart_pressed)
	EventBus.retry.connect(_on_retry_pressed)

	if god_mode:
		call_deferred("_on_god_mode")

func _process(_delta: float) -> void:
	if resume_timer.time_left > 0.0:
		EventBus.time_left.emit(resume_timer.time_left)
	
func start_resume_timer() -> void:
	resume_timer.start()

func _on_resume_timer_timeout() -> void:
	EventBus.resume.emit()

func _save_score(point: int) -> void:
	score += point

func get_score() -> void:
	if not fired:
		EventBus.game_over.emit(score)
		fired = not fired

func _on_main_menu_pressed() -> void:
	if arena.get_child_count() > 0:
		Utilities.clear_all_children(arena)

func _on_restart_pressed() -> void:
	if arena.get_child_count() > 0:
		Utilities.clear_all_children(arena)

func _on_retry_pressed() -> void:
	if arena.get_child_count() > 0:
		Utilities.clear_all_children(arena)

func _on_god_mode() -> void:
	EventBus.god_mode.emit()