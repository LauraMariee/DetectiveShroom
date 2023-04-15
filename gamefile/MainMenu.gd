extends Node

var current_scene = null

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$StartButton.connect("pressed", self, "_on_StartButton_pressed")


func _on_StartButton_pressed():
	SCENE.goto_scene("main")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
