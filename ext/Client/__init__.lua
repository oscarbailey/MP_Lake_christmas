-- Set redzone minimap texture to nil for both teams
ResourceManager:RegisterInstanceLoadHandler(Guid('601776CA-D1A8-432D-9F86-26BFF9E0EFB3B'), Guid('EA634590-B1EA-4056-8299-21EAF40D3520'), function(instance)
    if levelName ~= "Levels/MP_Subway/MP_Subway" or gameMode ~= "ConquestSmall0" then
		local caAsset = VeniceUICombatAreaAsset(instance)
		caAsset:MakeWritable()
		caAsset.distanceField = nil
		caAsset.surroundingDistanceField = nil
	end
end)

ResourceManager:RegisterInstanceLoadHandler(Guid('65214F82-8127-4ECD-B614-BF3B35C97787'), Guid('B8A18593-D1F7-4794-B96C-B349F3AC6459'), function(instance)
    if levelName ~= "Levels/MP_Subway/MP_Subway" or gameMode ~= "ConquestSmall0" then
		local caAsset = VeniceUICombatAreaAsset(instance)
		caAsset:MakeWritable()
		caAsset.distanceField = nil
		caAsset.surroundingDistanceField = nil
	end
end)

-- Change flag names
ResourceManager:RegisterInstanceLoadHandler(Guid("0964415F-1A6E-4BA3-A11D-EEDDF2DB9FD2"), Guid('184EB6A9-E532-8D64-0AC2-551AD903FF96'), function(instance)
    if levelName ~= "Levels/MP_Subway/MP_Subway" or gameMode ~= "ConquestSmall0" then
		instance = InterfaceDescriptorData (instance)
		instance:MakeWritable()
		DataField(instance.fields[15]).value = 'CString "CRIMEA"'
		DataField(instance.fields[17]).value = 'CString "BAGUETTE"'
		DataField(instance.fields[18]).value = 'CString "PLAYGROUND"'
	end
end)

-- Global var for storing the current light entity
light_entity = nil

function AddLight(trans, color)
	local entityData = PointLightEntityData()
	entityData.color = color
	entityData.radius = 100.0
	entityData.intensity = 1.0
	entityData.visible = true
	entityData.enlightenEnable = true

	local entityPos = LinearTransform()
	entityPos.trans = trans

	local createdEntity	= EntityManager:CreateEntity(entityData, entityPos)

	print("Created light @ ")
	print(entityPos.trans)

	if createdEntity ~= nil then
		print("initialising light")
		createdEntity:Init(Realm.Realm_ClientAndServer, true)
		if light_entity ~= nil then
			light_entity:Destroy()
		end
		light_entity = createdEntity
		print("light initialised")
	else
		print("Created Entity was nil!")
	end
end

function AddChristmasLights()
    -- Add all the christmas lights to MP_Lake
    local red = Vec3(1.0, 0.0, 0.0)
    local green = Vec3(0.0, 1.0, 0.0)

	AddLight(Vec3(-33.717659, 70.0, 168.997116), red)
    AddLight(Vec3(-33.717659, 70.0, 168.997116), green)
end

Events:Subscribe('Level:Loaded', function(levelName, gameMode)
	if levelName == "Levels/MP_Subway/MP_Subway" and gameMode == "ConquestSmall0" then
		print("Adding christmas lights...")
		AddChristmasLights()
	end
end)

Hooks:Install('BulletEntity:Collision', 1, function(hook, entity, hit, shooter)
	-- Do stuff here.
    local green = Vec3(0.0, 1.0, 0.0)
	AddLight(hit.position, green)
	print(hit.position)
end)

-- NetEvents:Subscribe('LightSetX', light_entity, function(data)
-- 	if light_entity ~= nil then
-- 		print(data)
-- 		light_entity.transform.pos.trans.x = parseFloat(data)
-- 	end
-- end)

-- NetEvents:Subscribe('LightSetY', light_entity, function(data)
-- 	if light_entity ~= nil then
-- 		print(data)
-- 		light_entity.transform.pos.trans.x = parseFloat(data)
-- 	end
-- end)

-- NetEvents:Subscribe('LightSetZ', light_entity, function(data)
-- 	if light_entity ~= nil then
-- 		print(data)
-- 		light_entity.transform.pos.trans.x = parseFloat(data)
-- 	end
-- end)
