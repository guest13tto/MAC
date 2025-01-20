extends Control

@export var stream: AudioStream



@onready var volume = $MarginContainer/VBoxContainer/Volume
@onready var csens = $MarginContainer/VBoxContainer/Controller_Sensitivity
@onready var fov = $MarginContainer/VBoxContainer/FOV



func _ready() -> void:
	csens.value = Global.CONTROLLER_SENSITIVITY
	fov.value = Global.BASE_FOV
	
func _on_mouse_sensitivity_value_changed(value: float) -> void:
	Global.CONTROLLER_SENSITIVITY = value


func _on_fov_value_changed(value: float) -> void:
	Global.BASE_FOV = value

func _on_exit_pressed() -> void:
	AudioManager.play_sound(stream)
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
