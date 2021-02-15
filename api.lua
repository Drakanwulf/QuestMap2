local lib = LibLoadMapsZonesQuests
local linkto = lib.linkto
local logger = linkto.logger

--[[-------------------------------------------------------------------------------------------------------------------------------
MapTables public API function definitions. MapTables does not duplicate any of the game API functions listed below:

The game API documentation defines these Map Index API functions.
	* GetCyrodiilMapIndex()
	* GetImperialCityMapIndex()
	* GetMapNameByIndex(*luaindex* _mapIndex_)
	* GetAutoMapNavigationCommonZoomOutMapIndex()

The game API documentation defines these Map Identifer API functions.
	* GetMapNumTilesForMapId(*integer* _mapId_)
	* GetMapTileTextureForMapId(*integer* _mapId_, *luaindex* _tileIndex_)

The game API documentation defines these functions for getting the identifier, index, and/or name values from the current Map. 
	* GetCurrentMapIndex()
	* GetCurrentMapId()
	* GetCurrentMapZoneIndex()
	* GetCurrentSubZonePOIIndices()
	* GetMapName()
	* GetMapType()
	* GetMapContentType()
	* GetMapFilterType()

MapTables uses the "SetMapToMapListIndex()" game API function to traverse game Maps by their Map Indexes.
---------------------------------------------------------------------------------------------------------------------------------]]

-- Get the content type for this map
function MapTables:GetContentType( mapIndex: number )
	return infoByIndex[mapIndex].content or nil
end

-- Get the global x,y coordinates for this Map
function MapTables:GetCoord( mapIndex: number )
	return coordByIndex[mapIndex][1] or nil, coordByIndex[mapIndex][2] or nil
end

-- Get the Map Identifier for this Map Index
function MapTables:GetIdByIndex( mapIndex: number )
	return mapIdByIndex[mapIndex] or nil
end

-- Get the Map Identifier for this Map Name
function MapTables:GetIdByName( mapName: string )
	return mapIdByName[mapName] or nil
end

-- Get the Map Index for this Map Name
function MapTables:GetIndex( mapName: string )
	return indexByName[mapName] or nil
end

-- Get the Map Index for this Map Identifier
function MapTables:GetIndexById( mapId: number )
	return indexById[mapId] or nil
end

-- Get the map type for this Map
function MapTables:GetMapType( mapIndex: number )
	return infoByIndex[mapIndex].mapType or nil
end

-- Get the Map Name for this Map Identifier
function MapTables:GetNameById( mapId: number )
	return nameById[mapId] or nil
end

-- Get the equivalent Zone Identifier for this Map
function MapTables:GetZoneId( mapIndex: number )
	return zoneIdByIndex[mapIndex] or nil
end

--[[-------------------------------------------------------------------------------------------------------------------------------
And the last thing we do in this add-on is to wait for ESO to notify us that our add-on modules and support add-ons (i.e. libraries) have been loaded.
---------------------------------------------------------------------------------------------------------------------------------]]
EVENT_MANAGER:RegisterForEvent( ADDON_NAME, EVENT_ADD_ON_LOADED, OnAddonLoaded )
