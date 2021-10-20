extends Node

var World = null
var Player = null
var ControladorSom = null
var WorldLimits = Vector2(160, 60)
var WorldSpeed = 25
var Pontos = 0
var ArmasDisponiveis = [true, false, false]
var ArmasAmmo = [0, 0]
var Arma_atual = 0
var OverclockNumber = 0


func TocarSom(sound):
	if ControladorSom != null:
		if ControladorSom.has_node(sound):
			ControladorSom.get_node(sound).play()
