class_name FractalNavigation
extends ColorRect


func _ready() -> void:
	resized.connect(_on_resized)

func _on_resized() -> void:
	material.set_shader_parameter("aspect_ratio", size.x / size.y);
