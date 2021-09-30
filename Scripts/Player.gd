extends KinematicBody2D

signal create_bullet(bullet, pos)
signal create_bullet_2(bullet_mid, bullet_down, bullet_up, pos)
signal creat_bullet_3(bullet_1, bullet_2, pos)

var bullet = preload("res://Scenes/Player_Bullet.tscn")
var bullet_mid = preload("res://Scenes/Player_Bullet_2_mid.tscn")
var bullet_up = preload("res://Scenes/Player_Bullet_2_up.tscn")
var bullet_down = preload("res://Scenes/Player_Bullet_2_down.tscn")
var bullet_y = preload("res://Scenes/Player_Bullet_3.tscn")
export (int) var speed = 200
var velocity = Vector2()
var arma_atual = 0 # variavel para controlar arma equipada

func get_input():
	velocity = Vector2()

	# movimenta o personagem, podendo ter entradas simultaneas pra
	# movimentação diagonal
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	velocity = velocity.normalized() * speed

	# troca para a arma anterior
	if Input.is_action_just_pressed("Trocar_armaEsq"):
		match arma_atual:
			0: arma_atual = 2
			_: arma_atual -= 1

	# troca para a arma seguinte
	if Input.is_action_just_pressed("Trocar_armaDir"):
		match arma_atual:
			2: arma_atual = 0
			_: arma_atual += 1

	# atira o projétil da arma atual
	if Input.is_action_just_pressed("Atirar"):
		match arma_atual:
			0: emit_signal("create_bullet", bullet, global_position)
			1: emit_signal("create_bullet_2", bullet_mid, bullet_down,
				bullet_up, global_position)
			2: emit_signal("creat_bullet_3", bullet_y, bullet_y,
				global_position)

func _process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
