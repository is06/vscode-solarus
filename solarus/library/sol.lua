---@meta

---@class Solarus
sol = {}

---@alias SolarusResourceType "enemy"|"entity"|"font"|"item"|"language"|"map"|"music"|"shader"|"sound"|"sprite"|"tileset"
---@alias SolarusEntityType "hero"|"dynamic_tile"|"teletransporter"|"destination"|"pickable"|"destructible"|"carried_object"|"chest"|"shop_treasure"|"enemy"|"npc"|"block"|"jumper"|"switch"|"sensor"|"separator"|"wall"|"crystal"|"crystal_block"|"stream"|"door"|"stairs"|"bomb"|"explosion"|"fire"|"arrow"|"hookshot"|"boomerang"|"custom_entity"

---Contains general features and utility functions that are global to the execution of the program, no matter if a game or some menus are running.
---@class SolarusMain
sol.main = {

    ---Returns the current Solarus version.
    ---@return string version The Solarus version
    get_solarus_version = function() end,

    ---Returns the version of the currently running quest as specified in the Quest Properties file.
    ---@return string|nil version The Quest version
    get_quest_version = function() end,

    ---Returns the Solarus compatibility format of this quest.
    ---This corresponds to a version of Solarus with major and minor version numbers (no patch number), for example "1.5".
    ---@return string format The format of this quest.
    get_quest_format = function() end,

    ---Loads a Lua file (but does not run it).
    ---This function is a replacement to the usual Lua function loadfile(). The difference is that it looks for a file in the quest tree (which may be a directory or an archive) and also in the quest write directory. The quest write directory is tried first.
    ---@param script_name string Name of the Lua file to load (with or without extension), relative to the data directory or the write directory of your quest.
    ---@return function|nil chunk A function representing the chunk loaded, or nil if the file does not exist or could not be loaded as Lua.
    load_file = function(script_name) end,

    ---Loads and runs a Lua file into the current context.
    ---This function is a replacement to the usual Lua function dofile(). The difference is that it looks for a file in the quest tree (which may be a directory or an archive) and also in the quest write directory. The quest write directory is tried first. The file must exist.
    ---Use sol.main.load_file() explicitly if you need to check the existence of the file or to use parameters and return values.
    ---@param script_name string Name of the Lua file to load (with or without extension), relative to the data directory or the write directory of your quest.
    do_file = function(script_name) end,

    ---Resets the whole program after the current cycle. Lua will be entirely shut down and then initialized again.
    reset = function() end,

    ---Exits the program after the current cycle.
    exit = function() end,

    ---Returns the simulated time elapsed since Solarus was started.
    ---This corresponds to real time, unless the system is too slow to play at normal speed.
    ---@return number elapsed_time The number of simulated milliseconds elapsed since the beginning of the program.
    get_elapsed_time = function() end,

    ---Returns the subdirectory where files specific to the quest are saved, like savegames and settings. The quest write directory is specified in your quest.dat file and may be changed dynamically with sol.main.set_quest_write_dir().
    ---@return string|nil write_dir The quest write directory, relative to the Solarus write directory, or nil if it was not set.
    get_quest_write_dir = function() end,

    ---Changes the subdirectory where files specific to the quest are saved, like savegames and settings. Note that the quest write directory can already be specified in your quest.dat file. You usually don't have to call this function, unless you need to change it dynamically for some reason.
    ---@param quest_write_dir string|nil The quest write directory, relative to the Solarus write directory, or nil to unset it.
    set_quest_write_dir = function(quest_write_dir) end,

    ---Loads and applies the built-in settings from a file previously saved with sol.main.save_settings(). Settings from the file include user preferences such as the language, the video mode and the audio volume.
    ---Note that all these settings can already be modified individually with the Lua API, so you can either use this function or implement something more fitted to your needs.
    ---A valid quest write directory must be set (in your quest.dat file or by calling sol.main.set_quest_write_dir()), otherwise this function generates a Lua error.
    ---@param file_name string?
    ---@return boolean success true if settings were successfully loaded and applied.
    load_settings = function(file_name) end,

    ---Saves the current built-in settings into a file. This file can be reloaded later with sol.main.load_settings() to restore the saved settings. Settings saved include user preferences such as the current language, the current video mode and the current audio volume.
    ---Note that all these settings can already be modified individually with the Lua API, so you can either use this function or implement something more fitted to your needs.
    ---A valid quest write directory must be set (in your quest.dat file or by calling sol.main.set_quest_write_dir()), otherwise this function generates a Lua error.
    ---@param file_name string?
    ---@return boolean success true if settings were successfully saved.
    save_settings = function(file_name) end,

    ---Utility function that computes the distance in pixels between two points.
    ---@param x1 number X coordinate of the first point.
    ---@param y1 number Y coordinate of the first point.
    ---@param x2 number X coordinate of the second point.
    ---@param y2 number Y coordinate of the second point.
    ---@return number distance The distance in pixels.
    get_distance = function(x1, y1, x2, y2) end,

    ---Utility function that computes the angle in radians between the X axis and the specified vector.
    ---@param x1 number X coordinate of the first point.
    ---@param y1 number Y coordinate of the first point.
    ---@param x2 number X coordinate of the second point.
    ---@param y2 number Y coordinate of the second point.
    ---@return number angle The angle in radians between the x axis and this vector.
    get_angle = function(x1, y1, x2, y2) end,

    ---Returns an array of all resource elements ids of the given type declared in the quest database.
    ---@param resource_type SolarusResourceType Name of a resource type.
    ---@return table resource_ids An array of all elements of this resource type declared in the quest. This is a standard Lua array (the first index is 1), and values are all strings.
    get_resource_ids = function(resource_type) end,

    ---Returns whether a resource element with the specified id is declared in the quest database. This does not check if the corresponding files can be found and are actually valid: it only tells whether the element is declared in the quest database.
    ---@param resource_type SolarusResourceType Name of a resource type.
    ---@param id string Id of the element to test.
    ---@return boolean exists true if such an element is declared in the quest database.
    resource_exists = function(resource_type, id) end,

    ---Returns the description of a resource element as declared in the quest database.
    ---@param resource_type SolarusResourceType Name of a resource type
    ---@param id string Id of the element to get.
    ---@return string|nil description The description of this element or nil if the element has no description.
    get_resource_description = function(resource_type, id) end,

    ---Adds the declaration of a new resource element in the quest database.
    ---This does not create any file but just registers an element in the quest database.
    ---@param resource_type SolarusResourceType Name of a resource type.
    ---@param id string Id of the element to add.
    ---@param description string? Description to set.
    add_resource = function(resource_type, id, description) end,

    ---Removes the declaration of a resource element in the quest database.
    ---This does not delete any file but just unregisters an element in the quest database.
    ---@param resource_type SolarusResourceType Name of a resource type.
    ---@param id string Id of the element to remove.
    remove_resource = function(resource_type, id) end,

    ---Returns the type name of a value.
    ---This function is similar to the standard Lua function type(), except that for userdata known by Solarus, it returns the exact Solarus type name.
    ---@param value any Any value or nil.
    ---@return string type The name of the type.
    get_type = function(value) end,

    ---Returns the metatable of a Solarus userdata type.
    ---@param type_name string Name of a Solarus userdata Lua type
    ---@return table|nil metatable The metatable of this type, or nil if there is no such Solarus type.
    get_metatable = function(type_name) end,

    ---Returns the name of the running OS.
    ---Possible values are : "Windows", "Mac OS X", "Linux", "iOS", "Android".
    ---If the correct OS name is not available, returns a string beginning with the text "Unknown".
    ---@return string os_name The name of the running OS.
    get_os = function() end,

    ---Returns the current game if a game is running.
    ---@return SolarusGame|nil game The game currently running, or nil if no game is running.
    get_game = function() end,
}

---@class SolarusAudio
sol.audio = {

    ---Plays a sound effect.
    ---Generates a Lua error if the sound does not exist.
    ---Several sounds can be played in parallel. In the current version, a sound cannot be interrupted after you start playing it.
    ---Unlike musics, sounds files are entirely read before being played. A file access is made only the first time you play each sound. You can use sol.audio.preload_sounds() if you want to also avoid this initial file access.
    ---@param sound_id string Name of the sound file to play, relative to the sounds directory and without extension. Currently, .ogg is the only extension supported.
    play_sound = function(sound_id) end,

    preload_sounds = function() end,

    play_music = function(music_id, action) end,

    get_music = function() end,

    stop_music = function() end,

    get_sound_volume = function() end,

    set_sound_volume = function(volume) end,

    get_music_volume = function() end,

    set_music_volume = function(volume) end,

    get_music_format = function() end,

    get_music_num_channels = function() end,

    get_music_channel_volume = function(channel) end,

    set_music_channel_volume = function(channel, volume) end,

    get_tempo = function() end,

    set_tempo = function(tempo) end,
}

---@class SolarusEntity

---All entities have a position on the map (X, Y and layer) and a size. Depending on their type, they can be visible or not. When they are visible, they are usually represented by one or several sprites. Some entities are fixed, others move according to a movement object.
---Entities can also have a name that uniquely identifies them on the map. This is useful to access them from the map API. The name is optional, but if an entity has a name, it must be unique on the map.
local entity = {}
---Returns the type of entity.
---@return string type The type of this entity.
function entity.get_type() end

---@class SolarusGame
sol.game = {

    exists = function(file_name) end,
    delete = function(file_name) end,
    load = function(file_name) end,

    save = function() end,
    start = function() end,
    is_started = function() end,
    is_suspended = function() end,
    set_suspended = function(suspended) end,
    is_paused = function() end,
    set_paused = function(paused) end,
    is_pause_allowed = function() end,
    set_pause_allowed = function(pause_allowed) end,
    is_dialog_enabled = function() end,
    start_dialog = function(dialog_id, info, callback) end,
    stop_dialog = function(status) end,
}
