extends Node

var note_quantity: int = 0
var note_quantity_limit: int = 5

var internote_quantity: int = 0
var internote_quantity_limit: int = 3

var note_speed: float = 200.0


func add_note_quantity() -> void:
	note_quantity += 1
	
func add_internote_quantity() -> void:
	internote_quantity += 1

func reset_note_quantity() -> void:
	note_quantity = 0
	
func reset_internote_quantity() -> void:
	internote_quantity = 0
	
func reset_note_and_internote_quantity() -> void:
	reset_note_quantity()
	reset_internote_quantity()
