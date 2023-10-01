extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		var tween := create_tween()
		tween.set_parallel(true)
		tween.tween_property(self, "global_position", body.global_position, 0.2)
		tween.tween_property(self, "scale", Vector3.ZERO, 0.2)
		tween.set_parallel(false)
		tween.tween_callback(queue_free)
		tween.tween_callback(func(): body.coin_count += 1) #anonymous func
