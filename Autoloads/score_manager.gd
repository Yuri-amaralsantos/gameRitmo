extends Node

enum NOTE_SCORE {SOON = 2, PERFECT = 5, LATE = 1}

var current_score: int = 0
var score_holder: int = 0

func add_score() -> void:
	current_score += score_holder
	
