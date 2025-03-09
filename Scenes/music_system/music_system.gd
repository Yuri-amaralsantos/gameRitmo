extends Node2D

@export var phase: String
@onready var phase_anim: AnimationPlayer = $PhaseAnim
@onready var rank: Control = $CanvasLayer/Rank

func _ready() -> void:
	phase_anim.play(phase)
	

func _process(delta: float) -> void:
	pass
		
	
func music_ended() -> void:
	SignalManager.on_music_ended.emit()
	rank.visible = true
