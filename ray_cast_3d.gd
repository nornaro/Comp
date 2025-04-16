extends RayCast3D


func _on_area_3d_body_entered(body: Node3D) -> void:
	print("_on_area_3d_body_entered")
	pass # Replace with function body.


func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	print("_on_area_3d_body_shape_entered")
	pass # Replace with function body.


func _on_area_3d_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	print("_on_area_3d_area_shape_entered")
	pass # Replace with function body.


func _on_area_3d_area_entered(area: Area3D) -> void:
	print("_on_area_3d_area_entered")
	pass # Replace with function body.
