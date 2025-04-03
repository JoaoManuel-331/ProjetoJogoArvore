extends Control

func _ready():
	# Conecta os botões às funções
	$"VBoxContainer/JOGAR NOVAMENTE".pressed.connect(_on_jogar_pressed)
	$VBoxContainer/SAIR.pressed.connect(_on_sair_pressed)
	$"VBoxContainer/CRÉDITOS".pressed.connect(_on_credito_pressed)
	
func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://cenas/cenário.tscn")

func _on_sair_pressed():
	get_tree().quit()

func _on_descricao_pressed():
	get_tree().change_scene_to_file("res://cenas/DESCRIÇÃO.tscn")
	
func _on_credito_pressed():
	get_tree().change_scene_to_file("res://cenas/creditos.tscn")
