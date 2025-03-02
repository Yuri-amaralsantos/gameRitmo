extends Node2D

const NOTE_1: PackedScene = preload("res://Scenes/note/note_1.tscn")
const NOTE_2: PackedScene = preload("res://Scenes/note/note_2.tscn")
const NOTE_3: PackedScene = preload("res://Scenes/note/note_3.tscn")
const NOTE_4: PackedScene = preload("res://Scenes/note/note_4.tscn")
@onready var notes = [NOTE_1, NOTE_2, NOTE_3, NOTE_4]

@onready var note_container: Node2D = $NoteContainer
@onready var marker_note_area: Marker2D = $MarkerNoteArea
@onready var timer_note: Timer = $TimerNote


func _ready() -> void:
	instantiate_new_note(notes.pick_random())

func _process(delta: float) -> void:
	pass
	

func instantiate_new_note(note: PackedScene) -> void:
	var new_note: Note = note.instantiate()
	new_note.position = marker_note_area.position
	note_container.add_child(new_note)

func _on_timer_note_timeout() -> void:
	instantiate_new_note(notes.pick_random())
