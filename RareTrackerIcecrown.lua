-- Get an object we can use for the localization of the addon.
local L = LibStub("AceLocale-3.0"):GetLocale("RareTracker", true)

-- Link drill codes to their respective entities.
local zone_announcing_rares = {
    [L[174067]] = 174067, -- Noth the Plaguebringer
    [L[174066]] = 174066, -- Patchwerk
    [L[174065]] = 174065, -- Blood Queen Lana'thel
    [L[174064]] = 174064, -- Professor Putricide
    [L[174063]] = 174063, -- Lady Deathwhisper
    [L[174062]] = 174062, -- Skadi the Ruthless
    [L[174061]] = 174061, -- Ingvar the Plunderer
    [L[174060]] = 174060, -- Prince Keleseth
    [L[174059]] = 174059, -- the Black Knight
    [L[174058]] = 174058, -- Bronjahm <Godfather of Souls>
    [L[174057]] = 174057, -- Scourgelord Tyrannus
    [L[174056]] = 174056, -- Forgemaster Garfrost
    [L[174055]] = 174055, -- Marwyn
    [L[174054]] = 174054, -- Falric
    [L[174053]] = 174053, -- The Prophet Tharon'ja
    [L[174052]] = 174052, -- Novos the Summoner
    [L[174051]] = 174051, -- Trollgore
    [L[174050]] = 174050, -- Krik'thir the Gatewatcher
    [L[174049]] = 174049, -- Prince Taldaram
    [L[174048]] = 174048, -- Elder Nadox
}

-- Register the data for the target zone.
RareTracker.RegisterRaresForModule({
    -- Define the zone(s) in which the rares are present.
    ["target_zones"] = {118},
    ["zone_name"] = "Icecrown",
    ["plugin_name"] = "Icecrown (Death's Rising Event)",
    ["plugin_name_abbreviation"] = "Icecrown",
    ["entities"] = {
        --npc_id = {L[name], quest_id, {coordinates}}
        [174065] = {"1. "..L[174065], 62343, {49.7, 32.7}}, -- "Blood Queen Lana'thel"
        [174064] = {"2. "..L[174064], 62342, {57.1, 30.3}}, -- "Professor Putricide"
        [174063] = {"3. "..L[174063], 62341, {51.1, 78.5}}, -- "Lady Deathwhisper"
        [174062] = {"4. "..L[174062], 62340, {57.8, 56.1}}, -- "Skadi the Ruthless"
        [174061] = {"5. "..L[174061], 62339, {52.4, 52.6}}, -- "Ingvar the Plunderer"
        [174060] = {"6. "..L[174060], 62338, {54.0, 44.7}}, -- "Prince Keleseth"
        [174059] = {"7. "..L[174059], 62337, {64.8, 22.1}}, -- "The Black Knight"
        [174058] = {"8. "..L[174058], 62336, {70.7, 38.4}}, -- "Bronjahm"
        [174057] = {"9. "..L[174057], 62335, {47.2, 66.1}}, -- "Scourgelord Tyrannus"
        [174056] = {"10. "..L[174056], 62334, {58.6, 72.5}}, -- "Forgemaster Garfrost"
        [174055] = {"11. "..L[174055], 62333, {58.2, 83.4}}, -- "Marwyn"
        [174054] = {"12. "..L[174054], 62332, {50.2, 87.9}}, -- "Falric"
        [174053] = {"13. "..L[174053], 62331, {80.1, 61.2}}, -- "The Prophet Tharon'ja"
        [174052] = {"14. "..L[174052], 62330, {77.8, 66.1}}, -- "Novos the Summoner"
        [174051] = {"15. "..L[174051], 62329, {58.3, 39.4}}, -- "Trollgore"
        [174050] = {"16. "..L[174050], 62328, {67.5, 58.0}}, -- "Krik'thir the Gatewatcher"
        [174049] = {"17. "..L[174049], 62327, {29.6, 62.2}}, -- "Prince Taldaram"
        [174048] = {"18. "..L[174048], 62326, {44.2, 49.1}}, -- "Elder Nadox"
        [174067] = {"19. "..L[174067], 62345, {31.6, 70.5}}, -- "Noth the Plaguebringer"
        [174066] = {"20. "..L[174066], 62344, {36.5, 67.4}}, -- "Patchwerk"
    },
    ["FindMatchForText"] = function(self, text)
        -- Check if any of the drill rig designations is contained in the broadcast text.
        for designation, npc_id in pairs(zone_announcing_rares) do
            if text:find(designation) then
                self:ProcessEntityAlive(npc_id, npc_id, nil, nil, false)
                return
            end
        end
    end,
    ["rare_order"] = {
        174065, 174064, 174063, 174062, 174061, 174060, 174059, 174058, 174057, 174056, 
        174055, 174054, 174053, 174052, 174051, 174050, 174049, 174048, 174067, 174066
    }
})                  