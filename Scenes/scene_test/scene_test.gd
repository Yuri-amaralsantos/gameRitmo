extends Node2D

const NOTE_1: PackedScene = preload("res://Scenes/note/note_1.tscn")
const NOTE_2: PackedScene = preload("res://Scenes/note/note_2.tscn")
const NOTE_3: PackedScene = preload("res://Scenes/note/note_3.tscn")
const NOTE_4: PackedScene = preload("res://Scenes/note/note_4.tscn")
@onready var notes = [NOTE_1, NOTE_2, NOTE_3, NOTE_4]

@onready var note_container: Node2D = $NoteContainer
@onready var marker_note_area: Marker2D = $MarkerNoteArea
@onready var timer_note: Timer = $TimerNote
@onready var faseAnim = $AnimationPlayer

var timer_note_default: float = 2.5
var timer_note_faster: float = 1.0

func _ready() -> void:
	SignalManager.on_speed_changed.connect(on_speed_changed)
	SignalManager.on_speed_default.connect(on_speed_default)
	timer_note.wait_time = timer_note_default
	
	faseAnim.play("phase")
	instantiate_new_note(notes.pick_random())

func _process(delta: float) -> void:
	check_if_combo_is_possible()

func check_if_combo_is_possible() -> void:
	if timer_note.time_left > 0:
		SignalManager.on_combo_possible.emit()
	else:
		SignalManager.on_combo_not_possible.emit()

func instantiate_new_note(note: PackedScene) -> void:
	var new_note = note.instantiate()
	new_note.position = marker_note_area.position
	note_container.add_child(new_note)

func _on_timer_note_timeout() -> void:
	instantiate_new_note(notes.pick_random())
	
func on_speed_changed() -> void:
	timer_note.wait_time = timer_note_faster
	
func on_speed_default() -> void:
	timer_note.wait_time = timer_note_default
		
func end_phase():
	print("Phase ended")
	print(GameManager.faseAtual == GameManager.faseUnlocked)
	if GameManager.faseAtual == GameManager.faseUnlocked and ScoreManager.current_score > 5:
		GameManager.faseUnlocked+=1
	print(GameManager.faseUnlocked)
	get_tree().change_scene_to_file("res://Scenes/mainMenu/mainMenu.tscn")
	
