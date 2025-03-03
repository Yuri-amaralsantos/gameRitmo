extends Area2D

class_name Internote

func _process(delta: float) -> void:
	position.x -= GameManager.note_speed * delta
