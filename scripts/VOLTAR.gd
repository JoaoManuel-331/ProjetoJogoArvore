extends Control

func _ready():
	# Conecta os botões às funções
	$VBoxContainer/VOLTAR.pressed.connect(_on_VOLTAR_pressed)
func _on_VOLTAR_pressed():
	get_tree().change_scene_to_file("res://cenas/MENU.tscn")
