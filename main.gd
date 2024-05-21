extends Node2D

var screen_size : Vector2i
var PlayerInitialPosition


func _ready():
	screen_size = get_window().size
	PlayerInitialPosition = $Player.position

func new_game():
	$Player.position = PlayerInitialPosition
	$Floor.position.x = 0

func game_over():
	GHUD.update_highscore()

func _process(delta):
	if ($Player.position.x - $Floor.position.x) > screen_size.x:
		$Floor.position.x += screen_size.x
