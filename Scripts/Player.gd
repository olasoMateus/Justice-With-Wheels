extends KinematicBody2D

signal create_bullet(bullet, pos)
signal create_bullet_2(bullet_mid, bullet_down, bullet_up, pos)
signal creat_bullet_3(bullet_1, bullet_2, pos)
signal node_instance(node, pos)

var bullet = preload("res://Scenes/Player_Bullet.tscn")
var bullet_mid = preload("res://Scenes/Player_Bullet_2_mid.tscn")
var bullet_up = preload("res://Scenes/Player_Bullet_2_up.tscn")
var bullet_down = preload("res://Scenes/Player_Bullet_2_down.tscn")
var bullet_y = preload("res://Scenes/Player_Bullet_3.tscn")
var particulas = preload("res://Scenes/Player_Destruido_particulas.tscn")
export (int) var speed = 200
var velocity = Vector2()
var arma_atual = 0 # variavel para controlar arma equipada
var pode_atirar = true # se pode ou não atirar
var vida = 3
var player_size = 4

func get_input():
	velocity = Vector2()

	# movimenta o personagem, podendo ter entradas simultaneas pra
	# movimentação diagonal
	# ui_right = Seta para direita ou D
	if Input.is_action_pressed("ui_right") && global_position.x < Global.WorldLimits.x - player_size:
		print(global_position.x, Global.WorldLimits.x)
		velocity.x += 1
	# ui_left = Seta para esquerda ou A
	if Input.is_action_pressed("ui_left") && global_position.x >= player_size:
		velocity.x -= 1
	# ui_up = Seta para cima ou W
	if Input.is_action_pressed("ui_up") && global_position.y > player_size:
		velocity.y -= 1
	# ui_down = Seta para baixo ou S
	if Input.is_action_pressed("ui_down") && global_position.y < Global.WorldLimits.y - player_size:
		velocity.y += 1
	velocity = velocity.normalized() * speed

	# troca para a arma anterior
	# Trocar_armaEsq = Q ou U
	if Input.is_action_just_pressed("Trocar_armaEsq"):
		match arma_atual:
			0: arma_atual = 2 if Global.ArmasDisponiveis[2] else 0
			_: arma_atual -= 1 if Global.ArmasDisponiveis[arma_atual - 1] else 0

	# troca para a arma seguinte
	# Trocar_armaDir = E ou O
	if Input.is_action_just_pressed("Trocar_armaDir"):
		match arma_atual:
			2: arma_atual = 0 if Global.ArmasDisponiveis[0] else arma_atual
			_: arma_atual += 1 if Global.ArmasDisponiveis[arma_atual + 1] else 0

	# atira o projétil da arma atual
	# Atirar = Z ou J
	if Input.is_action_pressed("Atirar") && pode_atirar:
		match arma_atual:
			0: emit_signal("create_bullet", bullet, global_position)
			1: emit_signal("create_bullet_2", bullet_mid, bullet_down,
				bullet_up, global_position)
			2: emit_signal("creat_bullet_3", bullet_y, bullet_y,
				global_position)
		$Tempo_Reload.start(Global.ReloadTime)
		pode_atirar = false
		
func _ready():
	Global.Player = self
	

func _process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	Global.Arma_atual = arma_atual
	
	if vida <= 0:
		queue_free()
		emit_signal("node_instance", particulas, global_position)


func _on_Hitbox_area_entered(area):
	if area.is_in_group("Inimigo"):
		area.get_parent().queue_free()
		vida -= 1
			


func _on_Tempo_Reload_timeout():
	pode_atirar = true
	$Tempo_Reload.stop()
	
func _exit_tree():
	Global.Player = null
	Global.Pontos = 0
