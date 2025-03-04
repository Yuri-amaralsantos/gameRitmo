extends Node

enum COMBO_PERCENTAGE_INCREASE {LATE = 5, SOON = 10, PERFECT = 20}

var note_speed: float = 200.0


var combo_percentage: int = 0
var combo_cooldown_max_value: int = 100
var increase_combo_percentage_holder: int = 0
var combo_is_possible: bool = true
var combo_activated: bool = false

func reset_combo_percentage() -> void:
	combo_percentage = 0

func increase_combo_percentage() -> void:
	combo_percentage += increase_combo_percentage_holder
