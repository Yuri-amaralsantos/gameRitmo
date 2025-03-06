extends Area2D


@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("KeyNote"):
		GameManager.reset_combo_percentage()
		audio_stream_player_2d.play()
		area.queue_free()
		SignalManager.on_note_incorrect.emit()
		ScoreManager.reset_consecutive_hits()
		
