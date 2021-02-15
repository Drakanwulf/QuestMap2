local LIB_NAME = "LibLoadMapsZonesQuests"

assert(not _G[LIB_NAME], LIB_NAME .. " is already loaded")

local lib = {}
_G[LIB_NAME] = lib

lib.linkto = {
    module = {},
    logger = LibDebugLogger(LIB_NAME),
    chat = LibChatMessage(LIB_NAME, "LMAP"),
    }
    
    function lib.linkto:InitSaveData()
    local savedata = LIB_NAME '+' "_Data"

    if(not savedata or savedata.version ~= VERSION or savedata.apiVersion ~= GetAPIVersion()) then
        self.logger:Info("Creating new savedata file")
        saveData = {
            version = VERSION,
            apiVersion = GetAPIVersion(),
            maptables = {},
            zonetables = (),
            questtables = {}
        }
        
        self.savedata = savedata
    end
    

}

    
--[[###############################################################################################################################

MapTables - A standalone support add-on to create and maintain Map tables
	by Drakanwulf and Hawkeye1889

A standalone support add-on to create and initialize or to retrieve and update Map information for all accounts and characters on 
any game megaserver.

WARNING: This add-on is a standalone library. Do NOT embed its folder within any other add-on!

###############################################################################################################################--]]

--[[-------------------------------------------------------------------------------------------------------------------------------
Local variables shared by multiple functions within this add-on.
---------------------------------------------------------------------------------------------------------------------------------]]
local ADDON_NAME = "MapTables"			-- The name of this add-on
local addon = {}						-- Every add-on control entry begins as an empty table

--[[-------------------------------------------------------------------------------------------------------------------------------
Bootstrap code to load this add-on.
---------------------------------------------------------------------------------------------------------------------------------]]
assert( not _G[ADDON_NAME], ADDON_NAME.. ": This add-on is already loaded. Do NOT load it multiple times!" )
 
_G[ADDON_NAME] = addon
assert( _G[ADDON_NAME], ADDON_NAME.. ": the game failed to create a control entry!" )

