extends Control

signal ok_pressed

export var pathName : NodePath
export var pathSource : NodePath
export var pathPage : NodePath 
export var pathAttune : NodePath
export var pathCurse : NodePath
#First Button in every Group
export var pathRarity : NodePath
export var pathType : NodePath
export var pathUses : NodePath
export var pathMinMaj : NodePath

onready var nodeName : Node = get_node(pathName)
onready var nodeSource : Node = get_node(pathSource)
onready var nodePage : Node = get_node(pathPage)
onready var nodeAttune : Node = get_node(pathAttune)
onready var nodeCurse : Node = get_node(pathCurse)

onready var bgRarity : ButtonGroup = get_node(pathRarity).group
onready var bgType : ButtonGroup = get_node(pathType).group
onready var bgUses : ButtonGroup = get_node(pathUses).group
onready var bgMinMaj : ButtonGroup = get_node(pathMinMaj).group


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Save_Button_pressed():
	if MagicItems.itemDic.has(nodeName.text):
		get_node("EditItem/ConfirmationDialog").popup()
		return
	saveItem()
	

func saveItem ():
	var name : String
	var type: String
	var rarity: String
	var power: String
	var uses: String
	var cursed: bool = false
	var cursedStr : String
	var attun: bool = false
	var attunStr : String
	var source:String
	var page: String
	
	name=nodeName.text
	source=nodeSource.text
	page=nodePage.text
	cursed=nodeCurse.pressed
	attun=nodeAttune.pressed
	rarity=bgRarity.get_pressed_button().text
	power=bgMinMaj.get_pressed_button().text
	uses=bgUses.get_pressed_button().text
	type=bgType.get_pressed_button().text
	
	if cursed:
		cursedStr="Cursed"
	else:
		cursedStr=""
	
	if attun:
		attunStr="Yes"
	else:
		attunStr="No"
	pass
	
	createItem(name, type, rarity, power, uses, cursedStr, attunStr, source, page)



func createItem(name : String, type: String, rarity: String, power: String, uses: String, cursed: String, attun: String, source:String, page: String):
	MagicItems.itemDic[name] = {"Type":type,"Rarity":rarity,"Power":power,"Attune?":attun,"Use":uses,"Curse":cursed,"Source":source,"Page":page,}
	emit_signal("ok_pressed")
	pass

func editItem(name : String, type: String, rarity: String, power: String, uses: String, cursed: bool, attun: bool, source:String, page: String):
	nodeName.text=name
	nodeSource.text=source
	nodePage.text=page
	nodeCurse.pressed=cursed
	nodeAttune.pressed=attun
	for b in bgRarity.get_buttons():
		if b.text==rarity:
			b.pressed=true
	for b in bgMinMaj.get_buttons():
		if b.text==power:
			b.pressed=true
	for b in bgUses.get_buttons():
		if b.text==uses:
			b.pressed=true
	for b in bgType.get_buttons():
		if b.text==type:
			b.pressed=true


func _on_Cancel_pressed():
	get_parent().remove_child(self)
	pass # Replace with function body.


func _on_ConfirmationDialog_confirmed():
	get_node("EditItem/ConfirmationDialog").hide()
	saveItem ()




func _on_DelButton_pressed():
	if MagicItems.itemDic.has(nodeName.text):
		get_node("EditItem/DelConfirmDialog").popup()


func _on_DelConfirmDialog_confirmed():
	MagicItems.itemDic.erase(nodeName.text)
	get_node("EditItem/DelConfirmDialog").hide()
	get_parent().remove_child(self)
	emit_signal("ok_pressed")
