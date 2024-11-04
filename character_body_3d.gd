extends CharacterBody3D
@onready var ball := $Ball
@onready var cam := $Ball/Camera3D
@onready var animation := $AnimationPlayer
var SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("crouch"):
		SPEED = SPEED - 2
		$"../AnimationPlayer".play("crouch")
	elif Input.is_action_just_released("crouch"):
		SPEED = SPEED + 2
		$"../AnimationPlayer".play_backwards("crouch")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (ball.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent) -> void:		
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	if event.is_action_pressed("ui_cancel"):
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			ball.rotate_y(-event.relative.x*0.003)
			cam.rotate_x(-event.relative.y*0.003)
			cam.rotation.x = clamp(cam.rotation.x, deg_to_rad(-60), deg_to_rad(60))
