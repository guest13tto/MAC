extends Node3D

@onready var label = $"touch"



func _on_area_3d_area_entered(area: Area3D):
	label.text = "Touch: true"
	print("Touch: true")
