extends Node

# precisa do sprite pra dar load certo
var overclock = preload("res://Scenes/Player_Bullet_2_down.tscn")

signal node_instance(node, pos)

func _ready():
	if Global.World != null:
		connect("node_instance", Global.World, "node_instance")

func _process(delta):
	pass

# quando o player bater nessa parada tem que reduzir o reload time (deixar a arma mais rápida)
# e deixar o jogador mais rápido também, ai lanćar um counter pro buff acabar, mas não tô ligado 
# como criar um timer
func _on_Hitbox_area_entered(area):
	if area.is_in_group("Player"):
		Global.ReloadTime -= 0.10
		Global.Player.speed = 300
		queue_free()
		
	
