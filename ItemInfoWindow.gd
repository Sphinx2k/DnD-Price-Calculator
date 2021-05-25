extends Node #Control

export(NodePath) var lblName
export(NodePath) var lblRarity
export(NodePath) var lblPower
export(NodePath) var lblType
export(NodePath) var lblUses
export(NodePath) var cbAtun
export(NodePath) var cbCurse
export(NodePath) var lblSourcbook
export(NodePath) var lblPage
export(NodePath) var lblMaterialPrice
export(NodePath) var lblNrMaterials
export(NodePath) var lblCombMatCost
export(NodePath) var lblLaborcost
export(NodePath) var lblCombDMG
export(NodePath) var lblModPrice

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func displayItemInformation(item):
	get_node(lblName).text=item.itemName
	get_node(lblRarity).text=item.itemRarity
	get_node(lblPower).text=item.itemPower
	get_node(lblType).text=item.itemType
	get_node(lblUses).text=item.itemUses
	get_node(cbAtun).pressed=item.itemNeedToAttune
	get_node(cbCurse).pressed=item.itemIsCursed
	get_node(lblSourcbook).text=item.itemSource
	get_node(lblPage).text=item.itemSourcePage
	get_node(lblMaterialPrice).text=item.itemMatBasePrice as String
	get_node(lblNrMaterials).text=item.itemNoOfMaterials as String
	get_node(lblCombMatCost).text=item.itemMaterialCost as String
	get_node(lblLaborcost).text=item.itemLaborCost as String
	get_node(lblCombDMG).text=item.itemTotalCost as String
	get_node(lblModPrice).text=item.itemMyTotalCost as String

func _process(_delta):
	var mc = get_node("MarginContainer")
	var windowpos:Vector2=get_viewport().get_mouse_position()#get_global_mouse_position()
	windowpos.x=windowpos.x-(mc.rect_size.x/2.0)
	windowpos.y=windowpos.y+5
	if (windowpos.y+mc.rect_size.y>mc.get_viewport_rect().size.y+10):
		windowpos.y=windowpos.y-(mc.rect_size.y)
		windowpos.y=windowpos.y-5
	var temp1 = windowpos.x+(mc.rect_size.x)
	if (temp1>mc.get_viewport_rect().size.x-10):
		windowpos.x=windowpos.x+(mc.get_viewport_rect().size.x-10-temp1)
	if (windowpos.x<10):
		windowpos.x=windowpos.x-(windowpos.x-10)
	get_node("MarginContainer").rect_position=windowpos


