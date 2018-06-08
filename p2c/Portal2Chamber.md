This type of file goes to portal 2's custom chamber builder. As it turns out, the format isn't just compiled, it has a json-like markup that one can edit!
Because all objects in portal 2 have similar properties, they can all be altered in realy different ways!      
There's allot of information here, so I will explain what each thing does:
```json
"Item"
		{
			"Index"		"7" //Item number; This is required.
			"Type"		"ITEM_TURRET"
			"Deletable"		"1" //You can lock out deletion through this bool
			"VoxelPos"		"4 5 0" 
			"LocalPos"		"0 0 0"
			"Angles"		"0 0 0"
			"Facing"		"-0 -95 0"
			"ConnectionVisiblity"		"0"
		}
```
##VoxelPos:
to understand this:
1.Look top down
2.have the entrance face right
3.have the exit face left

Each number is zero-based:
First number:


//"0 0 45"