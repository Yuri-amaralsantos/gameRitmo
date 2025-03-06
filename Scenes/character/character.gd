extends Node2D

const POSE_1 = preload("res://Assets/note_container/goth_pose_1.png")
const POSE_2 = preload("res://Assets/note_container/goth_pose_2.png")
const POSE_3 = preload("res://Assets/note_container/goth_pose_3.png")
const POSE_4 = preload("res://Assets/note_container/goth_pose_4.png")
const POSE_DEFAULT = preload("res://Assets/note_container/goth_idle.png")
const POSE_WRONG = preload("res://Assets/note_container/goth_pose_1.png")


@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	sprite_2d.texture = POSE_DEFAULT
	SignalManager.on_note_correct.connect(on_note_correct)
	SignalManager.on_note_incorrect.connect(on_note_incorrect)

func on_note_correct(keynote: String) -> void:
	match keynote:
		"KeyNote1":
			change_pose(POSE_1)
		"KeyNote2":
			change_pose(POSE_2)
		"KeyNote3":
			change_pose(POSE_3)
		"KeyNote4":
			change_pose(POSE_4)
			
func on_note_incorrect() -> void:
	change_pose(POSE_WRONG)

func change_pose(pose) -> void:
	animation_player.play("change_pose")
	sprite_2d.texture = pose
