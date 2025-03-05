extends Node

enum NOTE_SCORE {SOON = 200, PERFECT = 400, LATE = 200, COMBO = 1600}

var current_score: int = 0
var score_holder: int = 0

func add_score() -> void:
	current_score += score_holder
	
func add_combo_points() -> void:
	current_score += NOTE_SCORE.COMBO
	
