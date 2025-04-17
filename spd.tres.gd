extends Node3D

var spd := 0.0
var smoothed_spd := 0.0  # Simított sebesség

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# Gomb lenyomva tartva gyorsítás
	if Input.is_action_pressed("ui_home"):
		if spd < 100:
			spd += 0.01

	# Gomb lenyomva tartva lassítás
	if Input.is_action_pressed("ui_end"):
		if spd > -100:
			spd -= 0.01

	# Simított átmenet a valós és cél sebesség között
	smoothed_spd = lerp(smoothed_spd, spd, 5 * delta)

	speed(smoothed_spd)

func speed(value: float) -> void:
	if value >= 0:
		$Nacels/LNacel/OmniLight3D2.light_energy = value
		$Nacels/LNacel/OmniLight3D2.light_specular = value
		$Nacels/RNacel/OmniLight3D2.light_energy = value
		$Nacels/RNacel/OmniLight3D2.light_specular = value
	if value < 0:
		$Nacels/LNacel/OmniLight3D5.light_energy = -value
		$Nacels/LNacel/OmniLight3D5.light_specular = -value
		$Nacels/RNacel/OmniLight3D5.light_energy = -value
		$Nacels/RNacel/OmniLight3D5.light_specular = -value

	var mesh_instance = $Nacels/LNacel/Node3D/ProtoCSGMesh3D8
	var material = mesh_instance.material

	if material is StandardMaterial3D:
		material.emission_energy = abs(value)
