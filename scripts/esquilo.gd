extends CharacterBody2D



func _ready() -> void:
	$Label.visible = false
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	$Label.visible = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	$Label.visible = false
	pass # Replace with function body.
