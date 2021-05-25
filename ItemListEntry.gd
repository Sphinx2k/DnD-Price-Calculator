extends MarginContainer
class_name ItemListEntry
#signal mainButtonPressed

#Fixe Werte
var itemName : String
var itemType : String
var itemRarity : String
var itemPower : String
var itemNeedToAttune : bool =false
var itemUses : String
var itemIsCursed : bool = false
var itemSource : String
var itemSourcePage : String

#Errechnete Werte
var itemMatBasePrice : int
var itemNoOfMaterials : int
var itemMaterialCost : int
var itemLaborCost : int
var itemTotalCost : int
var itemMyTotalCost : int


func myInit(iName:String, iType:String, iRarity:String,iPower:String,iNeedtoAttune:String,iUses:String,iItemCursed:String,iItemSource:String,iItemSourcePage:String):
	itemName=iName;
	itemType=iType
	itemRarity=iRarity
	itemPower =iPower
	
	#print(iNeedtoAttune)
	if (iNeedtoAttune.to_lower()=="yes"):
		itemNeedToAttune=true 
	else:
		itemNeedToAttune=false
		
	itemUses=iUses
	
	if (iItemCursed.to_lower()=="yes"):
		itemIsCursed=true 
	else:
		itemIsCursed=false
	
	itemSource=iItemSource
	itemSourcePage=iItemSourcePage
	#print (itemName)
	calculateValues()
	updateValuesForItem()
	displayValues()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func calculateValues():
	itemMatBasePrice=MagicItems.ITEM_RARITYBasePricePerPart[itemRarity.to_lower()]
	itemNoOfMaterials=getMaterialCount()
	itemMaterialCost=itemMatBasePrice*itemNoOfMaterials
	itemLaborCost=MagicItems.ITEM_LABORBasePrice[itemRarity.to_lower()]
	itemTotalCost=itemLaborCost+itemMaterialCost
	itemMyTotalCost=getMyPrices()
	itemTotalCost*=(MagicItems.quick_price_mod as float/100.0)

func updateValuesForItem():
	var keynames=["Type","Rarity","Power","Attune?","Use","Curse","Source","Page","Mat. Base Price","No. of Mat.","Material Cost","Labor Cost","Total Cost","Meine Kosten"]
	var item=MagicItems.itemDic[itemName]
	item["Mat. Base Price"]=itemMatBasePrice as String
	item["No. of Mat."]=itemNoOfMaterials as String
	item["Material Cost"]=itemMaterialCost as String
	item["Labor Cost"]=itemLaborCost as String
	item["Total Cost"]=itemTotalCost as String
	item["Meine Kosten"]=itemMyTotalCost as String
	pass

func getMaterialCount():
	if (itemPower.to_lower()==MagicItems.ITEM_POWER[0]): #Minor Item
		return MagicItems.ITEM_USESBasePartsMinor[itemUses.to_lower()]
	if (itemPower.to_lower()==MagicItems.ITEM_POWER[1]): #Major Item
		return MagicItems.ITEM_USESBasePartsMajor[itemUses.to_lower()]
	return 0

func getMyPrices():
	var temp=itemTotalCost
	temp=temp*MagicItems.ITEM_My_Price_Modifier_Rarity[itemRarity.to_lower()]
	temp=temp*MagicItems.ITEM_My_Price_Modifier_Power[itemPower.to_lower()]
	temp=temp*MagicItems.ITEM_My_Price_Modifier_Uses[itemUses.to_lower()]
	if itemNeedToAttune: temp=temp*MagicItems.ITEM_My_Price_Modifier_Special["attument_req"]
	if itemIsCursed: temp=temp*MagicItems.ITEM_My_Price_Modifier_Special["cursed"]
	temp=temp*MagicItems.ITEM_TYPES_Price_Modifier[itemType.to_lower()]
	temp*=(MagicItems.quick_price_mod as float/100.0)
	return temp

func displayValues():
	get_node("HBoxContainer/MainButton/VB1/VB2/lblName").text=itemName
	get_node("HBoxContainer/MainButton/VB1/VB2/lvlValues").text=itemPower+" "+itemRarity+" "+itemType
	get_node("HBoxContainer/MainButton/VB1/VB3/cbAttunment").pressed=itemNeedToAttune
	get_node("HBoxContainer/MainButton/VB1/VB3/cbCursed").pressed=itemIsCursed
	get_node("HBoxContainer/MainButton/VB1/lblPrice").text=String(itemTotalCost)
	get_node("HBoxContainer/MainButton/VB1/lblMyPrice").text=String(itemMyTotalCost)
	pass


#func _on_MainButton_pressed():
#	emit_signal("mainButtonPressed")
#
