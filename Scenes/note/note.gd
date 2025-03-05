extends Area2D

class_name Note

func _process(delta: float) -> void:
	position.x -= GameManager.note_speed * delta
