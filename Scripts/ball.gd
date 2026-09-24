extends RigidBody2D

signal destory

var direction = Vector2(-1.0, 0.0)
var speed = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if linear_velocity != direction * speed:
		linear_velocity = direction * speed

func _on_destory() -> void:
	queue_free()
