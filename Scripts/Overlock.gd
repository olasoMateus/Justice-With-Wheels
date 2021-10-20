extends Sprite

# precisa do sprite pra dar load certo

signal pegou_overclock()

func _ready():
	if Global.World != null and Global.Player != null:
		connect("pegou_overclock", Global.Player, "pegou_overclock")

func _process(delta):
	global_position.x -= Global.WorldSpeed/2 * delta
	
	if global_position.x < -20:
		queue_free()

# quando o player bater nessa parada tem que reduzir o reload time (deixar a arma mais rápida)
# e deixar o jogador mais rápido também, ai lanćar um counter pro buff acabar, mas não tô ligado 
# como criar um timer
func _on_Hitbox_area_entered(area):
	if area.is_in_group("Player"):
		emit_signal("pegou_overclock")
		queue_free()
		
	
