extends Area2D

@export var area_number: int

var is_on_area: bool = false
var stored_area: Area2D

func _process(delta: float) -> void:
	on_key_pressed()

func on_key_pressed() -> void:
	if is_on_area and Input.is_action_just_pressed("KeyNote%s" % area_number):
		if stored_area != null:
			stored_area.queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("note"):
		is_on_area = true
		stored_area = area

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("note"):
		is_on_area = false
		stored_area = null
		
