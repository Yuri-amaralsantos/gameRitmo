extends Area2D

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("KeyNote"):
		GameManager.reset_combo_percentage()
		SignalManager.on_audio_play.emit("wrong_note")
		area.queue_free()
		SignalManager.on_note_incorrect.emit()
		ScoreManager.reset_consecutive_hits()
		
