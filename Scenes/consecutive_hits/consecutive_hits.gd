extends Control

@onready var hits_label: Label = $MarginContainer/VBoxContainer/HitsLabel
@onready var multiplier_label: Label = $MarginContainer/VBoxContainer/MultiplierLabel
@onready var combo_multiplier_label: Label = $MarginContainer/VBoxContainer/ComboMultiplierLabel

func _process(delta: float) -> void:
	refresh_hits_label()
	refresh_multiplier_label()
	refresh_combo_multiplier_label()
	
func refresh_hits_label() -> void:
	hits_label.text = "Consecutive Hits: %s" % ScoreManager.consecutive_hits
	
func refresh_multiplier_label() -> void:
	multiplier_label.text = "Multiplier: %sx" % ScoreManager.score_multiplier
	
func refresh_combo_multiplier_label() -> void:
	combo_multiplier_label.text = "Combo Multiplier: %sx" % ScoreManager.combo_multiplier
