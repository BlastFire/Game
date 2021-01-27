extends Node2D

# var players []  = ??? Moje multiplayer da se probva 
var player
var enemies
var score
var limit
var rng
#var font
var life


func _ready():
	limit  = get_viewport_rect().size
	rng = RandomNumberGenerator.new()
	player = get_node("Player")
	enemies = []
	score = get_node("Score")
	life = get_node("Life")


func _process(delta):
	rng.randomize()
	var random = rng.randi_range(-500,50)
	if	random > 0 :
		var enemy = load("res://Enemy.tscn")
		var e = enemy.instance()
		add_child(e)
		enemies.push_front(e)
	
	# Game Over 
	if	life.life == 0 :
		# TODO - :D  Trqqq se implementira prozorcheto za nova igra :D
		get_tree().paused = true


func _getEnemies():
	return enemies
	
func _setScore():
	score._setScore()

func _setLife():
	player._setLife()
	life._setLife(player.life)
	_getLostWindow()

func _resetPlay():
	var p = load("res://Player.tscn")
	player = p.instance()
	add_child(player)
	for e in enemies :
		if	e != null :
			e.queue_free()

func _getLostWindow():
	var popup = WindowDialog.new()
	popup.set_title("You lost a life !!! NOOB")
	popup.popup(Rect2(0, 0, 100, 50))
	popup.set_position(limit/2)
	add_child(popup)
	popup.show()
	yield(get_tree().create_timer(4.0), "timeout")
	_resetPlay()
	popup.hide()
	
