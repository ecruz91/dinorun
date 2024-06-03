extends Node2D

@export var mob_scene: PackedScene

var screen_size : Vector2i
var PlayerInitialPosition


func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Player.position
	GHUD.start_game_btn.connect(new_game)

func new_game():
	print('el jeshua')
	$Player.position = PlayerInitialPosition
	$Floor.position.x = 0
	$MOBTimer.start()

func game_over():
	GHUD.update_highscore()

func _process(delta):
	$Floor.position.x = $Player.position.x - 150


func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	mob.position.x = $Player.position.x + 1500
	mob.position.y = 640
	add_child(mob)
	mob.hit.connect(game_over)
	$MOBTimer.wait_time = 1 #randf() * (3 - 0.5) + 0.5


