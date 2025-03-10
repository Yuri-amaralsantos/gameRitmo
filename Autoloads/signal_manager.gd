extends Node

signal on_combo_possible
signal on_combo_not_possible
signal on_combo_failed
signal on_note_correct(note: String)
signal on_note_incorrect
signal on_speed_changed
signal on_speed_default
signal on_combo_cleared
signal on_audio_play(note: String)
signal on_change_to_phase(phase: int)
signal on_music_ended
