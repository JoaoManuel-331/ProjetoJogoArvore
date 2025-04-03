extends Node
#
#var tempo_restante = 10.0  # Tempo em segundos
#
#func _process(delta):
	#if tempo_restante > 0:
		#tempo_restante -= delta  # Subtrai o tempo baseado no frame rate
		#print("Tempo restante:", round(tempo_restante))
	#else:
		#print("Tempo finalizado!")
		#set_process(false)  # Desativa o _process para economizar desempenho

@export var tempo_limite: float = 250  # Tempo em segundos antes da troca de cena
@export var proxima_cena: String = "res://CENA FINAL.tscn"  # Caminho da cena de pontos

func _ready():
	# Inicia um timer para trocar de cena quando o tempo acabar
	await get_tree().create_timer(tempo_limite).timeout
	mudar_para_tela_pontos()

func mudar_para_tela_pontos():
	get_tree().change_scene_to_file(proxima_cena)
