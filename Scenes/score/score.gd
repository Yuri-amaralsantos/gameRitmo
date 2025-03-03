extends Control

@onready var label: Label = $MarginContainer/Label

func _process(delta: float) -> void:
    label.text = "Score: %s" % ScoreManager.current_score
