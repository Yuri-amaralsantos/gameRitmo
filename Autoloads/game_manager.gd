extends Node

enum COMBO_PERCENTAGE_INCREASE {LATE = 5, SOON = 10, PERFECT = 20}
enum SPEED_NOTES_PERCENTAGE_INCREASE {LATE = 10, SOON = 15, PERFECT = 25}

var note_speed: float = 200.0
var note_speed_default: float = 200.0
var note_speed_multiplier: float = 1

var faseUnlocked = 2
var faseAtual = 1

var combo_percentage: int = 0
var combo_cooldown_max_value: int = 100
var increase_combo_percentage_holder: int = 0

var combo_is_possible: bool = true
var combo_activated: bool = false

var speed_notes_percentage: int = 0
var speed_notes_cooldown_max_value: int = 100
var increase_speed_notes_percentage_holder: int = 0



func reset_combo_percentage() -> void:
	combo_percentage = 0

func increase_combo_percentage() -> void:
	combo_percentage += increase_combo_percentage_holder

func reset_speed_notes_percentage() -> void:
	speed_notes_percentage = 0

func increase_speed_notes_percentage() -> void:
	speed_notes_percentage += increase_speed_notes_percentage_holder
