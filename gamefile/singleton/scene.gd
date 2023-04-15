extends Node


var current_scene = null


func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)


func goto_scene(name):
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# So we have to give it some time.
	call_deferred("__deferred_goto_scene", name)


func __deferred_goto_scene(name):
	current_scene.free()

	var path = 'res://root_scenes/%s.tscn' % name
	var new_scene = ResourceLoader.load(path)
	current_scene = new_scene.instance()

	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)

	print('[SceneManager] switched to ' + name)
