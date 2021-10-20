extends Sprite



func _process(delta):
	global_position.x -= Global.WorldSpeed/2 * delta
	
	if global_position.x < -20:
		queue_free()

func _on_Hitbox_area_entered(area):
	if area.is_in_group("Player"):
		Global.ArmasDisponiveis[1] = true
		Global.ArmasAmmo[0] = 30
		queue_free()
