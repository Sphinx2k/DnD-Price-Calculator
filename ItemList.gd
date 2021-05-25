extends PanelContainer

#onready var gv = get_node("/root/ItemList")
var itemListEntry = preload ("res://ItemListEntry.tscn")
signal mouse_has_entered (item)
signal button_pressed (item)

# Called when the node enters the scene tree for the first time.
func _ready():
	#var temp = get_node("MarginContainer/VBoxContainer/LineEdit").text
	parseFilteredItemDictonary(MagicItems.itemDic)
	#get_node("MarginContainer/VBoxContainer/LineEdit").connect("mouse_entered",get_node("."),"_onItemButtonPressed")

func curseCheck(value):
	if (value==null || !value):
			return "No"
	var temp:String = value
	if (temp.to_lower()=="Cursed".to_lower() || value):
		return "Yes"
	#if (temp.to_lower()=="False".to_lower()):
	return temp
	
func checkDataForNIL(value):
	if (value==null):
			return "nil"
	return value


func _on_LineEdit_text_changed(_new_text):
	parseFilteredItemDictonary(MagicItems.itemDic)


func parseFilteredItemDictonary(theDic):
	var listtosort=[]
	for e in theDic:
		listtosort.append(e as String)
	listtosort.sort_custom(self,"sort_ascending")
	
	remove_old_entrys()
	var text = get_node("MarginContainer/VBoxContainer/HBoxContainer/LineEdit").text
	if (text==null || text==""):
		for n in listtosort:
			addToList(n)
		return
	for n in listtosort:
		if (text.to_lower() in n.to_lower()):
			addToList(n)

static func sort_ascending(a: String, b:String):
				if a.to_lower() < b.to_lower():
						return true
				return false

func addToList(e):
	var test = itemListEntry.instance()
	test.myInit(e,checkDataForNIL(MagicItems.itemDic[e]["Type"]),checkDataForNIL(MagicItems.itemDic[e]["Rarity"]),checkDataForNIL(MagicItems.itemDic[e]["Power"]),checkDataForNIL(MagicItems.itemDic[e]["Attune?"]),checkDataForNIL(MagicItems.itemDic[e]["Use"]),curseCheck(MagicItems.itemDic[e]["Curse"]),checkDataForNIL(MagicItems.itemDic[e]["Source"]),checkDataForNIL(MagicItems.itemDic[e]["Page"]))
	test.get_node("HBoxContainer/MainButton").connect("pressed", self, "_onItemButtonPressed",[test])
	test.get_node("HBoxContainer/MainButton").connect("mouse_entered", self, "_mouse_entered",[test])
	get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").add_child(test);
	

func _onItemButtonPressed(item):
	emit_signal("button_pressed",item)
#	print (item.itemName)

func _mouse_entered(item):
	emit_signal("mouse_has_entered",item)
	#print (item.itemName)

func remove_old_entrys():
	if get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").get_child_count()>0:
		for n in get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").get_children():
			get_node("MarginContainer/VBoxContainer/ScrollContainer/VBoxContainer").remove_child(n)


#func parseFilteredItemDictonary(theDic):
#	remove_old_entrys()
#	var text = get_node("MarginContainer/VBoxContainer/LineEdit").text
#	if (text==null || text==""):
#			for e in theDic:
#				addToList(e)
#			return
#	for e in theDic:
#		if (text.to_lower() in String(e).to_lower()):
#			addToList(e)
