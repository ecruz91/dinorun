extends Node2D

@export var mob_scene: PackedScene

var screen_size : Vector2i
var PlayerInitialPosition


func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Player.position

func new_game():
	$Player.position = PlayerInitialPosition
	$Floor.position.x = 0
	$MOBTimer.start()

func game_over():
	GHUD.update_highscore()

func _process(delta):
	$Floor.position.x = $Player.position.x - 150


func _on_mob_timer_timeout():
	print('creando mob...')
