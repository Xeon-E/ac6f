math.randomseed(tick())

if type(getgenv) ~= 'function' then
	return
end

local GlobalEnvironment = getgenv()
local Universes = select(2, pcall(function()
	return game:GetService("HttpService"):JSONDecode(game:HttpGet("https://api.roblox.com/universes/get-universe-containing-place?placeid=" .. game.PlaceId))
end))

if type(GlobalEnvironment) == 'table' and type(Universes) == 'table' then
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local PlaceId = game.PlaceId
	local UniverseId = Universes.UniverseId
	local Information = { Name = 'AC6F', Author = 'Pagammy', Version = '1.0.0' }

	local InternalSettings = { 
		UseVariablesAlways = false, -- coding preference for serialization xd
		Development = false, 
		LoadUI = true,
	}

	local Splix
	if InternalSettings.LoadUI then
		if InternalSettings.Development then
			Splix = require(script:WaitForChild("Splix")); GlobalEnvironment.Splix = Splix
		else
			local http_success, http_response = pcall(game.HttpGet, game, 'https://raw.githubusercontent.com/matas3535/SplixPrivateDrawingLibrary/main/Library.lua')
			if http_success == true and type(http_response) == 'string' then
				local callback = select(2, pcall(loadstring, http_response))
				if type(callback) == 'function' then
					Splix = callback()
				end
			end
		end
	end

	local FactorySettings = {
		["SusThickness"] = 0.1,
		["AutoFlip"] = true,
		["SusColor"] = "Bright red",
		["Aspiration"] = "Super",
		["FSusAngle"] = 80,
		["FWLgcyDensity"] = 1,
		["MinSteer"] = 10,
		["PeakRPM"] = 6000,
		["RDiffLockThres"] = 20,
		["LoadDelay"] = 0.1,
		["FPreCompress"] = 0.3,
		["SusCoilCount"] = 6,
		["RevDecay"] = 75,
		["FAnchorOffset"] = {
			-0.4,
			-0.5,
			0,
		},
		["SteerSpeed"] = 0.07,
		["WsThickness"] = 0.1,
		["RWLgcyDensity"] = 1,
		["AutoUpThresh"] = -200,
		["FWsBoneLen"] = 5,
		["CurveMult"] = 0.2,
		["InclineComp"] = 1.2,
		["TorqueVector"] = 0.5,
		["RWsBoneAngle"] = 0,
		["RCamber"] = 1,
		["LegacyScaling"] = 0.1,
		["FLgcyBForce"] = 15000,
		["AxleSize"] = 2,
		["FCamber"] = 1,
		["SusVisible"] = true,
		["FCompressLim"] = 0.1,
		["FExtensionLim"] = 0.3,
		["AxleDensity"] = 0.1,
		["ABSEnabled"] = true,
		["AutoDownThresh"] = 1400,
		["FToe"] = 0,
		["RSusAngle"] = 80,
		["RWsBoneLen"] = 5,
		["WeightBSize"] = {
			6,
			4,
			15,
		},
		["RDiffSlipThres"] = 80,
		["FGyroDamp"] = 100,
		["TCSEnabled"] = true,
		["LgcyPBForce"] = 25000,
		["TransModes"] = {
			"Auto",
			"Semi",
			"Manual",
		},
		["AutoStart"] = true,
		["RLgcyBForce"] = 10000,
		["PBrakeForce"] = 5000,
		["RToe"] = 0,
		["SteerMaxTorque"] = 50000,
		["RevAccel"] = 300,
		["RWheelDensity"] = 0.1,
		["AutoShiftMode"] = "RPM",
		["RGyroDamp"] = 100,
		["FDMult"] = 1,
		["Boost"] = 5,
		["RCompressLim"] = 0.1,
		["Ratios"] = {
			18.641,
			0,
			16.641,
			12.342,
			9.812,
			7.765,
			6.272,
			5.045,
			4.572,
			4.072,
		},
		["FSusDamping"] = 500,
		["RSusLength"] = 2,
		["FinalDrive"] = 0.8,
		["RAntiRoll"] = 50,
		["Horsepower"] = 250,
		["FWheelDensity"] = 0.1,
		["ShiftTime"] = 0.3,
		["RSusStiffness"] = 9000,
		["Controls"] = {
			["ToggleMouseDrive"] = Enum.KeyCode.R,
			["ContlrToggleABS"] = Enum.KeyCode.DPadRight,
			["SteerLeft2"] = Enum.KeyCode.A,
			["ToggleTransMode"] = Enum.KeyCode.M,
			["PBrake"] = Enum.KeyCode.P,
			["ContlrToggleTMode"] = Enum.KeyCode.DPadUp,
			["SteerLeft"] = Enum.KeyCode.Left,
			["ContlrPBrake"] = Enum.KeyCode.ButtonL1,
			["MouseThrottle"] = Enum.UserInputType.MouseButton1,
			["Throttle"] = Enum.KeyCode.Up,
			["ContlrShiftDown"] = Enum.KeyCode.ButtonX,
			["ShiftUp"] = Enum.KeyCode.E,
			["MousePBrake"] = Enum.KeyCode.LeftShift,
			["ContlrSteer"] = Enum.KeyCode.Thumbstick1,
			["ContlrBrake"] = Enum.KeyCode.ButtonL2,
			["ToggleABS"] = Enum.KeyCode.Y,
			["ContlrThrottle"] = Enum.KeyCode.ButtonR2,
			["MouseClutch"] = Enum.KeyCode.W,
			["ContlrShiftUp"] = Enum.KeyCode.ButtonY,
			["MouseShiftDown"] = Enum.KeyCode.Q,
			["Brake"] = Enum.KeyCode.Down,
			["MouseShiftUp"] = Enum.KeyCode.E,
			["ToggleTCS"] = Enum.KeyCode.T,
			["MouseBrake"] = Enum.UserInputType.MouseButton2,
			["SteerRight"] = Enum.KeyCode.Right,
			["ShiftDown"] = Enum.KeyCode.Q,
			["ContlrToggleTCS"] = Enum.KeyCode.DPadDown,
			["ContlrClutch"] = Enum.KeyCode.ButtonR1,
			["Brake2"] = Enum.KeyCode.S,
			["Throttle2"] = Enum.KeyCode.W,
			["Clutch"] = Enum.KeyCode.LeftShift,
			["SteerRight2"] = Enum.KeyCode.D,
		},
		["ABSThreshold"] = 20,
		["RExtensionLim"] = 0.3,
		["SusEnabled"] = true,
		["WsBVisible"] = false,
		["TCSGradient"] = 20,
		["TCSThreshold"] = 20,
		["Peripherals"] = {
			["ControlLDZone"] = 5,
			["ControlRDZone"] = 5,
			["MSteerDZone"] = 10,
			["MSteerWidth"] = 67,
		},
		["CDiffLockThres"] = 50,
		["SusRadius"] = 0.2,
		["CDiffSlipThres"] = 50,
		["FSusStiffness"] = 9000,
		["FDiffLockThres"] = 50,
		["FDiffSlipThres"] = 50,
		["Config"] = "AWD",
		["ClutchTol"] = 250,
		["IdleThrottle"] = 3,
		["RevBounce"] = 500,
		["FBrakeForce"] = 2500,
		["Sensitivity"] = 0.05,
		["FCaster"] = 0,
		["CompressRatio"] = 9,
		["WBVisible"] = false,
		["TurboSize"] = 80,
		["PeakSharpness"] = 20,
		["EqPoint"] = 5252,
		["Redline"] = 7000,
		["FWsBoneAngle"] = 0,
		["RAnchorOffset"] = {
			-0.4,
			-0.5,
			0,
		},
		["SteerP"] = 100000,
		["RBrakeForce"] = 2000,
		["SteerD"] = 1000,
		["MSteerExp"] = 1,
		["SteerDecay"] = 330,
		["ReturnSpeed"] = 0.1,
		["SteerInner"] = 45,
		["RSusDamping"] = 500,
		["SteerOuter"] = 38,
		["WsColor"] = "Black",
		["CGHeight"] = 0.8,
		["TCSLimit"] = 10,
		["WeightDist"] = 51,
		["RPreCompress"] = 0.3,
		["IdleRPM"] = 700,
		["WeightScaling"] = 0.02,
		["FSusLength"] = 2,
		["Weight"] = 3214,
		["FAntiRoll"] = 50,
	}
	
	local hasclipboard = type(setclipboard) == 'function'
	
	pcall(function() GlobalEnvironment.AC6F.GlitchConnection:Disconnect() end)
	pcall(function() GlobalEnvironment.AC6F.HackConnection:Disconnect() end)
	--- @type table
	--- @version 1.0.0
	local AC6F = {}
	GlobalEnvironment.AC6F = AC6F

	local function rawgetall(a, t)
		for i, v in pairs(t) do
			if not rawget(a, v) then
				return false
			end
		end
		return true
	end

	local find = table.find

	local function serialize(x, tab)
		if type(tab) ~= 'number' then
			tab = 1
		end
		local txt = '{'
		local counter = 0
		for i, v in pairs(x) do
			txt = txt .. '\n' .. string.rep('\t', tab)
			local i_type = typeof(i)
			local v_type = typeof(v)
			if i_type == 'string' then
				if i_type == '__index' then
					continue
				end
				txt = txt .. '[\"' .. tostring(i) .. '\"] = '
			end
			if v_type == 'table' and v ~= x then
				tab = tab + 1
				txt = txt .. serialize(v, tab)
				tab = tab - 1
			elseif find({'number', 'EnumItem', 'Enum'}, v_type) then
				txt = txt .. tostring(v)
			elseif v_type == 'BrickColor' then
				txt = txt .. 'BrickColor.new(\"' .. tostring(v) .. '\")'
			elseif v_type == 'Vector3' then
				local def = 'Vector3.new(' .. tostring(v.X) .. ', ' .. tostring(v.Y) .. ', ' .. tostring(v.Z) .. ')'
				if v.X == v.Y then
					if v.Y == v.Z then
						if v.X == 0 then
							txt = txt .. 'Vector3.zero'
						elseif v.X == 1 then
							txt = txt .. 'Vector3.one'
						elseif InternalSettings.UseVariablesAlways then
							txt = txt .. 'Vector3.one * ' .. tostring(v.X)
						end
					else -- some may not have 'continue'
						txt = txt .. def
					end
				else -- which is why i did this
					txt = txt .. def
				end
			elseif v_type == 'Vector2' then
				local def = 'Vector2.new(' .. tostring(v.X) .. ', ' .. tostring(v.Y) .. ')'
				if v.X == v.Y then
					if v.X == 0 then
						txt = txt .. 'Vector3.zero'
					elseif v.X == 1 then
						txt = txt .. 'Vector3.one'
					elseif InternalSettings.UseVariablesAlways then
						txt = txt .. 'Vector3.one * ' .. tostring(v.X)
					end
				else -- which is why i did this
					txt = txt .. def
				end 
			elseif v_type == 'boolean' then
				local bool = 'false'
				if v == true then
					bool = 'true'
				end
				txt = txt .. bool
			elseif v_type == 'nil' then
				txt = txt .. 'nil' -- lol
			else
				txt = txt .. '\"' .. tostring(v) .. '\"'
			end
			txt = txt .. ','
			counter = counter + 1
		end
		tab = tab - 1
		txt = txt .. '\n' .. string.rep('\t', tab) .. '}'
		return txt
	end

	local Drive
	local function GetDrive()
		for i, v in pairs(getscripts()) do
			if v.Name == 'Drive' and v:FindFirstAncestorWhichIsA("PlayerGui") then
				Drive = v
				return v
			end
		end
	end
	local function GetDriveRegistry()
		local r = {}
		local drive = GetDrive()
		for _, v in pairs(debug.getregistry()) do
			if type(v) == 'function' then
				local script = getfenv(v)['script']
				if script == drive and script:FindFirstAncestorWhichIsA("PlayerGui") then
					table.insert(r, v)
				end
			end
		end
		return r
	end
	local function GetDriveUpvalues()
		local uvs = {}
		for _, f in pairs(GetDriveRegistry()) do
			for i, v in pairs(debug.getupvalues(f)) do
				if not table.find(uvs, v) then
					uvs[#uvs + 1] = v
				end
			end
		end
		return uvs
	end
	local function GetDriveContent()
		local c = {}
		for _, t in pairs(GetDriveUpvalues()) do
			if type(t) == 'table' then
				c[#c + 1] = t
			end
		end
		return c
	end

	local MemoryConfiguration = {}

	local function GetDriveConfiguration()
		local c = select(2, pcall(GetDriveContent))
		if type(c) == 'table' then
			for _, t in pairs(GetDriveContent()) do
				if rawgetall(t, {'PeakRPM', 'SusEnabled', 'Weight'}) then
					return t
				end
			end
		end
		return MemoryConfiguration
	end

	local function GetSeatPart()
		local SeatPart = select(2, pcall(function()
			return LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").SeatPart
		end))
		if type(SeatPart) ~= 'string' then
			return SeatPart
		end
	end

	local function GetVehicle()
		local SeatPart = GetSeatPart()
		if typeof(SeatPart) == 'Instance' and SeatPart:IsA("VehicleSeat") and SeatPart.Parent ~= workspace then
			return SeatPart.Parent
		end
	end

	local MemorySprings = {}

	local function FindSurfaceType(Part, SurfaceType)
		if typeof(Part) == 'Instance' and Part:IsA("BasePart") then
			for _, NormalId in pairs(Enum.NormalId:GetEnumItems()) do
				if Part[NormalId.Name .. 'Surface'] == SurfaceType then
					return NormalId
				end
			end
		end
		return false
	end

	local function GetWheels()
		local Vehicle = GetVehicle()
		if typeof(Vehicle) == 'Instance' then
			local Wheels = {}
			for _, Wheel in pairs(Vehicle:GetDescendants()) do
				if FindSurfaceType(Wheel, 'Hinge') or Wheel:FindFirstChildWhichIsA("HingeConstraint") then
					table.insert(Wheels, Wheel)
				end
			end
			return Wheels
		end
	end

	local function GetSprings()
		local Wheels = GetWheels() or {}
		local Springs = {}
		for _, Wheel in pairs(Wheels) do
			local SpringConstraint = Wheel:FindFirstChildWhichIsA("SpringConstraint")
			if typeof(SpringConstraint) == 'Instance' then
				table.insert(Springs, SpringConstraint)
			end
		end
		return Springs
	end

	local MainWindow
	local GeneralPage
	local HackConnection

	if InternalSettings.LoadUI then
		local Window = Splix:New({
			Name = 'AC6F'
		}) do
			local Page = Window:Page({
				Name = 'General'
			}) do
				local Section = Page:Section({
					Name = 'Driving (Network Universal)'
				}) do
					Section:Slider({
						Name = 'Speed Hack',

						Default = 20,
						Minimum = 0,
						Maximum = 30,

						Pointer = 'Acceleration',
					})

					Section:Slider({
						Name = 'Brake Hack',

						Default = 20,
						Minimum = 0,
						Maximum = 30,

						Pointer = 'Deceleration',
					})

					local Pointers = Splix.pointers
					local Acceleration = Pointers.Acceleration
					local Deceleration = Pointers.Deceleration

					local UserInputService = game:GetService("UserInputService")
					local W, S = Enum.KeyCode.W, Enum.KeyCode.S
					local Heartbeat = Instance.new("BindableEvent")

					local C = 1
					local T = 0
					local F = 60
					local D = 1 / F
					local Velocity = Vector3.one

					HackConnection = game:GetService("RunService").Stepped:Connect(function(time, deltaTime)
						if 1 / deltaTime > F or time > T + D then
							Heartbeat:Fire()
							local SeatPart = GetSeatPart()
							if typeof(SeatPart) == 'Instance' and SeatPart:IsA("VehicleSeat") then
								local Acceleration = math.floor(Acceleration:Get())
								local Deceleration = math.floor(Deceleration:Get())
								if UserInputService:IsKeyDown(W) and Acceleration > 0 then
									C = 1 + (Acceleration / 10) * deltaTime
									Velocity = Vector3.one * C
									SeatPart.AssemblyLinearVelocity = SeatPart.AssemblyLinearVelocity * Velocity
								elseif UserInputService:IsKeyDown(S) and Deceleration > 0 then
									C = 1 - (Deceleration / 10) * deltaTime
									Velocity = Vector3.one * C
									SeatPart.AssemblyLinearVelocity = SeatPart.AssemblyLinearVelocity * Velocity
								end
							end
						end
					end)

					AC6F.HackConnection = HackConnection

					Section:Button({
						Name = 'Air Ricochet',
						Callback = function()
							local SeatPart = GetSeatPart()
							if typeof(SeatPart) == 'Instance' and SeatPart:IsA("VehicleSeat") then
								SeatPart.AssemblyLinearVelocity = -SeatPart.AssemblyLinearVelocity
							end
						end,
					})

					Section:Button({
						Name = 'Air Fling',
						Callback = function()
							local SeatPart = GetSeatPart()
							if typeof(SeatPart) == 'Instance' and SeatPart:IsA("VehicleSeat") then
								local X = math.random(0, 1)
								if X == 0 then
									X = -1
								else
									X = 1
								end
								local Y = 1e3 * X
								SeatPart.AssemblyLinearVelocity = Vector3.new(Y, Y, Y)
							end
						end,
					})
					
					Section:Toggle({
						Name = 'Glitch',
						Default = false,
						Callback = function(X)
							if X == true then
								AC6F.GlitchConnection = Heartbeat.Event:Connect(function()
									local SeatPart = GetSeatPart()
									if typeof(SeatPart) == 'Instance' and SeatPart:IsA("VehicleSeat") then
										local x = math.random(-500, 500)
										local y = math.random(-500, 500)
										local z = math.random(-500, 500)
										
										SeatPart.AssemblyLinearVelocity = Vector3.new(x, y, z)
									end
								end)
							else
								pcall(function() AC6F.GlitchConnection:Disconnect() end)
							end
						end,
					})
				end
				local Section = Page:Section({
					Name = 'Steering (AC6 Basic)',
				}) do
					Section:Slider({
						Name = 'Speed',

						Default = .07,
						Minimum = 0,
						Maximum = .1,
						Decimals = .005,

						Callback = function(X)
							GetDriveConfiguration().SteerSpeed = X
						end,
					})

					Section:Slider({
						Name = 'Max Torque',

						Default = 5e4,
						Minimum = 0,
						Maximum = 1e5,

						Callback = function(X)
							GetDriveConfiguration().SteerMaxTorque = X
						end,
					})

					Section:Slider({
						Name = 'P',

						Default = 1e5,
						Minimum = 0,
						Maximum = 4e5,

						Callback = function(X)
							GetDriveConfiguration().SteerP = X
						end,
					})

					Section:Slider({
						Name = 'D',

						Default = 1e3,
						Minimum = 0,
						Maximum = 4e3,

						Callback = function(X)
							GetDriveConfiguration().SteerD = X
						end,
					})

					Section:Slider({
						Name = 'Inner',

						Default = 45,
						Minimum = 0,
						Maximum = 90,

						Callback = function(X)
							GetDriveConfiguration().SteerInner = X
						end,
					})

					Section:Slider({
						Name = 'Outer',

						Default = 38,
						Minimum = 0,
						Maximum = 90,

						Callback = function(X)
							GetDriveConfiguration().SteerOuter = X
						end,
					})

					Section:Slider({
						Name = 'Min',

						Default = 10,
						Minimum = 0,
						Maximum = 30,

						Callback = function(X)
							GetDriveConfiguration().MinSteer = X
						end,
					})
				end
				local Section = Page:Section({
					Name = 'Engine (AC6 Basic)',
					Side = 'right'
				}) do
					Section:Slider({
						Name = 'Peak RPM',

						Default = FactorySettings.PeakRPM,
						Minimum = 0,
						Maximum = FactorySettings.PeakRPM * 4,

						Callback = function(X)
							GetDriveConfiguration().PeakRPM = X
						end,
					})

					Section:Slider({
						Name = 'Rev Accel',

						Default = FactorySettings.RevAccel,
						Minimum = 0,
						Maximum = FactorySettings.RevAccel * 4,

						Callback = function(X)
							GetDriveConfiguration().RevAccel = X
						end,
					})

					Section:Slider({
						Name = 'Horsepower',

						Default = FactorySettings.Horsepower,
						Minimum = 0,
						Maximum = FactorySettings.Horsepower * 4,

						Callback = function(X)
							GetDriveConfiguration().Horsepower = X
						end,
					})
				end
				local Section = Page:Section({
					Name = 'Suspension (AC6 Basic)',
					Side = 'right',
				}) do
					Section:Toggle({
						Name = 'Enabled',
						Default = FactorySettings.SusEnabled,
						Callback = function(X)
							for _, SpringConstraint in pairs(GetSprings()) do
								SpringConstraint.Enabled = X
							end
						end,
					})
					Section:Slider({
						Name = 'Radius',

						Default = FactorySettings.SusRadius,
						Minimum = 0,
						Maximum = FactorySettings.SusRadius * 8,
						Decimals = .1,

						Callback = function(X)
							for _, SpringConstraint in pairs(GetSprings()) do
								SpringConstraint.Radius = X
							end
						end,
					})
					Section:Slider({
						Name = 'Coils',

						Default = FactorySettings.SusCoilCount,
						Minimum = 0,
						Maximum = FactorySettings.SusCoilCount * 4,

						Callback = function(X)
							for _, SpringConstraint in pairs(GetSprings()) do
								SpringConstraint.Coils = X
							end
						end,
					})
					Section:Slider({
						Name = 'Thickness',

						Default = FactorySettings.SusThickness,
						Minimum = 0,
						Maximum = FactorySettings.SusThickness * 8,
						Decimals = .1,

						Callback = function(X)
							for _, SpringConstraint in pairs(GetSprings()) do
								SpringConstraint.Enabled = X
							end
						end,
					})

					Section:Slider({
						Name = 'Damping',

						Default = 500,
						Minimum = 0,
						Maximum = 2e3,

						Callback = function(X)
							for _, SpringConstraint in pairs(GetSprings()) do
								SpringConstraint.Damping = X
							end
						end,
					})

					Section:Toggle({
						Name = 'Limited',
						Default = true,
						Callback = function(X)
							for _, SpringConstraint in pairs(GetSprings()) do
								SpringConstraint.Damping = X
							end
						end,
					})

					Section:Slider({
						Name = 'Free Length',
						Minimum = 0,
						Maximum = 10,
						Callback = function(X)
							for _, SpringConstraint in pairs(GetSprings()) do
								SpringConstraint.FreeLength = X
							end
						end,
					})
				end
			end
			GeneralPage = Page
			local Page = Window:Page({
				Name = 'Developer',
			}) do
				local Section = Page:Section({
					Name = 'Splix',
				}) do
					Section:Button({
						Name = 'Unload',
						Callback = function()
							pcall(function()
								return HackConnection:Disconnect()
							end)
							return Window:Unload()
						end,
					})
				end
				local Section = Page:Section({
					Name = 'Debugging',
				}) do
					if hasclipboard then
						Section:Button({
							Name = 'Drive Configuration',
							Callback = function()
								setclipboard(serialize(GetDriveConfiguration()))
							end
						})
					end
				end
			end
			local Page = Window:Page({
				Name = "Help (Please Read)",
			}) do
				local Section = Page:Section({
					Name = 'Applying Settings',
				}) do
					Section:Label({Name = 'Some settings may require\nyou to exit and re-enter\nthe vehicle.\n\nThis is because the vehicle\nstores the values before\nactually using them.'})
				end
				
				local Section = Page:Section({
					Name = 'Contributing',
				}) do
					Section:Label({Name = 'Feel free to contribute.' .. (function()
						if hasclipboard then
							return 'https://github.com/paygammy/ac6f/'
						end
						return ''
					end)()})
					if hasclipboard then
					Section:Button({Name = 'GitHub Repository [Clipboard]', Callback = function()
						return setclipboard('https://github.com/paygammy/ac6f/')
						end,})
					end
				end

				local invite = 'CUtbB9zPcu'
				local request = syn and syn.request

				local Section = Page:Section({
					Name = 'Further Help',
				}) do
					Section:Label({Name = 'If you need more help\nreach out to me on\nmy Discord server.'})
					Section:Button({Name = request and 'Join Discord Server' or hasclipboard and 'Copy Discord Invite', Callback = function()
						if request then
							local success = pcall(function()
								return request({
									Url = "http://127.0.0.1:6463/rpc?v=1",
									Method = "POST",
									Headers = {
										["Content-Type"] = "application/json",
										["origin"] = "https://discord.com",
									},
									Body = game:GetService("HttpService"):JSONEncode(
									{
										["args"] = {
											["code"] = invite,
										},
										["cmd"] = "INVITE_BROWSER",
										["nonce"] = "."
									})
								})
							end)
							if success == true then
								return
							end
						end
						if hasclipboard then
							return setclipboard('https://discord.com/invite/', invite)
						end
					end,})
				end
			end
		end
		MainWindow = Window
	end

	if MainWindow then
		MainWindow:Initialize()
	end

	--- Searches the PlayerGui for the Drive script. If the script is found, it is returned.
	--- @type function
	--- @return userdata
	function AC6F:GetDrive()
		return GetDrive()
	end

	--- Retrieve all tables used for maintaining active vehicle.
	--- @type function
	--- @return { [number]: table }
	function AC6F:GetDriveContent()
		return GetDriveContent()
	end

	--- Get all functions used by Drive.
	--- @type function
	--- @return { [number]: function }
	function AC6F:GetDriveRegistry()
		return GetDriveRegistry()
	end

	--- Get all up-values in Drive registry.
	--- @type function
	--- @return { [number]: any }
	function AC6F:GetDriveUpvalues()
		return GetDriveUpvalues()
	end

	--- Get the configuration of the current vehicle.
	--- @type function
	--- @return { [string]: any }
	function AC6F:GetDriveConfiguration()
		return GetDriveConfiguration()
	end
end
