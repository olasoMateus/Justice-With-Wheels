extends CanvasLayer


func _process(delta):
	match Global.Arma_atual:
		0:
			$S_icone.modulate = Color(1, 1, 1)
			$D_icone.modulate = Color(0.454902, 0.454902, 0.454902)
			$T_icone.modulate = Color(0.454902, 0.454902, 0.454902)
			
		1:
			$S_icone.modulate = Color(0.454902, 0.454902, 0.454902)
			$D_icone.modulate = Color(0.454902, 0.454902, 0.454902)
			$T_icone.modulate = Color(1, 1, 1)
		2:
			$S_icone.modulate = Color(0.454902, 0.454902, 0.454902)
			$D_icone.modulate = Color(1, 1, 1)
			$T_icone.modulate = Color(0.454902, 0.454902, 0.454902)
			
		_:
			$S_icone.modulate = Color(0.454902, 0.454902, 0.454902)
			$D_icone.modulate = Color(0.454902, 0.454902, 0.454902)
			$T_icone.modulate = Color(0.454902, 0.454902, 0.454902)
