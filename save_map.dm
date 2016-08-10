dmm_suite{
	/*

		dmm_suite version 1.0
			Released January 30th, 2011.

		defines the object /dmm_suite
			- Provides the proc load_map()
				- Loads the specified map file onto the specified z-level.
			- provides the proc write_map()
				- Returns a text string of the map in dmm format
					ready for output to a file.
			- provides the proc save_map()
				- Returns a .dmm file if map is saved
				- Returns FALSE if map fails to save

		The dmm_suite provides saving and loading of map files in BYOND's native DMM map
		format. It approximates the map saving and loading processes of the Dream Maker
		and Dream Seeker programs so as to allow editing, saving, and loading of maps at
		runtime.

		------------------------

		To save a map at runtime, create an instance of /dmm_suite, and then call
		write_map(), which accepts three arguments:
			- A turf representing one corner of a three dimensional grid (Required).
			- Another turf representing the other corner of the same grid (Required).
			- Any, or a combination, of several bit flags (Optional, see documentation).

		The order in which the turfs are supplied does not matter, the /dmm_writer will
		determine the grid containing both, in much the same way as DM's block() function.
		write_map() will then return a string representing the saved map in dmm format;
		this string can then be saved to a file, or used for any other purose.

		------------------------

		To load a map at runtime, create an instance of /dmm_suite, and then call load_map(),
		which accepts two arguments:
			- A .dmm file to load (Required).
			- A number representing the z-level on which to start loading the map (Optional).

		The /dmm_suite will load the map file starting on the specified z-level. If no
		z-level	was specified, world.maxz will be increased so as to fit the map. Note
		that if you wish to load a map onto a z-level that already has objects on it,
		you will have to handle the removal of those objects. Otherwise the new map will
		simply load the new objects on top of the old ones.

		Also note that all type paths specified in the .dmm file must exist in the world's
		code, and that the /dmm_reader trusts that files to be loaded are in fact valid
		.dmm files. Errors in the .dmm format will cause runtime errors.

		*/

	verb/load_map(var/dmm_file as file, var/z_offset as num){
		// dmm_file: A .dmm file to load (Required).
		// z_offset: A number representing the z-level on which to start loading the map (Optional).
		}
	verb/write_map(var/turf/t1 as turf, var/turf/t2 as turf, var/flags as num){
		// t1: A turf representing one corner of a three dimensional grid (Required).
		// t2: Another turf representing the other corner of the same grid (Required).
		// flags: Any, or a combination, of several bit flags (Optional, see documentation).
		}

	// save_map is included as a legacy proc. Use write_map instead.
	verb/save_map(var/turf/t1 as turf, var/turf/t2 as turf, var/map_name as text, var/flags as num){
		// t1: A turf representing one corner of a three dimensional grid (Required).
		// t2: Another turf representing the other corner of the same grid (Required).
		// map_name: A valid name for the map to be saved, such as "castle" (Required).
		// flags: Any, or a combination, of several bit flags (Optional, see documentation).
		}
	}


mob/verb/save(var/map_name as text)
	/*
		The save() verb saves a map with name "[map_name].dmm".
		*/
	if((ckey(map_name) != lowertext(map_name)) || (!ckey(map_name)))
		usr << "The file name you supplied includes invalid characters, or is empty. Please supply a valid file name."
		return
	var/dmm_suite/D = new()
	var/turf/south_west_deep = locate(1,1,1)
	var/turf/north_east_shallow = locate(world.maxx,world.maxy,world.maxz)
	D.save_map(south_west_deep, north_east_shallow, map_name, flags = DMM_IGNORE_PLAYERS)
	usr << {"The file [map_name].dmm has been saved. It can be found in the same directly in which this library resides.\n\
 (Usually: C:\\Documents and Settings\\Your Name\\Application Data\\BYOND\\lib\\iainperegrine\\dmm_suite)"}


mob/verb/write()
	/*
		The write() verb creates a text string of the map in dmm format
			and displays it in the client's browser.
		*/
	var/dmm_suite/D = new()
	var/turf/south_west_deep = locate(1,1,1)
	var/turf/north_east_shallow = locate(world.maxx,world.maxy,world.maxz)
	var/map_text = D.write_map(south_west_deep, north_east_shallow, flags = DMM_IGNORE_PLAYERS)
	usr << browse("<pre>[map_text]</pre>")


mob/verb/load(var/dmm_map as file)
	/*
		The load() verb will ask a player for a dmm file (usually found in the demo
			directory) which it will then load, and transport the user to view it.
		*/
	//Test if dmm_map is a .dmm file.
	var/file_name = "[dmm_map]"
	var/file_extension = copytext(file_name,length(file_name)-2,0)
	if(file_extension != "dmm")
		usr << "Supplied file must be a .dmm file."
		return
	//Determine where the new .dmm file will be loaded.
	var/new_maxz = world.maxz+1
	//Instanciate a new dmm_suite object.
	var/dmm_suite/new_reader = new()
	//Call load_map() to load the map file.
	new_reader.load_map(dmm_map, new_maxz)
	//Transport the user to the new map's z level.
	src.z = new_maxz