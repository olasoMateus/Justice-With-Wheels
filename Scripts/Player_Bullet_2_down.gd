extends Sprite

var speed = 100

func _process(delta):
	global_position.x += speed * delta
	global_position.y -= speed * delta