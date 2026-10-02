class_name Orbitals
extends Node2D

var rings_shown := 30

static func radius_for(i: int) -> float:
	return 240.0 + i * 240.0

func _draw() -> void:
	for i in rings_shown:
		draw_arc(Vector2.ZERO, radius_for(i), 0, TAU, 128, Color.WHITE, 2.0)

func _on_electron_ring_changed(new_ring: int) -> void:
	rings_shown = max(rings_shown, new_ring + 3)
	queue_redraw()
