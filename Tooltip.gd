class_name Tooltip
extends Node

export var visuals_res : PackedScene
export var owner_path: NodePath
export var values_path : NodePath
export (float, 0,10,0.05) var delay =0.5
export var follow_mouse : bool = true

var _visuals: Node
var _timer : Timer
var tooltipwindow

onready var owner_node = get_node(owner_path)
onready var value_node = get_node(values_path)
var iiw = preload("res://ItemInfoWindow.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_visuals = visuals_res.instance()
	#add_child(_visuals)
	
	owner_node.connect("mouse_entered",self, "_mouse_entered")
	owner_node.connect("mouse_exited",self, "_mouse_exited")
	
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_custom_show")
	#_visuals.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _mouse_entered() -> void:
	_timer.start(delay)



func _mouse_exited() -> void:
	_timer.stop()
	if tooltipwindow!=null:
		if get_tree().get_nodes_in_group("ItemInfoWindow").size()>0:
			remove_child(tooltipwindow)



func _custom_show() -> void:
	_timer.stop()
	tooltipwindow =iiw.instance()
	tooltipwindow.displayItemInformation(value_node)
	#tooltipwindow.size_flags_horizontal-=tooltipwindow.SIZE_EXPAND
	add_child(tooltipwindow)


func _get_screen_pos() -> Vector2:
	if follow_mouse:
		return get_viewport().get_mouse_position()
	
	
	var position = Vector2()
	
	if owner_node is Node2D:
		position = owner_node.get_global_transform_with_canvas().origin
	elif owner_node is Spatial:
		position = get_viewport().get_camera().unproject_position(owner_node.global_transform.origin)
	elif owner_node is Control:
		position = owner_node.rect_position
	
	return position
