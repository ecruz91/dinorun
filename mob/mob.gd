extends Area2D


func _ready():
	var collisions = [
		$BlueC,
		$RedC
	]
	var random_int = randi() % collisions.size()
	var selected_collision = collisions[random_int]
	selected_collision.visible = true
	selected_collision.disabled = false


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
