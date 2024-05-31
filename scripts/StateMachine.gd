extends Node

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 2

var properties = {
	gravity: gravity
}

var states: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in self.get_children():
		states[child.name] = child


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
