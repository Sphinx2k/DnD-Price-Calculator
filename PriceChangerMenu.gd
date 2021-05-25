extends Control

signal ok_pressed()

var _daten_alle_ok : bool = true
#var baseCommon : int
#var baseUncommon : int
#var baseRare : int
#var baseVeryRare : int
#var baseLegendary : int
#
#var laborCommon : int
#var laborUncommon : int
#var laborRare : int
#var laborVeryRare : int
#var laborLegendary : int
#
#var modiCommon : float
#var modiUncommon : float
#var modiRare : float
#var modiVeryRare : float
#var modiLegendary : float
#
#var singleMinorParts : int
#var limitedMinorParts : int
#var chargedMinorParts : int
#var unlimitedMinorParts : int
#
#var singleMajorParts : int
#var limitedMajorParts : int
#var chargedMajorParts : int
#var unlimitedMajorParts : int
#
#var modMinor : float
#var modMajor : float

export var nodepathbaseCommon : NodePath
export var nodepathbaseUncommon : NodePath
export var nodepathbaseRare : NodePath
export var nodepathbaseVeryRare : NodePath
export var nodepathbaseLegendary : NodePath

export var nodepathlaborCommon : NodePath
export var nodepathlaborUncommon : NodePath
export var nodepathlaborRare : NodePath
export var nodepathlaborVeryRare : NodePath
export var nodepathlaborLegendary : NodePath

export var nodepathmodiCommon : NodePath
export var nodepathmodiUncommon : NodePath
export var nodepathmodiRare : NodePath
export var nodepathmodiVeryRare : NodePath
export var nodepathmodiLegendary : NodePath

export var nodepathsingleMinorParts : NodePath
export var nodepathlimitedMinorParts : NodePath
export var nodepathchargedMinorParts : NodePath
export var nodepathunlimitedMinorParts : NodePath

export var nodepathsingleMajorParts : NodePath
export var nodepathlimitedMajorParts : NodePath
export var nodepathchargedMajorParts : NodePath
export var nodepathunlimitedMajorParts : NodePath

export var nodepathmodMinor : NodePath
export var nodepathmodMajor : NodePath
export var nodepathmodSingle : NodePath
export var nodepathmodLimit : NodePath
export var nodepathmodCharged : NodePath
export var nodepathmodUnlimited : NodePath

export var nodepathmodAttunement : NodePath
export var nodepathmodCursed : NodePath

export var nodepathmodWeapon : NodePath
export var nodepathmodArmor : NodePath
export var nodepathmodPotion : NodePath
export var nodepathmodRing : NodePath
export var nodepathmodRod : NodePath
export var nodepathmodScroll : NodePath
export var nodepathmodStaff : NodePath
export var nodepathmodWand : NodePath
export var nodepathmodWanderousItem : NodePath

onready var nodebaseCommon : Node = get_node(nodepathbaseCommon)
onready var nodebaseUncommon : Node = get_node(nodepathbaseUncommon)
onready var nodebaseRare : Node = get_node(nodepathbaseRare)
onready var nodebaseVeryRare : Node = get_node(nodepathbaseVeryRare)
onready var nodebaseLegendary : Node = get_node(nodepathbaseLegendary)

onready var nodelaborCommon : Node = get_node(nodepathlaborCommon)
onready var nodelaborUncommon : Node = get_node(nodepathlaborUncommon)
onready var nodelaborRare : Node = get_node(nodepathlaborRare)
onready var nodelaborVeryRare : Node = get_node(nodepathlaborVeryRare)
onready var nodelaborLegendary : Node = get_node(nodepathlaborLegendary)

onready var nodemodiCommon : Node = get_node(nodepathmodiCommon)
onready var nodemodiUncommon : Node = get_node(nodepathmodiUncommon)
onready var nodemodiRare : Node = get_node(nodepathmodiRare)
onready var nodemodiVeryRare : Node = get_node(nodepathmodiVeryRare)
onready var nodemodiLegendary : Node = get_node(nodepathmodiLegendary)

onready var nodesingleMinorParts : Node = get_node(nodepathsingleMinorParts)
onready var nodelimitedMinorParts : Node = get_node(nodepathlimitedMinorParts)
onready var nodechargedMinorParts : Node = get_node(nodepathchargedMinorParts)
onready var nodeunlimitedMinorParts : Node = get_node(nodepathunlimitedMinorParts)

onready var nodesingleMajorParts : Node = get_node(nodepathsingleMajorParts)
onready var nodelimitedMajorParts : Node = get_node(nodepathlimitedMajorParts)
onready var nodechargedMajorParts : Node = get_node(nodepathchargedMajorParts)
onready var nodeunlimitedMajorParts : Node = get_node(nodepathunlimitedMajorParts)

onready var nodemodMinor : Node = get_node(nodepathmodMinor)
onready var nodemodMajor : Node = get_node(nodepathmodMajor)
onready var nodemodSingle : Node = get_node(nodepathmodSingle)
onready var nodemodLimit : Node  = get_node(nodepathmodLimit)
onready var nodemodCharged : Node = get_node(nodepathmodCharged)
onready var nodemodUnlimited : Node = get_node(nodepathmodUnlimited)

onready var nodemodAttunement : Node = get_node(nodepathmodAttunement)
onready var nodemodCursed : Node = get_node(nodepathmodCursed)

onready var nodeWeapon : Node = get_node(nodepathmodWeapon)
onready var nodemodArmor : Node = get_node(nodepathmodArmor)
onready var nodemodPotion : Node = get_node(nodepathmodPotion)
onready var nodemodRing : Node = get_node(nodepathmodRing)
onready var nodemodRod : Node = get_node(nodepathmodRod)
onready var nodemodScroll : Node = get_node(nodepathmodScroll)
onready var nodemodStaff : Node = get_node(nodepathmodStaff)
onready var nodemodWand : Node = get_node(nodepathmodWand)
onready var nodemodWanderousItem : Node = get_node(nodepathmodWanderousItem)


# Called when the node enters the scene tree for the first time.
func _ready():
	loadData()
	getData()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func loadData() -> void:
	var mi = MagicItems
	nodebaseCommon.text=mi.ITEM_RARITYBasePricePerPart["common"] as String
	nodebaseUncommon.text =mi.ITEM_RARITYBasePricePerPart["uncommon"] as String
	nodebaseRare.text =mi.ITEM_RARITYBasePricePerPart["rare"] as String
	nodebaseVeryRare.text =mi.ITEM_RARITYBasePricePerPart["very rare"] as String
	nodebaseLegendary.text =mi.ITEM_RARITYBasePricePerPart["legendary"] as String

	nodelaborCommon.text =mi.ITEM_LABORBasePrice["common"] as String
	nodelaborUncommon.text =mi.ITEM_LABORBasePrice["uncommon"] as String
	nodelaborRare.text =mi.ITEM_LABORBasePrice["rare"] as String
	nodelaborVeryRare.text =mi.ITEM_LABORBasePrice["very rare"] as String
	nodelaborLegendary.text =mi.ITEM_LABORBasePrice["legendary"] as String

	nodemodiCommon.text =mi.ITEM_My_Price_Modifier_Rarity["common"] as String
	nodemodiUncommon.text =mi.ITEM_My_Price_Modifier_Rarity["uncommon"] as String
	nodemodiRare.text =mi.ITEM_My_Price_Modifier_Rarity["rare"] as String
	nodemodiVeryRare.text =mi.ITEM_My_Price_Modifier_Rarity["very rare"] as String
	nodemodiLegendary.text =mi.ITEM_My_Price_Modifier_Rarity["legendary"] as String

	nodesingleMinorParts.text =mi.ITEM_USESBasePartsMinor["single"] as String
	nodelimitedMinorParts.text =mi.ITEM_USESBasePartsMinor["limited"] as String
	nodechargedMinorParts.text =mi.ITEM_USESBasePartsMinor["charged"] as String
	nodeunlimitedMinorParts.text =mi.ITEM_USESBasePartsMinor["permanent"] as String

	nodesingleMajorParts.text =mi.ITEM_USESBasePartsMajor["single"] as String
	nodelimitedMajorParts.text =mi.ITEM_USESBasePartsMajor["limited"] as String
	nodechargedMajorParts.text =mi.ITEM_USESBasePartsMajor["charged"] as String
	nodeunlimitedMajorParts.text =mi.ITEM_USESBasePartsMajor["permanent"] as String

	nodemodMinor.text =mi.ITEM_My_Price_Modifier_Power["minor"] as String
	nodemodMajor.text =mi.ITEM_My_Price_Modifier_Power["major"] as String
	nodemodSingle.text =mi.ITEM_My_Price_Modifier_Uses["single"] as String
	nodemodLimit.text =mi.ITEM_My_Price_Modifier_Uses["limited"] as String
	nodemodCharged.text =mi.ITEM_My_Price_Modifier_Uses["charged"] as String
	nodemodUnlimited.text =mi.ITEM_My_Price_Modifier_Uses["permanent"] as String
	
	nodemodAttunement.text = mi.ITEM_My_Price_Modifier_Special["attument_req"] as String
	nodemodCursed.text = mi.ITEM_My_Price_Modifier_Special["cursed"] as String
	
	nodeWeapon.text = mi.ITEM_TYPES_Price_Modifier["weapon"] as String
	nodemodArmor.text = mi.ITEM_TYPES_Price_Modifier["armor"] as String
	nodemodPotion.text = mi.ITEM_TYPES_Price_Modifier["potion"] as String
	nodemodRing.text = mi.ITEM_TYPES_Price_Modifier["ring"] as String
	nodemodRod.text = mi.ITEM_TYPES_Price_Modifier["rod"] as String
	nodemodScroll.text = mi.ITEM_TYPES_Price_Modifier["scroll"] as String
	nodemodStaff.text = mi.ITEM_TYPES_Price_Modifier["staff"] as String
	nodemodWand.text = mi.ITEM_TYPES_Price_Modifier["wand"] as String
	nodemodWanderousItem.text = mi.ITEM_TYPES_Price_Modifier["wondrous item"] as String

func getData() -> void:
	var mi = MagicItems
	mi.ITEM_RARITYBasePricePerPart["common"] = get_text_as_int(nodebaseCommon)
	mi.ITEM_RARITYBasePricePerPart["uncommon"] = get_text_as_int(nodebaseUncommon)
	mi.ITEM_RARITYBasePricePerPart["rare"] = get_text_as_int(nodebaseRare)
	mi.ITEM_RARITYBasePricePerPart["very rare"] = get_text_as_int(nodebaseVeryRare)
	mi.ITEM_RARITYBasePricePerPart["legendary"] = get_text_as_int(nodebaseLegendary)

	mi.ITEM_LABORBasePrice["common"] = get_text_as_int(nodelaborCommon)
	mi.ITEM_LABORBasePrice["uncommon"] = get_text_as_int(nodelaborUncommon)
	mi.ITEM_LABORBasePrice["rare"] = get_text_as_int(nodelaborRare)
	mi.ITEM_LABORBasePrice["very rare"] = get_text_as_int(nodelaborVeryRare)
	mi.ITEM_LABORBasePrice["legendary"] = get_text_as_int(nodelaborLegendary)

	mi.ITEM_My_Price_Modifier_Rarity["common"] = get_text_as_float(nodemodiCommon)
	mi.ITEM_My_Price_Modifier_Rarity["uncommon"] = get_text_as_float(nodemodiUncommon)
	mi.ITEM_My_Price_Modifier_Rarity["rare"] = get_text_as_float(nodemodiRare)
	mi.ITEM_My_Price_Modifier_Rarity["very rare"] = get_text_as_float(nodemodiVeryRare)
	mi.ITEM_My_Price_Modifier_Rarity["legendary"] = get_text_as_float(nodemodiLegendary)

	mi.ITEM_USESBasePartsMinor["single"] = get_text_as_int(nodesingleMinorParts)
	mi.ITEM_USESBasePartsMinor["limited"] = get_text_as_int(nodelimitedMinorParts)
	mi.ITEM_USESBasePartsMinor["charged"] = get_text_as_int(nodechargedMinorParts)
	mi.ITEM_USESBasePartsMinor["permanent"] = get_text_as_int(nodeunlimitedMinorParts)

	mi.ITEM_USESBasePartsMajor["single"] = get_text_as_int(nodesingleMajorParts)
	mi.ITEM_USESBasePartsMajor["limited"] = get_text_as_int(nodelimitedMajorParts)
	mi.ITEM_USESBasePartsMajor["charged"] = get_text_as_int(nodechargedMajorParts)
	mi.ITEM_USESBasePartsMajor["permanent"] = get_text_as_int(nodeunlimitedMajorParts)

	mi.ITEM_My_Price_Modifier_Power["minor"] = get_text_as_float(nodemodMinor)
	mi.ITEM_My_Price_Modifier_Power["major"] = get_text_as_float(nodemodMajor)
	mi.ITEM_My_Price_Modifier_Uses["single"] = get_text_as_float(nodemodSingle)
	mi.ITEM_My_Price_Modifier_Uses["limited"] = get_text_as_float(nodemodLimit)
	mi.ITEM_My_Price_Modifier_Uses["charged"] = get_text_as_float(nodemodCharged)
	mi.ITEM_My_Price_Modifier_Uses["permanent"] = get_text_as_float(nodemodUnlimited)
	
	mi.ITEM_My_Price_Modifier_Special["attument_req"] = get_text_as_float(nodemodAttunement)
	mi.ITEM_My_Price_Modifier_Special["cursed"] = get_text_as_float(nodemodCursed)
	
	mi.ITEM_TYPES_Price_Modifier["weapon"]= get_text_as_float(nodeWeapon)
	mi.ITEM_TYPES_Price_Modifier["armor"] = get_text_as_float(nodemodArmor)
	mi.ITEM_TYPES_Price_Modifier["potion"] = get_text_as_float(nodemodPotion)
	mi.ITEM_TYPES_Price_Modifier["ring"] = get_text_as_float(nodemodRing)
	mi.ITEM_TYPES_Price_Modifier["rod"] = get_text_as_float(nodemodRod)
	mi.ITEM_TYPES_Price_Modifier["scroll"] = get_text_as_float(nodemodScroll)
	mi.ITEM_TYPES_Price_Modifier["staff"] = get_text_as_float(nodemodStaff)
	mi.ITEM_TYPES_Price_Modifier["wand"] = get_text_as_float(nodemodWand)
	mi.ITEM_TYPES_Price_Modifier["wondrous item"] = get_text_as_float(nodemodWanderousItem)

func get_text_as_int(n : Node) -> int:
	if n.text.is_valid_integer():
		n.modulate=Color(1,1,1)
		return n.text as int
	n.modulate=Color(1,0,0)
	_daten_alle_ok=false
	return 1

func get_text_as_float(n : Node) -> float:
	if n.text.is_valid_float():
		n.modulate=Color(1,1,1)
		return n.text as float
	n.modulate=Color(1,0,0)
	_daten_alle_ok=false
	return 1.0

#OK Button
func _on_Button_pressed():
	_daten_alle_ok=true
	getData()
	if _daten_alle_ok:
		emit_signal("ok_pressed")
		get_parent().remove_child(self)

#Chancel Button
func _on_Button2_pressed():
	get_parent().remove_child(self)
