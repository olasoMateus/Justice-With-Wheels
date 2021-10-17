extends Node

var overclock = preload("res://Scenes/Player_Bullet_2_down.tscn")
signal node_instance(node, pos)

func _ready():
	if Global.World != null:
		connect("node_instance", Global.World, "node_instance")

func _process(delta):
	pass
	
func _on_Hitbox_area_entered(area):
	if area.is_in_group("Player"):
		Global.ReloadTime -= 0.10
