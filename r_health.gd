extends Label

var default_text = "Health:"

func _ready() -> void:
	text = default_text+str(Global.Right_health)
