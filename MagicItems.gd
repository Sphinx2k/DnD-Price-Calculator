class_name MagicItemsC
extends Node

#var ITEM_TYPES = {"NONE":0,"Weapon":1,"Armor":2,"Potion":3,"Ring":4,"Rod":5,"Scroll":6,"Staff":7,"Wand":8, "Wondrous Item":9,}
#var ITEM_RARITYs = {"NONE":0,"Common":1,"Uncommon":2,"Rare":3,"Very Rare":4,"Legendary":5}
#var ITEM_POWER = {"NONE":0,"Minor":1,"Major":2}
#var ITEM_USES = {"NONE":0,"Limited":1,"Permanent":2,"Single":3,"Charged":4}

var ITEM_TYPES = ["NONE","Weapon","Armor","Potion","Ring","Rod","Scroll","Staff","Wand", "Wondrous Item"]
var ITEM_RARITYs = {"NONE":0,"Common":1,"Uncommon":2,"Rare":3,"Very Rare":4,"Legendary":5}
var ITEM_POWER = ["minor","major"]
var ITEM_USES = ["Single","Limited","Charged","Permanent"]

var ITEM_RARITYBasePricePerPart = {"none":0,"common":15,"uncommon":50,"rare":500,"very rare":5000,"legendary":25000}
var ITEM_USESBasePartsMinor = {"single":3,"limited":4,"charged":5,"permanent":6}
var ITEM_USESBasePartsMajor = {"single":5,"limited":6,"charged":7,"permanent":8}
var ITEM_LABORBasePrice = {"none":0,"common":20,"uncommon":100,"rare":1000,"very rare":10000,"legendary":50000}

# Meine Preisanpassungen
export var ITEM_My_Price_Modifier_Rarity = {"common":1,"uncommon":2.5,"rare":1.5,"very rare":1,"legendary":1}
export var ITEM_My_Price_Modifier_Power = {"minor":0.95,"major":1}
export var ITEM_My_Price_Modifier_Uses = {"single":1,"limited":1.1,"charged":1.2,"permanent":1.5}
export var ITEM_My_Price_Modifier_Special = {"attument_req":0.95,"cursed":0.5}
export var ITEM_TYPES_Price_Modifier = {"weapon":1,"armor":1,"potion":1,"ring":1,"rod":1,"scroll":1,"staff":1,"wand":1, "wondrous item":1}

export var quick_price_mod : int =100

export (String, FILE) var json_file = "res://Preise.json"
var itemDic : Dictionary= {}
var itemListEntry = preload ("res://ItemListEntry.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	load_json()
	loadpriceinfo()


func load_json():
	var file = File.new();
	file.open(json_file, File.READ);
	itemDic=parse_json(file.get_as_text());
	file.close();

func save():
	print("save")
	var file = File.new()
	file.open("res://PriceSettings.json",File.WRITE)
#	file.store_var(MagicItems,true)
	var savedic= {}
	savedic["ITEM_RARITYBasePricePerPart"] = ITEM_RARITYBasePricePerPart
	savedic["ITEM_USESBasePartsMinor"] = ITEM_USESBasePartsMinor
	savedic["ITEM_USESBasePartsMajor"] = ITEM_USESBasePartsMajor
	savedic["ITEM_LABORBasePrice"] = ITEM_LABORBasePrice
	savedic["ITEM_My_Price_Modifier_Rarity"] = ITEM_My_Price_Modifier_Rarity
	savedic["ITEM_My_Price_Modifier_Power"] = ITEM_My_Price_Modifier_Power
	savedic["ITEM_My_Price_Modifier_Uses"] = ITEM_My_Price_Modifier_Uses
	savedic["ITEM_My_Price_Modifier_Special"] = ITEM_My_Price_Modifier_Special
	savedic["ITEM_TYPES_Price_Modifier"] = ITEM_TYPES_Price_Modifier
	file.store_string(to_json(savedic))
	file.close()

func saveItems():
	print("save Items")
	var file = File.new()
	file.open(json_file,File.WRITE)
	var savedic= {}
	savedic = itemDic
	file.store_string(to_json(savedic))
	file.close()

func loadpriceinfo():
	var file = File.new();
	file.open("res://PriceSettings.json", File.READ);
	var tempdic=parse_json(file.get_as_text()); 
	ITEM_RARITYBasePricePerPart=tempdic["ITEM_RARITYBasePricePerPart"]
	ITEM_USESBasePartsMinor=tempdic["ITEM_USESBasePartsMinor"]
	ITEM_USESBasePartsMajor=tempdic["ITEM_USESBasePartsMajor"]
	ITEM_LABORBasePrice=tempdic["ITEM_LABORBasePrice"]
	ITEM_My_Price_Modifier_Rarity=tempdic["ITEM_My_Price_Modifier_Rarity"]
	ITEM_My_Price_Modifier_Power=tempdic["ITEM_My_Price_Modifier_Power"]
	ITEM_My_Price_Modifier_Uses=tempdic["ITEM_My_Price_Modifier_Uses"]
	ITEM_My_Price_Modifier_Special=tempdic["ITEM_My_Price_Modifier_Special"]
	ITEM_TYPES_Price_Modifier=tempdic["ITEM_TYPES_Price_Modifier"]
	
	file.close();
	
func loadItems():
	var file = File.new();
	file.open("res://ItemSaveTest.json", File.READ);
	itemDic=parse_json(file.get_as_text());
	file.close();

func exportCSV():
	print("save CSV")
	#Name,Type,Rarity,Power,Attune?,Use,Curse,Source,Page,Mat. Base Price,No. of Mat.,Material Cost,Labor Cost,Total Cost,Meine Kosten
	var keynames=["Type","Rarity","Power","Attune?","Use","Curse","Source","Page","Mat. Base Price","No. of Mat.","Material Cost","Labor Cost","Total Cost","Meine Kosten"]
	var file = File.new()
	file.open("itemlist.csv",File.WRITE)
	var tempstr = "Name"
	for t in keynames:
		tempstr+=";"+t
	tempstr+="\n"
	file.store_string(tempstr)
	print (tempstr)
	
	for i in itemDic:
		tempstr=i

		for t in keynames:

			if itemDic[i][t] !=null:
				tempstr+=";"+(itemDic[i][t] as String)
			else:
				tempstr+="; "
		tempstr+="\n"
		file.store_string(tempstr)
		#print(itemDic[i].keys())
		#file.store_string()
	file.close()
