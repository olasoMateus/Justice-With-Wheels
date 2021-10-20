extends Label


func _process(_delta):
	text = String(Global.ArmasAmmo[0])
	if text == "0":
		visible_characters = 0
	else:
		visible_characters = -1

