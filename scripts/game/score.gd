extends Label

var curr_score : int = 0

func _ready() -> void:
    curr_score = 0
    EventBus.cracked.connect(update_score)

func update_score(score: int) -> void:
    curr_score = curr_score + score
    text = str(curr_score)