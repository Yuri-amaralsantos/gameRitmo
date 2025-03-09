extends Node

enum NOTE_SCORE {SOON = 200, PERFECT = 400, LATE = 200, COMBO = 1600}
enum MULTIPLIER_BARRIER {ONE = 10, TWO = 20, TREE = 30, FOUR = 40, FIVE = 50}
enum MULTIPLIER {ONE = 1, TWO = 2, TREE = 3, FOUR = 4, FIVE = 5}
enum RANK_LETTER {D = 50000, C = 100000, B = 150000, A = 200000, S = 250000}

var current_score: int = 0
var score_holder: int = 0

var consecutive_hits: int = 0
var score_multiplier: int = 1
var combo_multiplier: int = 1

func _ready() -> void:
	SignalManager.on_combo_cleared.connect(on_combo_cleared)

func _process(delta: float) -> void:
	refresh_score_multiplier()

func refresh_score_multiplier() -> void:
	if consecutive_hits < MULTIPLIER_BARRIER.ONE:
		score_multiplier = MULTIPLIER.ONE
	elif consecutive_hits >= MULTIPLIER_BARRIER.ONE and consecutive_hits < MULTIPLIER_BARRIER.TWO:
		score_multiplier = MULTIPLIER.TWO
	elif consecutive_hits >= MULTIPLIER_BARRIER.TWO and consecutive_hits < MULTIPLIER_BARRIER.TREE:
		score_multiplier = MULTIPLIER.TREE
	elif consecutive_hits >= MULTIPLIER_BARRIER.TREE and consecutive_hits < MULTIPLIER_BARRIER.FOUR:
		score_multiplier = MULTIPLIER.FOUR
	elif consecutive_hits >= MULTIPLIER_BARRIER.FOUR:
		score_multiplier = MULTIPLIER.FIVE

func add_score() -> void:
	current_score += (score_holder * score_multiplier) * combo_multiplier
	
func add_combo_points() -> void:
	current_score += (NOTE_SCORE.COMBO * score_multiplier) * combo_multiplier
	
func reset_consecutive_hits() -> void:
	consecutive_hits = 0
	
func add_consecutive_hits() -> void:
	consecutive_hits += 1
	
func on_combo_cleared() -> void:
	combo_multiplier += 1
	
func get_score() -> int:
	return current_score
	
func get_rank() -> String:
	if current_score < RANK_LETTER.D:
		return "D" 
	elif current_score >= RANK_LETTER.C and current_score <= RANK_LETTER.B:
		return "C" 
	elif current_score >= RANK_LETTER.B and current_score <= RANK_LETTER.A:
		return "B" 
	elif current_score >= RANK_LETTER.A and current_score <= RANK_LETTER.S:
		return "A" 
	elif current_score >= RANK_LETTER.S:
		return "S" 
		
	return ""
