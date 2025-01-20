extends Control

@export var stream: AudioStream

func _on_play_pressed() -> void:
	AudioManager.play_sound(stream)
	get_tree().change_scene_to_file("res://scenes/world.tscn")
	
	


func _on_settings_pressed() -> void:
	AudioManager.play_sound(stream)
	get_tree().change_scene_to_file("res://scenes/settings.tscn")
	


func _on_exit_pressed() -> void:
	AudioManager.play_sound(stream)
	get_tree().quit()
	
