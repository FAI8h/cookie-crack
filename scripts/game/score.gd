extends Label

var curr_score : int = 0

func update_score(score: int) -> void:
    curr_score = curr_score + score
    text = str(curr_score)