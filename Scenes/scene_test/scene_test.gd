extends Node2D

const NOTE_1: PackedScene = preload("res://Scenes/note/note_1.tscn")
const NOTE_2: PackedScene = preload("res://Scenes/note/note_2.tscn")
const NOTE_3: PackedScene = preload("res://Scenes/note/note_3.tscn")
const NOTE_4: PackedScene = preload("res://Scenes/note/note_4.tscn")
@onready var notes = [NOTE_1, NOTE_2, NOTE_3, NOTE_4]

const INTERNOTE_1 = preload("res://Scenes/internote/internote_1.tscn")
const INTERNOTE_2 = preload("res://Scenes/internote/internote_2.tscn")
const INTERNOTE_3 = preload("res://Scenes/internote/internote_3.tscn")
const INTERNOTE_4 = preload("res://Scenes/internote/internote_4.tscn")
@onready var internotes = [INTERNOTE_1, INTERNOTE_2, INTERNOTE_3, INTERNOTE_4]


@onready var internote_container: Node2D = $InternoteContainer
@onready var note_container: Node2D = $NoteContainer
@onready var marker_note_area: Marker2D = $MarkerNoteArea
@onready var timer_note: Timer = $TimerNote


func _ready() -> void:
	instantiate_new_note(notes.pick_random())
	GameManager.reset_note_and_internote_quantity()

func _process(delta: float) -> void:
	pass

func instantiate_new_note(note: PackedScene) -> void:
	var new_note = note.instantiate()
	new_note.position = marker_note_area.position
	note_container.add_child(new_note)

func _on_timer_note_timeout() -> void:
	print(timer_note.wait_time)
	if GameManager.note_quantity < GameManager.note_quantity_limit:
		instantiate_new_note(notes.pick_random())
		GameManager.add_note_quantity()
		if GameManager.note_quantity == GameManager.note_quantity_limit - 2:
			timer_note.wait_time = 0.75
	elif GameManager.note_quantity >= GameManager.note_quantity_limit and GameManager.internote_quantity < GameManager.internote_quantity_limit:
		instantiate_new_note(internotes.pick_random())
		GameManager.add_internote_quantity()
	elif GameManager.internote_quantity == GameManager.internote_quantity_limit:
		instantiate_new_note(notes.pick_random())
		timer_note.wait_time = 1.5
		GameManager.reset_note_and_internote_quantity()
		
