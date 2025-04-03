extends Control

func _ready():
	# Conecta os botões às funções
	$VBoxContainer/INICIAR.pressed.connect(_on_jogar_pressed)
	$VBoxContainer/SAIR.pressed.connect(_on_sair_pressed)
	#$VBoxContainer/COMO_JOGAR.pressed.connect(_on_descricao_pressed)
	$"VBoxContainer/CRÉDITOS".pressed.connect(_on_credito_pressed)
func _on_jogar_pressed():
	get_tree().change_scene_to_file("res://cenas/cenário.tscn")

func _on_sair_pressed():
	get_tree().quit()

func _on_descricao_pressed():
	get_tree().change_scene_to_file("res://cenas/DESCRIÇÃO.tscn")
	
func _on_credito_pressed():
	get_tree().change_scene_to_file("res://cenas/creditos.tscn")


func _on_como_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/DESCRIÇÃO.tscn")
	pass # Replace with function body.
