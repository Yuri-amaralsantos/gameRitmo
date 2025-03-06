extends Node

@onready var wrong_note: AudioStreamPlayer = $AudioContainer/WrongNote
@onready var right_note: AudioStreamPlayer = $AudioContainer/RightNote
@onready var ready_to_use: AudioStreamPlayer = $AudioContainer/ReadyToUse
@onready var combo_failed: AudioStreamPlayer = $AudioContainer/ComboFailed
@onready var combo_cleared: AudioStreamPlayer = $AudioContainer/ComboCleared
@onready var activation: AudioStreamPlayer = $AudioContainer/Activation


func _ready() -> void:
	SignalManager.on_audio_play.connect(on_audio_play)

func on_audio_play(audio: String) -> void:
	match audio:
		"wrong_note":
			wrong_note.play()
		"right_note":
			right_note.play()
		"ready_to_use":
			ready_to_use.play()
		"combo_failed":
			combo_failed.play()
		"combo_cleared":
			combo_cleared.play()
		"activation":
			activation.play()
		"":
			pass
		"":
			pass
		"":
			pass
		"":
			pass
