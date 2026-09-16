extends Area2D

@onready var gamemanager = %gamemanager
@onready var end_screen = $"../endscreen"
@onready var end_message = $"../endscreen/endmessage"
@onready var win_sound = $"../winsound"

const TOTAL_STRAWBERRIES = 15

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		win_sound.play()
		if gamemanager.points >= TOTAL_STRAWBERRIES:
			end_message.text = "🏆 FARM COMPLETE! 🏆\n\nPinkman collected all your\nstrawberries from the farm!\n\n🍓 AMAZING JOB! 🍓"
			end_screen.visible = true
			get_tree().paused = true
		else:
			end_message.text = "🍓 Collect all the strawberries! 🍓"
			end_screen.visible = true
