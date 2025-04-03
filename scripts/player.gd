extends CharacterBody2D

const SPEED = 40
@onready var macas = $"../CanvasLayer2/contator de macas"
var cont_macas := 0

@onready var labeltempo = $"../CanvasLayer3/Label"
var tempo_restante = 250

# Limites de movimento
const MIN_X = -200
const MAX_X = 4400
const MIN_Y = 40
const MAX_Y = 2520

# Variável para armazenar a referência ao AnimatedSprite2D
var animated_sprite: AnimatedSprite2D

func _ready() -> void:
	# Inicializa a referência para o AnimatedSprite2D
	animated_sprite = get_node("AnimatedSprite2D")
	
func _physics_process(delta: float) -> void:
	contartempo(delta)
	var moving = false  # Variável para controlar se o personagem está se movendo
	
	# Movimentação horizontal
	var direction_horizontal := Input.get_axis("ui_left", "ui_right")
	if direction_horizontal != 0:
		velocity.x = direction_horizontal * SPEED
		if direction_horizontal < 0:
			animated_sprite.animation = "esquerda"  # Andando para a esquerda
		else:
			animated_sprite.animation = "direita"  # Andando para a direita
		moving = true  # Marcamos que há movimento horizontal
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Movimentação vertical
	var direction_vertical := Input.get_axis("ui_up", "ui_down")
	if direction_vertical != 0:
		velocity.y = direction_vertical * SPEED
		if direction_vertical < 0:
			animated_sprite.animation = "cima"  # Andando para cima
		else:
			animated_sprite.animation = "baixo"  # Andando para baixo
		moving = true  # Marcamos que há movimento vertical
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	# Se não houver movimento em nenhuma direção, coloca a animação "parado"
	#diagonal superior direita
	if direction_vertical != 0 and direction_horizontal !=0:
		if direction_horizontal > 0 and direction_vertical < 0:
			velocity.y = move_toward(velocity.y, 0, SPEED)
			velocity.x = move_toward(velocity.x, 0, SPEED)
			animated_sprite.animation = "parado_cima"
			
	#diagonal inferior direita
	if direction_vertical != 0 and direction_horizontal !=0:
		if direction_horizontal > 0 and direction_vertical > 0:
			velocity.y = move_toward(velocity.y, 0, SPEED)
			velocity.x = move_toward(velocity.x, 0, SPEED)
			animated_sprite.animation = "parado"
			
	#diagonal superior esquerda
	if direction_vertical != 0 and direction_horizontal !=0:
		if direction_horizontal < 0 and direction_vertical < 0:
			velocity.y = move_toward(velocity.y, 0, SPEED)
			velocity.x = move_toward(velocity.x, 0, SPEED)
			animated_sprite.animation = "parado_cima"
			
	#diagonal inferior esquerda
	if direction_vertical != 0 and direction_horizontal !=0:
		if direction_horizontal < 0 and direction_vertical > 0:
			velocity.y = move_toward(velocity.y, 0, SPEED)
			velocity.x = move_toward(velocity.x, 0, SPEED)
			animated_sprite.animation = "parado"
		
	if not moving:
		animated_sprite.animation = "parado"
	
	# Limitar movimento horizontal no eixo X
	position.x = clamp(position.x + velocity.x * delta, MIN_X, MAX_X)
	# Limitar movimento vertical no eixo Y
	position.y = clamp(position.y + velocity.y * delta, MIN_Y, MAX_Y)
	# Atualizar a posição do personagem
	move_and_slide()

func coletarMacas(maca_recebida) -> void:
	if maca_recebida == "normal":
		cont_macas +=1
		macas.text = "CONTADOR DE MAÇÃS: %d"  %cont_macas
	else:
		cont_macas +=100
		macas.text = "CONTADOR DE MAÇÃS: %d"  %cont_macas


func contartempo(tempo) -> void:
	if tempo_restante > 0:
		tempo_restante -= tempo
		if tempo_restante < 0:
			tempo_restante = 0  # Evita valores negativos

		labeltempo.text = "Tempo: %d" % tempo_restante
		print("Tempo restante:", round(tempo_restante))
		
