extends Label


func _process(delta: float) -> void:
	var default_text = Global.Left_score
	text =  "score:" + str(default_text)
