extends Node2D

func _ready():
	Global.World = self
	
func _exit_tree():
	Global.World = null

func _on_Player_create_bullet(bullet, pos):
	var Player_Bullet_instance = bullet.instance()
	add_child(Player_Bullet_instance)
	Player_Bullet_instance.global_position.x = pos.x + 5
	Player_Bullet_instance.global_position.y = pos.y + 2.5

func _on_Player_create_bullet_2(bullet_mid, bullet_down, bullet_up, pos):
	var bullet_mid_instance = bullet_mid.instance()
	var bullet_down_instance = bullet_down.instance()
	var bullet_up_instance = bullet_up.instance()

	add_child(bullet_down_instance)
	add_child(bullet_mid_instance)
	add_child(bullet_up_instance)

	bullet_up_instance.global_position.x = pos.x + 5
	bullet_up_instance.global_position.y = pos.y + 2

	bullet_mid_instance.global_position.x = pos.x + 5
	bullet_mid_instance.global_position.y = pos.y + 2.5

	bullet_down_instance.global_position.x = pos.x + 5
	bullet_down_instance.global_position.y = pos.y + 3

func _on_Player_creat_bullet_3(bullet_1, bullet_2, pos):
	var bullet_1_instance = bullet_1.instance()
	var bullet_2_instance = bullet_2.instance()

	add_child(bullet_1_instance)
	add_child(bullet_2_instance)

	bullet_1_instance.global_position.x = pos.x + 5
	bullet_1_instance.global_position.y = pos.y + 2

	bullet_2_instance.global_position.x = pos.x + 5
	bullet_2_instance.global_position.y = pos.y + 3



func _on_Malware_Generator_Malware_Gerado(malware, location):
	var malware_instance = malware.instance()
	
	add_child(malware_instance)
	
	malware_instance.global_position = location


func _on_Malware_Criar_Particulas_Malware_Destruido(particulas, location):
	var particulas_instance = particulas.instance()
	
	add_child(particulas_instance)
	
	particulas_instance.global_position = location
