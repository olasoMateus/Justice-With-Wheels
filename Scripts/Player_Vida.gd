extends Sprite

func _process(_delta):
	if Global.Player != null:
		frame = Global.Player.vida
