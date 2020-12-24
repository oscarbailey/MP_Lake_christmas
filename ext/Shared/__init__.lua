
require("__shared/_CONFIG")

local AddBoats = require('__shared/addBoats')
local ModifyCapturePoints = require('__shared/modifyCapturePoints')

Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)
	print("Loading resources")
	local levelDestroyEvent = Events:Subscribe('Level:Destroy', OnLevelDestroy)

	-- Don't do anything if the wrong level/gamemode is loaded
	if levelName ~= "Levels/MP_Subway/MP_Subway" or gameMode ~= "ConquestSmall0" then
		levelDestroyEvent:Unsubscribe()
		return
	end

	-- Mount boat bundles and add 2 boat spawns to the conquest logic
	AddBoats()

	-- Change flag positions
	ModifyCapturePoints()
end)

-- Deregistering, uninstalling and uninstalling in case the next level isn't MP_Subway
function OnLevelDestroy()

    -- entityResourceEvent:Unsubscribe()
    -- bundleMounterEvent:Unsubscribe()
	-- bundleHook:Uninstall()
    -- subWorldDataCallback:Deregister()
    -- cpBlueprintCallback:Deregister()

	subWorldDataCallback = nil
	entityResourceEvent = nil
	cpBlueprintCallback = nil
	bundleHook = nil

end

-- Integrated night-mode - not working...

-- Events:Subscribe('Level:Loaded', function(levelName, gameMode)
-- 	-- Yoinked from the night-time mod - Thanks Reirei!
-- 	print("Level loaded, switching to night mode...")
-- 	if levelName == "Levels/MP_Subway/MP_Subway" and gameMode == "ConquestSmall0" then
-- 		print("Map is MP_Lake_christmas...")
-- 		EntityManager:TraverseAllEntities(function(instance)
-- 			if instance:Is('OutdoorLightComponentData') then
-- 				local outdoor = OutdoorLightComponentData(instance)
-- 				outdoor:MakeWritable()

-- 				outdoor.sunColor = Vec3(0.01, 0.01, 0.01)
-- 				outdoor.skyColor = Vec3(0.01, 0.01, 0.01)
-- 				outdoor.groundColor = Vec3(0, 0, 0)

-- 				outdoor.skyEnvmapShadowScale = 0.5
-- 			end

-- 			if instance:Is('SkyComponentData') then
-- 				local sky = SkyComponentData(instance)
-- 				sky:MakeWritable()

-- 				sky.brightnessScale = 0.01
-- 				sky.sunSize = 0.01
-- 				sky.sunScale = 1

-- 				sky.cloudLayer1SunLightIntensity = 0.01
-- 				sky.cloudLayer1SunLightPower = 0.01
-- 				sky.cloudLayer1AmbientLightIntensity = 0.01

-- 				sky.cloudLayer2SunLightIntensity = 0.01
-- 				sky.cloudLayer2SunLightPower = 0.01
-- 				sky.cloudLayer2AmbientLightIntensity = 0.01

-- 				sky.staticEnvmapScale = 0.1
-- 				sky.skyEnvmap8BitTexScale = 0.8

-- 				if sky.partition.name:match('mp_subway') or sky.partition.name:match('mp_011') then
-- 					sky.staticEnvmapScale = 0.01
-- 				end

-- 				if sky.partition.name:match('mp_subway_subway') then
-- 					sky.staticEnvmapScale = 0.1

-- 					ResourceManager:RegisterInstanceLoadHandlerOnce(Guid('36536A99-7BE3-11E0-8611-A913E18AE9A4'), Guid('64EE680C-405E-2E81-E327-6DF58605AB0B'), function(loadedInstance)
-- 						sky.staticEnvmapTexture = TextureAsset(loadedInstance)
-- 					end)
-- 				end
-- 			end

-- 			if instance:Is('FogComponentData') then
-- 				local fog = FogComponentData(instance)
-- 				fog:MakeWritable()

-- 				fog.fogColor = Vec3(0.1, 0.1, 0.1)
-- 			end

-- 			if instance:Is('TonemapComponentData') then
-- 				local tonemap = TonemapComponentData(instance)
-- 				tonemap:MakeWritable()

-- 				tonemap.maxExposure = 4
-- 				tonemap.middleGray = 0.02
-- 			end

-- 			if instance:Is('EnlightenComponentData') then
-- 				local enlighten = EnlightenComponentData(instance)
-- 				enlighten:MakeWritable()

-- 				enlighten.enable = false
-- 			end

-- 			if instance:Is('SunFlareComponentData') then
-- 				local flare = SunFlareComponentData(instance)
-- 				flare:MakeWritable()

-- 				flare.excluded = true
-- 			end
-- 		end)
-- 	end
-- end)
