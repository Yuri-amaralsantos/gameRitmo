extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var texture_button: TextureButton = $TextureButton

@export var phase: int
@export var label_text: String = "PHASE {}"
@export var phase_bg: Texture2D = preload("res://Assets/note_container/phase_bg_placeholder.png")

@onready var label: Label = $TextureButton/Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_label()
	change_phase_bg()
	
func change_phase_bg() -> void:
	texture_button.texture_normal = phase_bg
	
func change_label() -> void:
	label.text = label_text

func _on_texture_button_button_down() -> void:
	SignalManager.on_change_to_phase.emit(phase)


func _on_texture_button_mouse_entered() -> void:
	animation_player.play("on_mouse_entered")


func _on_texture_button_mouse_exited() -> void:
	animation_player.play("on_mouse_exited")
