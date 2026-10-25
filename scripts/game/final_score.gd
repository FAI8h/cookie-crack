extends Label

var score : int = 0;

func _ready() -> void:
    EventBus.game_over.connect(_set_final_score)

func _set_final_score(point : int) -> void:
    print("points : ", point)
    score += point;
    text = str(score);

    