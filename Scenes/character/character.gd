extends Node2D


const GOTH_IDLE = preload("res://Assets/note_container/goth_idle.png")
const GOTH_POSE_1 = preload("res://Assets/note_container/goth_pose_1.png")
const GOTH_POSE_2 = preload("res://Assets/note_container/goth_pose_2.png")
const GOTH_POSE_3 = preload("res://Assets/note_container/goth_pose_3.png")
const GOTH_POSE_4 = preload("res://Assets/note_container/goth_pose_4.png")
## gotica wrong
## gotica off-screen

const GOTICA_COMBO_1 = preload("res://Assets/note_container/gotica_combo_1.png")
## combo failed wrong


@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	sprite_2d.texture = GOTH_IDLE
	SignalManager.on_note_correct.connect(on_note_correct)
	SignalManager.on_note_incorrect.connect(on_note_incorrect)
	SignalManager.on_combo_cleared.connect(on_combo_cleared)

func on_note_correct(keynote: String) -> void:
	match keynote:
		"KeyNote1":
			change_pose(GOTH_POSE_1)
		"KeyNote2":
			change_pose(GOTH_POSE_2)
		"KeyNote3":
			change_pose(GOTH_POSE_3)
		"KeyNote4":
			change_pose(GOTH_POSE_4)

			
func on_combo_cleared() -> void:
	change_pose(GOTICA_COMBO_1)

func on_note_incorrect() -> void:
	change_pose(GOTH_IDLE) # mudar depois

func change_pose(pose) -> void:
	animation_player.play("change_pose")
	sprite_2d.texture = pose
