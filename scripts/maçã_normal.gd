extends CharacterBody2D

@export var sound: AudioStreamPlayer

func _physics_process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		body.coletarMacas("normal")
		queue_free()
	pass # Replace with function body.
