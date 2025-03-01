extends Node2D

@export var speed: float = 200.0  # Speed of falling letters
var inside_hit_zone = false  # Tracks if the letter is inside the hit zone
var letter_text = ""  # Stores the letter's text
var hit_callback = null  # Reference to score function
var miss_callback = null  # Reference to score function

func _ready():
    letter_text = $Label.text.to_upper()  # Store the letter text as uppercase

func _process(delta):
    position.y += speed * delta  # Move downwards
    if position.y > get_viewport_rect().size.y:
        if miss_callback.is_valid():  # Check if the function is valid before calling
            miss_callback.call()
        queue_free()  # Remove when out of screen


    
func _input(event):
    if event is InputEventKey and event.pressed and inside_hit_zone:
        var pressed_key = OS.get_keycode_string(event.keycode).to_upper()
        if pressed_key == letter_text:
            print("Letter", letter_text, "was hit correctly!")
            if hit_callback.is_valid():  # Check if function is valid before calling
                hit_callback.call()
            queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
     if area.is_in_group("hit_zone"):
        inside_hit_zone = true 


func _on_area_2d_area_exited(area: Area2D) -> void:
    if area.is_in_group("hit_zone"):
        inside_hit_zone = false  # Mark that it's outside the hit zone
