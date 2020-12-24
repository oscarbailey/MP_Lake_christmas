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
-- light_entity = nil

function AddLight(trans, color, radius)
	-- Default radius to 30.0
	if radius == nil then
		radius = 30.0
	end

	local entityData = PointLightEntityData()
	entityData.color = color
	entityData.radius = radius
	entityData.intensity = 1.0
	entityData.visible = true
	entityData.enlightenEnable = true

	local entityPos = LinearTransform()
	entityPos.trans = trans

	local createdEntity	= EntityManager:CreateEntity(entityData, entityPos)

	if createdEntity ~= nil then
		createdEntity:Init(Realm.Realm_ClientAndServer, true)
	end
end

function AddChristmasLights()
    -- Add all the christmas lights to MP_Lake
    local red = Vec3(1.0, 0.0, 0.0)
    local green = Vec3(0.0, 1.0, 0.0)
    local purple = Vec3(1.0, 0.0, 1.0)
    local orange = Vec3(0.968, 0.568, 0.0)
    local yellow = Vec3(0.988, 0.968, 0.690)

	-- AddLight(Vec3(-33.717659, 70.0, 168.997116), red)
	-- AddLight(Vec3(-33.717659, 70.0, 168.997116), green)

	-- US Spawn to B
	AddLight(Vec3(13.822836, 72.109879, 262.835205), green)
	AddLight(Vec3(12.830958, 72.513092, 245.154816), red)
	AddLight(Vec3(8.808025, 73.000412, 229.757538), green)
	AddLight(Vec3(-0.702617, 72.388130, 217.554611), red)
	AddLight(Vec3(-11.696337, 72.727463, 205.978622), green)
	AddLight(Vec3(-21.137430, 73.437439, 194.654205), red)
	AddLight(Vec3(-28.209555, 74.296059, 181.481201), green)
	AddLight(Vec3(-34.283390, 74.609802, 168.666901), red)
	AddLight(Vec3(-41.998444, 74.238678, 157.269836), green)
	AddLight(Vec3(-44.126987, 73.409103, 140.346497), red)

	-- B
	local b_radius = 20
	AddLight(Vec3(-54.268570, 73.413254, 128.805008), green, b_radius)
	AddLight(Vec3(-58.428642, 73.413254, 131.263458), red, b_radius)
	AddLight(Vec3(-67.306259, 73.419785, 132.423508), green, b_radius)
	AddLight(Vec3(-73.796982, 73.419785, 129.034424), red, b_radius)
	AddLight(Vec3(-78.431915, 73.413254, 122.026657), green, b_radius)
	AddLight(Vec3(-78.516602, 73.419785, 115.442307), red, b_radius)
	AddLight(Vec3(-76.413589, 73.419785, 109.207581), green, b_radius)
	AddLight(Vec3(-71.350769, 73.465088, 104.492493), red, b_radius)
	AddLight(Vec3(-67.175751, 73.549988, 102.939751), green, b_radius)
	AddLight(Vec3(-58.475555, 73.413254, 104.270142), red, b_radius)
	AddLight(Vec3(-52.884651, 73.381790, 108.180557), green, b_radius)
	AddLight(Vec3(-49.333889, 73.389816, 113.453262), red, b_radius)
	AddLight(Vec3(-48.378761, 73.419785, 121.065689), green, b_radius)

	-- A to B
	AddLight(Vec3(7.804849, 68.858551, 157.876648), red)
	AddLight(Vec3(-18.581459, 71.874168, 150.146561), green)

	-- US Spawn - B Side
	AddLight(Vec3(77.200562, 69.166290, 309.763062), red)
	AddLight(Vec3(64.904144, 69.217880, 304.268616), green)
	AddLight(Vec3(54.561474, 69.310883, 296.720276), red)
	AddLight(Vec3(42.121239, 69.603592, 287.547058), green)
	AddLight(Vec3(28.085417, 70.256287, 277.656464), red)

	-- US Spawn - A Side
	AddLight(Vec3(95.442429, 69.115288, 297.808716), red)
	AddLight(Vec3(92.064362, 69.026276, 285.227783), green)
	AddLight(Vec3(84.938431, 69.213974, 271.392212), red)
	AddLight(Vec3(76.562164, 69.213974, 257.939301), green)
	AddLight(Vec3(67.413284, 69.369781, 242.147675), red)

	-- US Spawn Front
	AddLight(Vec3(47.677032, 69.525909, 250.169235), red)
	AddLight(Vec3(34.573799, 69.799210, 262.069397), red)

	-- US Spawn to A
	AddLight(Vec3(50.316460, 70.087990, 221.058502), red)
	AddLight(Vec3(55.931553, 70.101334, 219.001282), green)
	AddLight(Vec3(41.834259, 70.257942, 200.963745), red)
	AddLight(Vec3(46.958530, 70.302551, 197.636536), green)
	AddLight(Vec3(30.100836, 69.444000, 186.811646), red)
	AddLight(Vec3(35.440628, 69.614281, 182.494904), green)
	AddLight(Vec3(17.106184, 68.733940, 167.008301), red)
	AddLight(Vec3(22.091747, 68.750259, 163.957214), green)

	-- Christmas tree @ A
	-- Branch 0
	AddLight(Vec3(50.754440, 64.745041, 154.379639), yellow, 10)
	AddLight(Vec3(51.178131, 72.512459, 149.978088), yellow, 10)
	AddLight(Vec3(50.806820, 74.337975, 152.466156), yellow, 10)
	AddLight(Vec3(50.852509, 72.751694, 153.019470), yellow, 10)
	AddLight(Vec3(50.723289, 71.898026, 154.728378), yellow, 10)

	AddLight(Vec3(50.483940, 70.626862, 154.747406), yellow, 10)

	-- Branch 1
	AddLight(Vec3(50.483940, 70.626862, 154.747406), yellow, 10)
	AddLight(Vec3(48.622787, 75.345062, 152.986069), yellow, 10)
	AddLight(Vec3(47.129547, 71.604439, 152.570282), yellow, 10)
	AddLight(Vec3(47.129547, 71.604439, 152.570282), yellow, 10)
	AddLight(Vec3(47.129547, 71.604439, 152.570282), yellow, 10)
	AddLight(Vec3(47.129547, 71.604439, 152.570282), yellow, 10)
	AddLight(Vec3(47.129547, 71.604439, 152.570282), yellow, 10)

	-- Branch 2
	AddLight(Vec3(47.129547, 71.604439, 152.570282), yellow, 10)
	AddLight(Vec3(53.974022, 74.011200, 156.170898), yellow, 10)
	AddLight(Vec3(54.706543, 73.315018, 156.477142), yellow, 10)
	AddLight(Vec3(54.769981, 71.137741, 156.839417), yellow, 10)
	AddLight(Vec3(55.135796, 71.520782, 156.724731), yellow, 10)
	AddLight(Vec3(56.310471, 71.420006, 157.433014), yellow, 10)
	AddLight(Vec3(57.802406, 71.217743, 158.025665), yellow, 10)

	-- A to C
	AddLight(Vec3(5.147960, 69.031204, 143.526810), green)
	AddLight(Vec3(11.325241, 68.974800, 141.680267), green)
	AddLight(Vec3(-2.713033, 70.092590, 120.329956), green)
	AddLight(Vec3(3.988064, 70.092598, 118.428436), green)

	-- Parasols
	AddLight(Vec3(1.371307, 69.085770, 75.562454), purple)
	AddLight(Vec3(5.435713, 69.043304, 69.889252), purple)
	AddLight(Vec3(9.185656, 69.067352, 64.970810), purple)

	-- RU Spawn
	-- Near the blow-hole
	AddLight(Vec3(-129.355377, 76.610397, -113.352760), red)
	AddLight(Vec3(-140.502533, 76.610390, -112.421722), green)
	AddLight(Vec3(-131.902863, 79.324188, -127.026390), red)
	AddLight(Vec3(-134.386047, 73.547897, -101.065742), green)
	AddLight(Vec3(-130.557983, 73.547897, -93.580147), red)
	AddLight(Vec3(-118.799423, 73.547897, -94.425369), green)
	AddLight(Vec3(-109.443550, 73.584793, -101.255882), red)
	-- Blow hole to bandstand
	AddLight(Vec3(-96.534172, 73.748611, -99.307335), green)
	AddLight(Vec3(-101.811287, 73.748383, -93.621605), red)
	AddLight(Vec3(-89.359566, 74.000595, -83.806259), green)
	AddLight(Vec3(-84.455177, 74.056015, -87.695633), red)
	AddLight(Vec3(-79.236649, 74.155457, -83.478348), green)
	-- Bandstand
	AddLight(Vec3(-62.224052, 74.501991, -59.972984), yellow)
	AddLight(Vec3(-65.830551, 74.522003, -59.972366), yellow)
	AddLight(Vec3(-68.971542, 74.549248, -61.793980), yellow)
	AddLight(Vec3(-70.736671, 74.606293, -64.889168), yellow)
	AddLight(Vec3(-70.707840, 74.694344, -68.472389), yellow)
	AddLight(Vec3(-68.941750, 74.678192, -71.578094), yellow)
	AddLight(Vec3(-65.835480, 74.696228, -73.349014), yellow)
	AddLight(Vec3(-65.835480, 74.696228, -73.349014), yellow)
	AddLight(Vec3(-59.116623, 74.706802, -71.529488), yellow)
	AddLight(Vec3(-57.347553, 74.758400, -68.434479), yellow)
	AddLight(Vec3(-57.328079, 74.538132, -64.875771), yellow)
	AddLight(Vec3(-59.142944, 74.547394, -61.745064), yellow)
	AddLight(Vec3(-62.250416, 74.781952, -73.298492), yellow)
	-- Entrance to spawn
	AddLight(Vec3(-45.025703, 74.153473, -56.649681), green)
	AddLight(Vec3(-52.081039, 74.155457, -49.790520), red)
	-- Snipers nest
	AddLight(Vec3(-32.887131, 74.063629, -103.521576), red)

	-- Column bases, ideally we want spotlights here!
	-- AddLight(Vec3(-32.887131, 74.063629, -103.521576), yellow, 50)
	-- AddLight(Vec3(141.540771, 64.000977, -37.665493), yellow, 50)
	-- AddLight(Vec3(183.345840, 64.104370, -27.616882), yellow, 50)
	-- AddLight(Vec3(163.385910, 64.478424, -52.286278), yellow, 50)
	-- AddLight(Vec3(114.298874, 64.568954, -77.447487), yellow, 50)
	-- AddLight(Vec3(148.951050, 64.477737, -77.885033), yellow, 50)
	-- AddLight(Vec3(137.688385, 64.573196, -90.340370), yellow, 50)
	-- AddLight(Vec3(130.778229, 70.775276, -132.928101), yellow, 50)

	-- Parasols to RU Spawn
	AddLight(Vec3(12.660666, 68.415894, 12.566950), green)

	-- Near bridge near B
	AddLight(Vec3(-32.826939, 69.053413, 93.125023), red)
	AddLight(Vec3(-26.511152, 69.109421, 105.396622), green)
	AddLight(Vec3(-13.773732, 68.951981, 98.259125), red)
	AddLight(Vec3(-19.740715, 68.789818, 86.460434), green)

	-- Playground equipment at C
	AddLight(Vec3(-28.948292, 68.457802, -2.506631), yellow, 5)
	AddLight(Vec3(-29.897007, 68.999519, -1.026920), yellow, 5)

	-- Tops of cover at C
	AddLight(Vec3(-42.652374, 68.413513, -16.235489), yellow, 5)
	AddLight(Vec3(-40.552269, 68.515198, -17.684666), yellow, 5)
	AddLight(Vec3(-38.362625, 68.511719, -19.195614), yellow, 5)
	AddLight(Vec3(-36.218094, 68.536346, -20.675482), yellow, 5)
	AddLight(Vec3(-34.107300, 68.541306, -22.046932), yellow, 5)
	AddLight(Vec3(-32.658066, 68.510544, -19.946754), yellow, 5)
	AddLight(Vec3(-31.156143, 68.547554, -17.770206), yellow, 5)
	AddLight(Vec3(-29.695791, 68.524361, -15.653900), yellow, 5)
	AddLight(Vec3(-28.445234, 68.520981, -13.417957), yellow, 5)
	AddLight(Vec3(-30.403324, 68.524292, -12.066776), yellow, 5)

	-- Big tree near radar
	AddLight(Vec3(-66.942886, 75.428909, 36.836433), red)
	AddLight(Vec3(-63.512489, 75.428909, 26.510632), green)
	AddLight(Vec3(-66.529663, 75.428909, 15.811411), red)
	AddLight(Vec3(-75.194260, 75.428909, 9.264520), green)
	AddLight(Vec3(-92.085663, 75.428909, 13.007986), red)
	AddLight(Vec3(-97.349625, 75.428909, 23.290346), green)
	AddLight(Vec3(-95.009903, 75.428909, 34.712357), red)
	AddLight(Vec3(-86.585358, 75.428909, 42.352844), green)
	AddLight(Vec3(-78.603546, 75.432037, 43.570465), red)

	-- B Lion white lights
	AddLight(Vec3(-60.052856, 68.284943, 117.920502), yellow, 10)
	AddLight(Vec3(-60.038078, 68.200249, 117.949707), yellow, 10)
	AddLight(Vec3(-61.798187, 69.068832, 119.861023), yellow, 10)
	AddLight(Vec3(-62.105289, 68.200592, 119.882713), yellow, 10)
	AddLight(Vec3(-62.105408, 68.200256, 119.882721), yellow, 10)
	AddLight(Vec3(-64.314186, 69.139091, 120.648407), yellow, 10)
	AddLight(Vec3(-64.583847, 68.380325, 120.762978), yellow, 10)
	AddLight(Vec3(-64.647842, 68.200256, 120.790169), yellow, 10)
	AddLight(Vec3(-66.041801, 69.004120, 115.346939), yellow, 10)
	AddLight(Vec3(-66.043503, 68.200256, 116.089920), yellow, 10)
	AddLight(Vec3(-61.139225, 68.200256, 115.505692), yellow, 10)
	AddLight(Vec3(-63.798851, 68.200256, 115.413551), yellow, 10)
	AddLight(Vec3(-66.192352, 68.200256, 116.139328), yellow, 10)
	AddLight(Vec3(-68.333427, 68.200264, 118.380699), yellow, 10)
	AddLight(Vec3(-67.547760, 68.200264, 120.417694), yellow, 10)


	-- Boy statue
	AddLight(Vec3(-30.808592, 67.125549, 46.103497), yellow, 20)

	-- Lamp post by the boy statue
	AddLight(Vec3(-16.447449, 70.449707, 45.028175), green)

	-- Under bridge RU spawn
	AddLight(Vec3(-90.466354, 69.608849, -31.337948), orange, 50)

	-- Sheets by bridge
	AddLight(Vec3(-94.646942, 71.717087, -6.066500), yellow, 5)
	AddLight(Vec3(-92.220016, 71.726532, -6.020158), yellow, 5)
	AddLight(Vec3(-90.278778, 71.834450, -4.284575), yellow, 5)
	AddLight(Vec3(-88.349785, 71.866180, -2.555386), yellow, 5)
	AddLight(Vec3(-88.349785, 71.866180, -2.555386), yellow, 5)
	AddLight(Vec3(-86.326408, 71.842865, 1.786248), yellow, 5)

	-- Sniper tree US - near B
	AddLight(Vec3(-102.815018, 90.374260, 80.068771), yellow, 10)
	AddLight(Vec3(-102.712074, 86.563431, 76.277161), yellow, 10)
	AddLight(Vec3(-102.755234, 88.699211, 78.391380), yellow, 10)
	AddLight(Vec3(-102.815018, 90.374260, 80.068771), yellow, 10)
	AddLight(Vec3(-106.339844, 88.945267, 76.130058), yellow, 10)
	AddLight(Vec3(-100.934509, 83.006729, 73.068428), yellow, 10)
	AddLight(Vec3(-103.583450, 92.099487, 72.486343), yellow, 10)
	AddLight(Vec3(-100.548111, 86.826950, 73.638367), yellow, 10)
	AddLight(Vec3(-102.850922, 80.712746, 74.027184), yellow, 10)
	AddLight(Vec3(-100.202065, 93.348419, 68.265846), yellow, 10)
end

Events:Subscribe('Level:Loaded', function(levelName, gameMode)
	if levelName == "Levels/MP_Subway/MP_Subway" and gameMode == "ConquestSmall0" then
		print("Adding christmas lights...")
		AddChristmasLights()
	end
end)

-- Hooks:Install('BulletEntity:Collision', 1, function(hook, entity, hit, shooter)
-- 	-- Do stuff here.
-- 	print(shooter.name)
-- 	print(hit.position)
--     -- local green = Vec3(0.0, 1.0, 0.0)
-- 	-- AddLight(hit.position, green)
-- end)

