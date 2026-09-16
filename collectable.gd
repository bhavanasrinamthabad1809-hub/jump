extends Area2D

@onready var gamemanager = %gamemanager
@onready var collect_sound = $"../collectsound"
func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is CharacterBody2D:
		collect_sound.play()
		gamemanager.add_points()
		queue_free()
