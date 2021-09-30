extends CollisionShape2D

var speed = 100

func _process(delta):
	global_position.x += speed * delta
