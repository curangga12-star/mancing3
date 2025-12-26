--// Services
local HttpService = game:GetService("HttpService")
local StarterGui  = game:GetService("StarterGui")

--// Notify
local function notify(title, text)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = title,
			Text = text,
			Duration = 5
		})
	end)
end

--// Game loaders
local loaders = {
	[121864768012064] = {
		name = "fish it",
		url  = "https://github.com/curangga12-star/mancing3/blob/main/Euphoria/MacUI/main.luau"
	}
}

local default_loader = loaders[6911148748]

--// Load script
local function load(url)
	local success, err = pcall(function()
		local src = game:HttpGet(url)
		local fn = loadstring(src)
		assert(fn, "Compile failed")
		fn()
	end)

	if not success then
		warn(err)
		notify("Loader", "Gagal memuat script")
	end
end

--// Execute
local cfg = loaders[game.PlaceId] or default_loader
notify("Loader", "Memuat: "..cfg.name)
load(cfg.url)
