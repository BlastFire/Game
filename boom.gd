extends AnimatedSprite


# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Boom_animation_finished():
	stop()
