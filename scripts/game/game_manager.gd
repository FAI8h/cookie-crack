extends Node

var score : int = 0
var fired : bool = false

@onready var resume_timer : Timer = $"../../Timers/ResumeTimer"

func _ready() -> void:
	resume_timer.wait_time = 3.0
	resume_timer.autostart = false
	resume_timer.timeout.connect(_on_resume_timer_timeout)
	EventBus.start_resume.connect(start_resume_timer)
	EventBus.cracked.connect(_save_score)
	EventBus.died.connect(get_score)

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
