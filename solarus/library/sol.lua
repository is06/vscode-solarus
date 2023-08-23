---@meta

---@class Solarus
sol = {}

---Contains general features and utility functions that are global to the execution of the program, no matter if a game or some menus are running.
---@class SolarusMain
sol.main = {

    ---Returns the current Solarus version.
    ---@return string version The Solarus version
    get_solarus_version = function() end,

    ---Returns the version of the currently running quest as specified in the Quest Properties file.
    ---@return string version The Quest version
    get_quest_version = function() end,
    
    get_quest_format = function() end,
    
    load_file = function(script_name) end,

    do_file = function(script_name) end,

    reset = function() end,

    exit = function() end,

    ---Returns the simulated time elapsed since Solarus was started.
    ---This corresponds to real time, unless the system is too slow to play at normal speed.
    ---@return number elapsed_time The number of simulated milliseconds elapsed since the beginning of the program.
    get_elapsed_time = function() end,

    get_quest_write_dir = function() end,

    set_quest_write_dir = function(quest_write_dir) end,

    load_settings = function() end,

    save_settings = function() end,

    get_distance = function(x1, y1, x2, y2) end,

    get_angle = function(x1, y1, x2, y2) end,

    get_resource_ids = function(resource_type) end,

    resource_exists = function(resource_type, id) end,

    get_resource_description = function(resource_type, id) end,

    add_resource = function(resource_type, id, description) end,

    remove_resource = function(resource_type, id) end,

    get_type = function(value) end,

    get_metatable = function(type_name) end,

    get_os = function() end,

    ---Returns the current game if a game is running.
    ---@return SolarusGame|nil game The game currently running, or nil if no game is running.
    get_game = function() end,

    ---Called at the beginning of the program.
    on_started = function() end,

    on_finished = function() end,

    on_update = function() end,

    on_draw = function() end,
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
---@return string type The type of this entity. Can be one of: "hero", "dynamic_tile", "teletransporter", "destination", "pickable", "destructible", "carried_object", "chest", "shop_treasure", "enemy", "npc", "block", "jumper", "switch", "sensor", "separator", "wall", "crystal", "crystal_block", "stream", "door", "stairs", "bomb", "explosion", "fire", "arrow", "hookshot", "boomerang" or "custom_entity".
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
