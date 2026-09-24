extends RigidBody2D

@warning_ignore("unused_signal")
signal destory

var direction = Vector2(-1.0, 0.0)
var speed = 300

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	if linear_velocity != direction * speed:
		linear_velocity = direction * speed

func _on_destory() -> void:
	queue_free()
