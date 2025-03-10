extends Control

@onready var texture_progress_bar: TextureProgressBar = $MarginContainer/TextureProgressBar
@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var speed_note_activated: bool = false

func _ready() -> void:
	texture_progress_bar.max_value = GameManager.speed_notes_cooldown_max_value

func _process(delta: float) -> void:
	activate_speed_notes()
	refresh_speed_notes_cooldown()

func refresh_speed_notes_cooldown() -> void:
	texture_progress_bar.value = GameManager.speed_notes_percentage

func activate_speed_notes() -> void:
	if texture_progress_bar.value >= GameManager.speed_notes_cooldown_max_value and speed_note_activated == false:
		if Input.is_action_just_pressed("SpeedNotes"):
			speed_note_activated = true
			SignalManager.on_speed_changed.emit()
			SignalManager.on_audio_play.emit("activation")
			animation_player.play("ready")
			GameManager.note_speed += GameManager.note_speed * GameManager.note_speed_multiplier
			timer.start()

func _on_timer_timeout() -> void:
	timer.stop()
	GameManager.note_speed = GameManager.note_speed_default
	SignalManager.on_speed_default.emit()
	GameManager.reset_speed_notes_percentage()
	speed_note_activated = false


func _on_texture_progress_bar_value_changed(value: float) -> void:
	if value >= GameManager.speed_notes_cooldown_max_value:
		SignalManager.on_audio_play.emit("ready_to_use")
		animation_player.play("ready")
