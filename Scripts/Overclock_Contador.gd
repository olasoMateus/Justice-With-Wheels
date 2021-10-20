extends Label


func _process(delta):
	match Global.OverclockNumber:
		0:text = ": 0"
		1:text = ": 1"
		2:text = ": 2"
		3:text = ": MAX"
		_:text = "-"
