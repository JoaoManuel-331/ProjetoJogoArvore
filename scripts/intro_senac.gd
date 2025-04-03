extends Control

@export var intro_duration : float = 6.0  # Definindo a duração da tela de introdução

func _ready():
	# Conecta os botões às funções
	$pular.pressed.connect(_on_VOLTAR_pressed)
	
	# Após o tempo da intro, mudar para a próxima cena
	await get_tree().create_timer(intro_duration).timeout

	# Mudar para a cena de menu
	get_tree().change_scene_to_file("res://cenas/Introempresa.tscn")

# Função chamada quando o botão "Pular" é pressionado
func _on_VOLTAR_pressed():
	get_tree().change_scene_to_file("res://cenas/Introempresa.tscn")
