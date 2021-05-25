extends Control

#export (NodePath) var dropdown_path
#onready var dropdown= get_node(dropdown_path)

#variable für item edit fenster
var iee

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("VBoxContainer/ItemList").connect("button_pressed",self,"_itemButtonPressed")
	get_node("VBoxContainer/HBoxContainer/MenuButton").get_popup().connect("id_pressed", self, "_menubutton_pressend")
	_setup_Menu(get_node("VBoxContainer/HBoxContainer/MenuButton"))

	pass # Replace with function body.

func _setup_Menu(mb: MenuButton):
	mb.get_popup().add_item("Export CSV")
	mb.get_popup().add_separator("")
	mb.get_popup().add_item("Edit Price Settings")
	mb.get_popup().add_separator("")
	mb.get_popup().add_item("Save Price Settings")
	mb.get_popup().add_item("Save Item Data")
	mb.get_popup().add_separator("")
	mb.get_popup().add_item("Quit")

#Alle Einstellungsdaten sind OK jetzt berechne die Preise neu
func _settings_ok_pressed():
	get_node("VBoxContainer/ItemList").parseFilteredItemDictonary(MagicItems.itemDic)
	pass





func _on_Button3_pressed():
	MagicItems.load()
	MagicItems.loadItems()
	get_node("VBoxContainer/ItemList").parseFilteredItemDictonary(MagicItems.itemDic)


func _quick_price_mod_slider(value):
	get_node("VBoxContainer/HBoxContainer/HBoxContainer/LineEdit").text=value as String
	get_node("VBoxContainer/ItemList").parseFilteredItemDictonary(MagicItems.itemDic)
	MagicItems.quick_price_mod=value as int
	


func _quick_price_mod_edit(new_text):
	if (new_text.is_valid_integer()):
		var wert : int= new_text as int
		if wert<50: wert=50
		if wert>150: wert=150
		MagicItems.quick_price_mod=wert
		get_node("VBoxContainer/HBoxContainer/HBoxContainer/HSlider").value=wert

func _itemButtonPressed(item: ItemListEntry):
	if iee!=null: self.remove_child(iee)
	var ee = load("res://EditItem.tscn")
	iee =ee.instance() 
	iee.connect("ok_pressed",self, "editItemOKPressed")
	#name : String, type: String, rarity: String, power: String, uses: String, cursed: bool, attun: bool, source:String, page: String
	add_child(iee)
	iee.popup()
	iee.editItem(item.itemName, item.itemType,item.itemRarity,item.itemPower,item.itemUses,item.itemIsCursed,item.itemNeedToAttune,item.itemSource,item.itemSourcePage)
	
	#print (item.itemName)

func editItemOKPressed():
	get_node("VBoxContainer/ItemList").parseFilteredItemDictonary(MagicItems.itemDic)
	if iee!=null: self.remove_child(iee)
		#print ("done")


func _on_NewItemButton_pressed():
	if iee!=null: self.remove_child(iee)
	var ee = load("res://EditItem.tscn")
	iee =ee.instance() 
	iee.connect("ok_pressed",self, "editItemOKPressed")
	#name : String, type: String, rarity: String, power: String, uses: String, cursed: bool, attun: bool, source:String, page: String
	add_child(iee)
	iee.popup()
	iee.editItem("","","","","",false,false,"","")
	#iee.editItem(item.itemName, item.itemType,item.itemRarity,item.itemPower,item.itemUses,item.itemIsCursed,item.itemNeedToAttune,item.itemSource,item.itemSourcePage)

func _menubutton_pressend(id):
	print($VBoxContainer/HBoxContainer/MenuButton.get_popup().get_item_text(id))
	var selected = $VBoxContainer/HBoxContainer/MenuButton.get_popup().get_item_text(id)
	match selected:
		"Edit Price Settings":
			var set = load("res://PriceChangerMenu.tscn")
			var iset =set.instance() 
			iset.connect("ok_pressed", self , "_settings_ok_pressed")
			add_child(iset)
		"Save Price Settings":
			MagicItems.save()
		"Save Item Data":
			MagicItems.saveItems()
		"Quit":
			get_tree().quit()
		"Export CSV":
			MagicItems.exportCSV()
			
