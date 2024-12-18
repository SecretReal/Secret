Library = {}

local function Tw(info)
	return game:GetService("TweenService"):Create(info.v,TweenInfo.new(info.t,Enum.EasingStyle[info.s],Enum.EasingDirection[info.d]),info.g)
end
local function infolib(t, k)
	local lk = string.lower(k)
	for k, v in pairs(t) do
		if string.lower(k) == lk then
			return v
		end
	end
	for k, v in pairs(t) do
		if string.find(string.lower(k), lk) then
			return v
		end
	end
	return nil
end
local function New(a, b, c, d)
	local e = Instance.new(a)
	if b then
		for f, g in pairs(b) do
			e[f] = g
		end
	end
	if c then
		for f, g in pairs(c) do
			g.Parent = e
		end
	end
	if d then
		d(e)
	end
	return e
end
local function lak(object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
		local Tween = game:GetService("TweenService"):Create(object, TweenInfo.new(0.3), {Position = pos})
		Tween:Play()
	end

	object.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = input.Position
			StartPosition = object.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)

	object.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			DragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == DragInput and Dragging then
			Update(input)
		end
	end)
end
local IconList = {
	["accessibility"] = "rbxassetid://10709751939",
	["activity"] = "rbxassetid://10709752035",
	["air-vent"] = "rbxassetid://10709752131",
	["airplay"] = "rbxassetid://10709752254",
	["alarm-check"] = "rbxassetid://10709752405",
	["alarm-clock"] = "rbxassetid://10709752630",
	["alarm-clock-off"] = "rbxassetid://10709752508",
	["alarm-minus"] = "rbxassetid://10709752732",
	["alarm-plus"] = "rbxassetid://10709752825",
	["album"] = "rbxassetid://10709752906",
	["alert-circle"] = "rbxassetid://10709752996",
	["alert-octagon"] = "rbxassetid://10709753064",
	["alert-triangle"] = "rbxassetid://10709753149",
	["align-center"] = "rbxassetid://10709753570",
	["align-center-horizontal"] = "rbxassetid://10709753272",
	["align-center-vertical"] = "rbxassetid://10709753421",
	["align-end-horizontal"] = "rbxassetid://10709753692",
	["align-end-vertical"] = "rbxassetid://10709753808",
	["align-horizontal-distribute-center"] = "rbxassetid://10747779791",
	["align-horizontal-distribute-end"] = "rbxassetid://10747784534",
	["align-horizontal-distribute-start"] = "rbxassetid://10709754118",
	["align-horizontal-justify-center"] = "rbxassetid://10709754204",
	["align-horizontal-justify-end"] = "rbxassetid://10709754317",
	["align-horizontal-justify-start"] = "rbxassetid://10709754436",
	["align-horizontal-space-around"] = "rbxassetid://10709754590",
	["align-horizontal-space-between"] = "rbxassetid://10709754749",
	["align-justify"] = "rbxassetid://10709759610",
	["align-left"] = "rbxassetid://10709759764",
	["align-right"] = "rbxassetid://10709759895",
	["align-start-horizontal"] = "rbxassetid://10709760051",
	["align-start-vertical"] = "rbxassetid://10709760244",
	["align-vertical-distribute-center"] = "rbxassetid://10709760351",
	["align-vertical-distribute-end"] = "rbxassetid://10709760434",
	["align-vertical-distribute-start"] = "rbxassetid://10709760612",
	["align-vertical-justify-center"] = "rbxassetid://10709760814",
	["align-vertical-justify-end"] = "rbxassetid://10709761003",
	["align-vertical-justify-start"] = "rbxassetid://10709761176",
	["align-vertical-space-around"] = "rbxassetid://10709761324",
	["align-vertical-space-between"] = "rbxassetid://10709761434",
	["anchor"] = "rbxassetid://10709761530",
	["angry"] = "rbxassetid://10709761629",
	["annoyed"] = "rbxassetid://10709761722",
	["aperture"] = "rbxassetid://10709761813",
	["apple"] = "rbxassetid://10709761889",
	["archive"] = "rbxassetid://10709762233",
	["archive-restore"] = "rbxassetid://10709762058",
	["armchair"] = "rbxassetid://10709762327",
	["arrow-big-down"] = "rbxassetid://10747796644",
	["arrow-big-left"] = "rbxassetid://10709762574",
	["arrow-big-right"] = "rbxassetid://10709762727",
	["arrow-big-up"] = "rbxassetid://10709762879",
	["arrow-down"] = "rbxassetid://10709767827",
	["arrow-down-circle"] = "rbxassetid://10709763034",
	["arrow-down-left"] = "rbxassetid://10709767656",
	["arrow-down-right"] = "rbxassetid://10709767750",
	["arrow-left"] = "rbxassetid://10709768114",
	["arrow-left-circle"] = "rbxassetid://10709767936",
	["arrow-left-right"] = "rbxassetid://10709768019",
	["arrow-right"] = "rbxassetid://10709768347",
	["arrow-right-circle"] = "rbxassetid://10709768226",
	["arrow-up"] = "rbxassetid://10709768939",
	["arrow-up-circle"] = "rbxassetid://10709768432",
	["arrow-up-down"] = "rbxassetid://10709768538",
	["arrow-up-left"] = "rbxassetid://10709768661",
	["arrow-up-right"] = "rbxassetid://10709768787",
	["asterisk"] = "rbxassetid://10709769095",
	["at-sign"] = "rbxassetid://10709769286",
	["award"] = "rbxassetid://10709769406",
	["axe"] = "rbxassetid://10709769508",
	["axis-3d"] = "rbxassetid://10709769598",
	["baby"] = "rbxassetid://10709769732",
	["backpack"] = "rbxassetid://10709769841",
	["baggage-claim"] = "rbxassetid://10709769935",
	["banana"] = "rbxassetid://10709770005",
	["banknote"] = "rbxassetid://10709770178",
	["bar-chart"] = "rbxassetid://10709773755",
	["bar-chart-2"] = "rbxassetid://10709770317",
	["bar-chart-3"] = "rbxassetid://10709770431",
	["bar-chart-4"] = "rbxassetid://10709770560",
	["bar-chart-horizontal"] = "rbxassetid://10709773669",
	["barcode"] = "rbxassetid://10747360675",
	["baseline"] = "rbxassetid://10709773863",
	["bath"] = "rbxassetid://10709773963",
	["battery"] = "rbxassetid://10709774640",
	["battery-charging"] = "rbxassetid://10709774068",
	["battery-full"] = "rbxassetid://10709774206",
	["battery-low"] = "rbxassetid://10709774370",
	["battery-medium"] = "rbxassetid://10709774513",
	["beaker"] = "rbxassetid://10709774756",
	["bed"] = "rbxassetid://10709775036",
	["bed-double"] = "rbxassetid://10709774864",
	["bed-single"] = "rbxassetid://10709774968",
	["beer"] = "rbxassetid://10709775167",
	["bell"] = "rbxassetid://10709775704",
	["bell-minus"] = "rbxassetid://10709775241",
	["bell-off"] = "rbxassetid://10709775320",
	["bell-plus"] = "rbxassetid://10709775448",
	["bell-ring"] = "rbxassetid://10709775560",
	["bike"] = "rbxassetid://10709775894",
	["binary"] = "rbxassetid://10709776050",
	["bitcoin"] = "rbxassetid://10709776126",
	["bluetooth"] = "rbxassetid://10709776655",
	["bluetooth-connected"] = "rbxassetid://10709776240",
	["bluetooth-off"] = "rbxassetid://10709776344",
	["bluetooth-searching"] = "rbxassetid://10709776501",
	["bold"] = "rbxassetid://10747813908",
	["bomb"] = "rbxassetid://10709781460",
	["bone"] = "rbxassetid://10709781605",
	["book"] = "rbxassetid://10709781824",
	["book-open"] = "rbxassetid://10709781717",
	["bookmark"] = "rbxassetid://10709782154",
	["bookmark-minus"] = "rbxassetid://10709781919",
	["bookmark-plus"] = "rbxassetid://10709782044",
	["bot"] = "rbxassetid://10709782230",
	["box"] = "rbxassetid://10709782497",
	["box-select"] = "rbxassetid://10709782342",
	["boxes"] = "rbxassetid://10709782582",
	["briefcase"] = "rbxassetid://10709782662",
	["brush"] = "rbxassetid://10709782758",
	["bug"] = "rbxassetid://10709782845",
	["building"] = "rbxassetid://10709783051",
	["building-2"] = "rbxassetid://10709782939",
	["bus"] = "rbxassetid://10709783137",
	["cake"] = "rbxassetid://10709783217",
	["calculator"] = "rbxassetid://10709783311",
	["calendar"] = "rbxassetid://10709789505",
	["calendar-check"] = "rbxassetid://10709783474",
	["calendar-check-2"] = "rbxassetid://10709783392",
	["calendar-clock"] = "rbxassetid://10709783577",
	["calendar-days"] = "rbxassetid://10709783673",
	["calendar-heart"] = "rbxassetid://10709783835",
	["calendar-minus"] = "rbxassetid://10709783959",
	["calendar-off"] = "rbxassetid://10709788784",
	["calendar-plus"] = "rbxassetid://10709788937",
	["calendar-range"] = "rbxassetid://10709789053",
	["calendar-search"] = "rbxassetid://10709789200",
	["calendar-x"] = "rbxassetid://10709789407",
	["calendar-x-2"] = "rbxassetid://10709789329",
	["camera"] = "rbxassetid://10709789686",
	["camera-off"] = "rbxassetid://10747822677",
	["car"] = "rbxassetid://10709789810",
	["carrot"] = "rbxassetid://10709789960",
	["cast"] = "rbxassetid://10709790097",
	["charge"] = "rbxassetid://10709790202",
	["check"] = "rbxassetid://10709790644",
	["check-circle"] = "rbxassetid://10709790387",
	["check-circle-2"] = "rbxassetid://10709790298",
	["check-square"] = "rbxassetid://10709790537",
	["chef-hat"] = "rbxassetid://10709790757",
	["cherry"] = "rbxassetid://10709790875",
	["chevron-down"] = "rbxassetid://10709790948",
	["chevron-first"] = "rbxassetid://10709791015",
	["chevron-last"] = "rbxassetid://10709791130",
	["chevron-left"] = "rbxassetid://10709791281",
	["chevron-right"] = "rbxassetid://10709791437",
	["chevron-up"] = "rbxassetid://10709791523",
	["chevrons-down"] = "rbxassetid://10709796864",
	["chevrons-down-up"] = "rbxassetid://10709791632",
	["chevrons-left"] = "rbxassetid://10709797151",
	["chevrons-left-right"] = "rbxassetid://10709797006",
	["chevrons-right"] = "rbxassetid://10709797382",
	["chevrons-right-left"] = "rbxassetid://10709797274",
	["chevrons-up"] = "rbxassetid://10709797622",
	["chevrons-up-down"] = "rbxassetid://10709797508",
	["chrome"] = "rbxassetid://10709797725",
	["circle"] = "rbxassetid://10709798174",
	["circle-dot"] = "rbxassetid://10709797837",
	["circle-ellipsis"] = "rbxassetid://10709797985",
	["circle-slashed"] = "rbxassetid://10709798100",
	["citrus"] = "rbxassetid://10709798276",
	["clapperboard"] = "rbxassetid://10709798350",
	["clipboard"] = "rbxassetid://10709799288",
	["clipboard-check"] = "rbxassetid://10709798443",
	["clipboard-copy"] = "rbxassetid://10709798574",
	["clipboard-edit"] = "rbxassetid://10709798682",
	["clipboard-list"] = "rbxassetid://10709798792",
	["clipboard-signature"] = "rbxassetid://10709798890",
	["clipboard-type"] = "rbxassetid://10709798999",
	["clipboard-x"] = "rbxassetid://10709799124",
	["clock"] = "rbxassetid://10709805144",
	["clock-1"] = "rbxassetid://10709799535",
	["clock-10"] = "rbxassetid://10709799718",
	["clock-11"] = "rbxassetid://10709799818",
	["clock-12"] = "rbxassetid://10709799962",
	["clock-2"] = "rbxassetid://10709803876",
	["clock-3"] = "rbxassetid://10709803989",
	["clock-4"] = "rbxassetid://10709804164",
	["clock-5"] = "rbxassetid://10709804291",
	["clock-6"] = "rbxassetid://10709804435",
	["clock-7"] = "rbxassetid://10709804599",
	["clock-8"] = "rbxassetid://10709804784",
	["clock-9"] = "rbxassetid://10709804996",
	["cloud"] = "rbxassetid://10709806740",
	["cloud-cog"] = "rbxassetid://10709805262",
	["cloud-drizzle"] = "rbxassetid://10709805371",
	["cloud-fog"] = "rbxassetid://10709805477",
	["cloud-hail"] = "rbxassetid://10709805596",
	["cloud-lightning"] = "rbxassetid://10709805727",
	["cloud-moon"] = "rbxassetid://10709805942",
	["cloud-moon-rain"] = "rbxassetid://10709805838",
	["cloud-off"] = "rbxassetid://10709806060",
	["cloud-rain"] = "rbxassetid://10709806277",
	["cloud-rain-wind"] = "rbxassetid://10709806166",
	["cloud-snow"] = "rbxassetid://10709806374",
	["cloud-sun"] = "rbxassetid://10709806631",
	["cloud-sun-rain"] = "rbxassetid://10709806475",
	["cloudy"] = "rbxassetid://10709806859",
	["clover"] = "rbxassetid://10709806995",
	["code"] = "rbxassetid://10709810463",
	["code-2"] = "rbxassetid://10709807111",
	["codepen"] = "rbxassetid://10709810534",
	["codesandbox"] = "rbxassetid://10709810676",
	["coffee"] = "rbxassetid://10709810814",
	["cog"] = "rbxassetid://10709810948",
	["coins"] = "rbxassetid://10709811110",
	["columns"] = "rbxassetid://10709811261",
	["command"] = "rbxassetid://10709811365",
	["compass"] = "rbxassetid://10709811445",
	["component"] = "rbxassetid://10709811595",
	["concierge-bell"] = "rbxassetid://10709811706",
	["connection"] = "rbxassetid://10747361219",
	["contact"] = "rbxassetid://10709811834",
	["contrast"] = "rbxassetid://10709811939",
	["cookie"] = "rbxassetid://10709812067",
	["copy"] = "rbxassetid://10709812159",
	["copyleft"] = "rbxassetid://10709812251",
	["copyright"] = "rbxassetid://10709812311",
	["corner-down-left"] = "rbxassetid://10709812396",
	["corner-down-right"] = "rbxassetid://10709812485",
	["corner-left-down"] = "rbxassetid://10709812632",
	["corner-left-up"] = "rbxassetid://10709812784",
	["corner-right-down"] = "rbxassetid://10709812939",
	["corner-right-up"] = "rbxassetid://10709813094",
	["corner-up-left"] = "rbxassetid://10709813185",
	["corner-up-right"] = "rbxassetid://10709813281",
	["cpu"] = "rbxassetid://10709813383",
	["croissant"] = "rbxassetid://10709818125",
	["crop"] = "rbxassetid://10709818245",
	["cross"] = "rbxassetid://10709818399",
	["crosshair"] = "rbxassetid://10709818534",
	["crown"] = "rbxassetid://10709818626",
	["cup-soda"] = "rbxassetid://10709818763",
	["curly-braces"] = "rbxassetid://10709818847",
	["currency"] = "rbxassetid://10709818931",
	["database"] = "rbxassetid://10709818996",
	["delete"] = "rbxassetid://10709819059",
	["diamond"] = "rbxassetid://10709819149",
	["dice-1"] = "rbxassetid://10709819266",
	["dice-2"] = "rbxassetid://10709819361",
	["dice-3"] = "rbxassetid://10709819508",
	["dice-4"] = "rbxassetid://10709819670",
	["dice-5"] = "rbxassetid://10709819801",
	["dice-6"] = "rbxassetid://10709819896",
	["dices"] = "rbxassetid://10723343321",
	["diff"] = "rbxassetid://10723343416",
	["disc"] = "rbxassetid://10723343537",
	["divide"] = "rbxassetid://10723343805",
	["divide-circle"] = "rbxassetid://10723343636",
	["divide-square"] = "rbxassetid://10723343737",
	["dollar-sign"] = "rbxassetid://10723343958",
	["download"] = "rbxassetid://10723344270",
	["download-cloud"] = "rbxassetid://10723344088",
	["droplet"] = "rbxassetid://10723344432",
	["droplets"] = "rbxassetid://10734883356",
	["drumstick"] = "rbxassetid://10723344737",
	["edit"] = "rbxassetid://10734883598",
	["edit-2"] = "rbxassetid://10723344885",
	["edit-3"] = "rbxassetid://10723345088",
	["egg"] = "rbxassetid://10723345518",
	["egg-fried"] = "rbxassetid://10723345347",
	["electricity"] = "rbxassetid://10723345749",
	["electricity-off"] = "rbxassetid://10723345643",
	["equal"] = "rbxassetid://10723345990",
	["equal-not"] = "rbxassetid://10723345866",
	["eraser"] = "rbxassetid://10723346158",
	["euro"] = "rbxassetid://10723346372",
	["expand"] = "rbxassetid://10723346553",
	["external-link"] = "rbxassetid://10723346684",
	["eye"] = "rbxassetid://10723346959",
	["eye-off"] = "rbxassetid://10723346871",
	["factory"] = "rbxassetid://10723347051",
	["fan"] = "rbxassetid://10723354359",
	["fast-forward"] = "rbxassetid://10723354521",
	["feather"] = "rbxassetid://10723354671",
	["figma"] = "rbxassetid://10723354801",
	["file"] = "rbxassetid://10723374641",
	["file-archive"] = "rbxassetid://10723354921",
	["file-audio"] = "rbxassetid://10723355148",
	["file-audio-2"] = "rbxassetid://10723355026",
	["file-axis-3d"] = "rbxassetid://10723355272",
	["file-badge"] = "rbxassetid://10723355622",
	["file-badge-2"] = "rbxassetid://10723355451",
	["file-bar-chart"] = "rbxassetid://10723355887",
	["file-bar-chart-2"] = "rbxassetid://10723355746",
	["file-box"] = "rbxassetid://10723355989",
	["file-check"] = "rbxassetid://10723356210",
	["file-check-2"] = "rbxassetid://10723356100",
	["file-clock"] = "rbxassetid://10723356329",
	["file-code"] = "rbxassetid://10723356507",
	["file-cog"] = "rbxassetid://10723356830",
	["file-cog-2"] = "rbxassetid://10723356676",
	["file-diff"] = "rbxassetid://10723357039",
	["file-digit"] = "rbxassetid://10723357151",
	["file-down"] = "rbxassetid://10723357322",
	["file-edit"] = "rbxassetid://10723357495",
	["file-heart"] = "rbxassetid://10723357637",
	["file-image"] = "rbxassetid://10723357790",
	["file-input"] = "rbxassetid://10723357933",
	["file-json"] = "rbxassetid://10723364435",
	["file-json-2"] = "rbxassetid://10723364361",
	["file-key"] = "rbxassetid://10723364605",
	["file-key-2"] = "rbxassetid://10723364515",
	["file-line-chart"] = "rbxassetid://10723364725",
	["file-lock"] = "rbxassetid://10723364957",
	["file-lock-2"] = "rbxassetid://10723364861",
	["file-minus"] = "rbxassetid://10723365254",
	["file-minus-2"] = "rbxassetid://10723365086",
	["file-output"] = "rbxassetid://10723365457",
	["file-pie-chart"] = "rbxassetid://10723365598",
	["file-plus"] = "rbxassetid://10723365877",
	["file-plus-2"] = "rbxassetid://10723365766",
	["file-question"] = "rbxassetid://10723365987",
	["file-scan"] = "rbxassetid://10723366167",
	["file-search"] = "rbxassetid://10723366550",
	["file-search-2"] = "rbxassetid://10723366340",
	["file-signature"] = "rbxassetid://10723366741",
	["file-spreadsheet"] = "rbxassetid://10723366962",
	["file-symlink"] = "rbxassetid://10723367098",
	["file-terminal"] = "rbxassetid://10723367244",
	["file-text"] = "rbxassetid://10723367380",
	["file-type"] = "rbxassetid://10723367606",
	["file-type-2"] = "rbxassetid://10723367509",
	["file-up"] = "rbxassetid://10723367734",
	["file-video"] = "rbxassetid://10723373884",
	["file-video-2"] = "rbxassetid://10723367834",
	["file-volume"] = "rbxassetid://10723374172",
	["file-volume-2"] = "rbxassetid://10723374030",
	["file-warning"] = "rbxassetid://10723374276",
	["file-x"] = "rbxassetid://10723374544",
	["file-x-2"] = "rbxassetid://10723374378",
	["files"] = "rbxassetid://10723374759",
	["film"] = "rbxassetid://10723374981",
	["filter"] = "rbxassetid://10723375128",
	["fingerprint"] = "rbxassetid://10723375250",
	["flag"] = "rbxassetid://10723375890",
	["flag-off"] = "rbxassetid://10723375443",
	["flag-triangle-left"] = "rbxassetid://10723375608",
	["flag-triangle-right"] = "rbxassetid://10723375727",
	["flame"] = "rbxassetid://10723376114",
	["flashlight"] = "rbxassetid://10723376471",
	["flashlight-off"] = "rbxassetid://10723376365",
	["flask-conical"] = "rbxassetid://10734883986",
	["flask-round"] = "rbxassetid://10723376614",
	["flip-horizontal"] = "rbxassetid://10723376884",
	["flip-horizontal-2"] = "rbxassetid://10723376745",
	["flip-vertical"] = "rbxassetid://10723377138",
	["flip-vertical-2"] = "rbxassetid://10723377026",
	["flower"] = "rbxassetid://10747830374",
	["flower-2"] = "rbxassetid://10723377305",
	["focus"] = "rbxassetid://10723377537",
	["folder"] = "rbxassetid://10723387563",
	["folder-archive"] = "rbxassetid://10723384478",
	["folder-check"] = "rbxassetid://10723384605",
	["folder-clock"] = "rbxassetid://10723384731",
	["folder-closed"] = "rbxassetid://10723384893",
	["folder-cog"] = "rbxassetid://10723385213",
	["folder-cog-2"] = "rbxassetid://10723385036",
	["folder-down"] = "rbxassetid://10723385338",
	["folder-edit"] = "rbxassetid://10723385445",
	["folder-heart"] = "rbxassetid://10723385545",
	["folder-input"] = "rbxassetid://10723385721",
	["folder-key"] = "rbxassetid://10723385848",
	["folder-lock"] = "rbxassetid://10723386005",
	["folder-minus"] = "rbxassetid://10723386127",
	["folder-open"] = "rbxassetid://10723386277",
	["folder-output"] = "rbxassetid://10723386386",
	["folder-plus"] = "rbxassetid://10723386531",
	["folder-search"] = "rbxassetid://10723386787",
	["folder-search-2"] = "rbxassetid://10723386674",
	["folder-symlink"] = "rbxassetid://10723386930",
	["folder-tree"] = "rbxassetid://10723387085",
	["folder-up"] = "rbxassetid://10723387265",
	["folder-x"] = "rbxassetid://10723387448",
	["folders"] = "rbxassetid://10723387721",
	["form-input"] = "rbxassetid://10723387841",
	["forward"] = "rbxassetid://10723388016",
	["frame"] = "rbxassetid://10723394389",
	["framer"] = "rbxassetid://10723394565",
	["frown"] = "rbxassetid://10723394681",
	["fuel"] = "rbxassetid://10723394846",
	["function-square"] = "rbxassetid://10723395041",
	["gamepad"] = "rbxassetid://10723395457",
	["gamepad-2"] = "rbxassetid://10723395215",
	["gauge"] = "rbxassetid://10723395708",
	["gavel"] = "rbxassetid://10723395896",
	["gem"] = "rbxassetid://10723396000",
	["ghost"] = "rbxassetid://10723396107",
	["gift"] = "rbxassetid://10723396402",
	["gift-card"] = "rbxassetid://10723396225",
	["git-branch"] = "rbxassetid://10723396676",
	["git-branch-plus"] = "rbxassetid://10723396542",
	["git-commit"] = "rbxassetid://10723396812",
	["git-compare"] = "rbxassetid://10723396954",
	["git-fork"] = "rbxassetid://10723397049",
	["git-merge"] = "rbxassetid://10723397165",
	["git-pull-request"] = "rbxassetid://10723397431",
	["git-pull-request-closed"] = "rbxassetid://10723397268",
	["git-pull-request-draft"] = "rbxassetid://10734884302",
	["glass"] = "rbxassetid://10723397788",
	["glass-2"] = "rbxassetid://10723397529",
	["glass-water"] = "rbxassetid://10723397678",
	["glasses"] = "rbxassetid://10723397895",
	["globe"] = "rbxassetid://10723404337",
	["globe-2"] = "rbxassetid://10723398002",
	["grab"] = "rbxassetid://10723404472",
	["graduation-cap"] = "rbxassetid://10723404691",
	["grape"] = "rbxassetid://10723404822",
	["grid"] = "rbxassetid://10723404936",
	["grip-horizontal"] = "rbxassetid://10723405089",
	["grip-vertical"] = "rbxassetid://10723405236",
	["hammer"] = "rbxassetid://10723405360",
	["hand"] = "rbxassetid://10723405649",
	["hand-metal"] = "rbxassetid://10723405508",
	["hard-drive"] = "rbxassetid://10723405749",
	["hard-hat"] = "rbxassetid://10723405859",
	["hash"] = "rbxassetid://10723405975",
	["haze"] = "rbxassetid://10723406078",
	["headphones"] = "rbxassetid://10723406165",
	["heart"] = "rbxassetid://10723406885",
	["heart-crack"] = "rbxassetid://10723406299",
	["heart-handshake"] = "rbxassetid://10723406480",
	["heart-off"] = "rbxassetid://10723406662",
	["heart-pulse"] = "rbxassetid://10723406795",
	["help-circle"] = "rbxassetid://10723406988",
	["hexagon"] = "rbxassetid://10723407092",
	["highlighter"] = "rbxassetid://10723407192",
	["history"] = "rbxassetid://10723407335",
	["home"] = "rbxassetid://10723407389",
	["hourglass"] = "rbxassetid://10723407498",
	["ice-cream"] = "rbxassetid://10723414308",
	["image"] = "rbxassetid://10723415040",
	["image-minus"] = "rbxassetid://10723414487",
	["image-off"] = "rbxassetid://10723414677",
	["image-plus"] = "rbxassetid://10723414827",
	["import"] = "rbxassetid://10723415205",
	["inbox"] = "rbxassetid://10723415335",
	["indent"] = "rbxassetid://10723415494",
	["indian-rupee"] = "rbxassetid://10723415642",
	["infinity"] = "rbxassetid://10723415766",
	["info"] = "rbxassetid://10723415903",
	["inspect"] = "rbxassetid://10723416057",
	["italic"] = "rbxassetid://10723416195",
	["japanese-yen"] = "rbxassetid://10723416363",
	["joystick"] = "rbxassetid://10723416527",
	["key"] = "rbxassetid://10723416652",
	["keyboard"] = "rbxassetid://10723416765",
	["lamp"] = "rbxassetid://10723417513",
	["lamp-ceiling"] = "rbxassetid://10723416922",
	["lamp-desk"] = "rbxassetid://10723417016",
	["lamp-floor"] = "rbxassetid://10723417131",
	["lamp-wall-down"] = "rbxassetid://10723417240",
	["lamp-wall-up"] = "rbxassetid://10723417356",
	["landmark"] = "rbxassetid://10723417608",
	["languages"] = "rbxassetid://10723417703",
	["laptop"] = "rbxassetid://10723423881",
	["laptop-2"] = "rbxassetid://10723417797",
	["lasso"] = "rbxassetid://10723424235",
	["lasso-select"] = "rbxassetid://10723424058",
	["laugh"] = "rbxassetid://10723424372",
	["layers"] = "rbxassetid://10723424505",
	["layout"] = "rbxassetid://10723425376",
	["layout-dashboard"] = "rbxassetid://10723424646",
	["layout-grid"] = "rbxassetid://10723424838",
	["layout-list"] = "rbxassetid://10723424963",
	["layout-template"] = "rbxassetid://10723425187",
	["leaf"] = "rbxassetid://10723425539",
	["library"] = "rbxassetid://10723425615",
	["life-buoy"] = "rbxassetid://10723425685",
	["lightbulb"] = "rbxassetid://10723425852",
	["lightbulb-off"] = "rbxassetid://10723425762",
	["line-chart"] = "rbxassetid://10723426393",
	["link"] = "rbxassetid://10723426722",
	["link-2"] = "rbxassetid://10723426595",
	["link-2-off"] = "rbxassetid://10723426513",
	["list"] = "rbxassetid://10723433811",
	["list-checks"] = "rbxassetid://10734884548",
	["list-end"] = "rbxassetid://10723426886",
	["list-minus"] = "rbxassetid://10723426986",
	["list-music"] = "rbxassetid://10723427081",
	["list-ordered"] = "rbxassetid://10723427199",
	["list-plus"] = "rbxassetid://10723427334",
	["list-start"] = "rbxassetid://10723427494",
	["list-video"] = "rbxassetid://10723427619",
	["list-x"] = "rbxassetid://10723433655",
	["loader"] = "rbxassetid://10723434070",
	["loader-2"] = "rbxassetid://10723433935",
	["locate"] = "rbxassetid://10723434557",
	["locate-fixed"] = "rbxassetid://10723434236",
	["locate-off"] = "rbxassetid://10723434379",
	["lock"] = "rbxassetid://10723434711",
	["log-in"] = "rbxassetid://10723434830",
	["log-out"] = "rbxassetid://10723434906",
	["luggage"] = "rbxassetid://10723434993",
	["magnet"] = "rbxassetid://10723435069",
	["mail"] = "rbxassetid://10734885430",
	["mail-check"] = "rbxassetid://10723435182",
	["mail-minus"] = "rbxassetid://10723435261",
	["mail-open"] = "rbxassetid://10723435342",
	["mail-plus"] = "rbxassetid://10723435443",
	["mail-question"] = "rbxassetid://10723435515",
	["mail-search"] = "rbxassetid://10734884739",
	["mail-warning"] = "rbxassetid://10734885015",
	["mail-x"] = "rbxassetid://10734885247",
	["mails"] = "rbxassetid://10734885614",
	["map"] = "rbxassetid://10734886202",
	["map-pin"] = "rbxassetid://10734886004",
	["map-pin-off"] = "rbxassetid://10734885803",
	["maximize"] = "rbxassetid://10734886735",
	["maximize-2"] = "rbxassetid://10734886496",
	["medal"] = "rbxassetid://10734887072",
	["megaphone"] = "rbxassetid://10734887454",
	["megaphone-off"] = "rbxassetid://10734887311",
	["meh"] = "rbxassetid://10734887603",
	["menu"] = "rbxassetid://10734887784",
	["message-circle"] = "rbxassetid://10734888000",
	["message-square"] = "rbxassetid://10734888228",
	["mic"] = "rbxassetid://10734888864",
	["mic-2"] = "rbxassetid://10734888430",
	["mic-off"] = "rbxassetid://10734888646",
	["microscope"] = "rbxassetid://10734889106",
	["microwave"] = "rbxassetid://10734895076",
	["milestone"] = "rbxassetid://10734895310",
	["minimize"] = "rbxassetid://10734895698",
	["minimize-2"] = "rbxassetid://10734895530",
	["minus"] = "rbxassetid://10734896206",
	["minus-circle"] = "rbxassetid://10734895856",
	["minus-square"] = "rbxassetid://10734896029",
	["monitor"] = "rbxassetid://10734896881",
	["monitor-off"] = "rbxassetid://10734896360",
	["monitor-speaker"] = "rbxassetid://10734896512",
	["moon"] = "rbxassetid://10734897102",
	["more-horizontal"] = "rbxassetid://10734897250",
	["more-vertical"] = "rbxassetid://10734897387",
	["mountain"] = "rbxassetid://10734897956",
	["mountain-snow"] = "rbxassetid://10734897665",
	["mouse"] = "rbxassetid://10734898592",
	["mouse-pointer"] = "rbxassetid://10734898476",
	["mouse-pointer-2"] = "rbxassetid://10734898194",
	["mouse-pointer-click"] = "rbxassetid://10734898355",
	["move"] = "rbxassetid://10734900011",
	["move-3d"] = "rbxassetid://10734898756",
	["move-diagonal"] = "rbxassetid://10734899164",
	["move-diagonal-2"] = "rbxassetid://10734898934",
	["move-horizontal"] = "rbxassetid://10734899414",
	["move-vertical"] = "rbxassetid://10734899821",
	["music"] = "rbxassetid://10734905958",
	["music-2"] = "rbxassetid://10734900215",
	["music-3"] = "rbxassetid://10734905665",
	["music-4"] = "rbxassetid://10734905823",
	["navigation"] = "rbxassetid://10734906744",
	["navigation-2"] = "rbxassetid://10734906332",
	["navigation-2-off"] = "rbxassetid://10734906144",
	["navigation-off"] = "rbxassetid://10734906580",
	["network"] = "rbxassetid://10734906975",
	["newspaper"] = "rbxassetid://10734907168",
	["octagon"] = "rbxassetid://10734907361",
	["option"] = "rbxassetid://10734907649",
	["outdent"] = "rbxassetid://10734907933",
	["package"] = "rbxassetid://10734909540",
	["package-2"] = "rbxassetid://10734908151",
	["package-check"] = "rbxassetid://10734908384",
	["package-minus"] = "rbxassetid://10734908626",
	["package-open"] = "rbxassetid://10734908793",
	["package-plus"] = "rbxassetid://10734909016",
	["package-search"] = "rbxassetid://10734909196",
	["package-x"] = "rbxassetid://10734909375",
	["paint-bucket"] = "rbxassetid://10734909847",
	["paintbrush"] = "rbxassetid://10734910187",
	["paintbrush-2"] = "rbxassetid://10734910030",
	["palette"] = "rbxassetid://10734910430",
	["palmtree"] = "rbxassetid://10734910680",
	["paperclip"] = "rbxassetid://10734910927",
	["party-popper"] = "rbxassetid://10734918735",
	["pause"] = "rbxassetid://10734919336",
	["pause-circle"] = "rbxassetid://10735024209",
	["pause-octagon"] = "rbxassetid://10734919143",
	["pen-tool"] = "rbxassetid://10734919503",
	["pencil"] = "rbxassetid://10734919691",
	["percent"] = "rbxassetid://10734919919",
	["person-standing"] = "rbxassetid://10734920149",
	["phone"] = "rbxassetid://10734921524",
	["phone-call"] = "rbxassetid://10734920305",
	["phone-forwarded"] = "rbxassetid://10734920508",
	["phone-incoming"] = "rbxassetid://10734920694",
	["phone-missed"] = "rbxassetid://10734920845",
	["phone-off"] = "rbxassetid://10734921077",
	["phone-outgoing"] = "rbxassetid://10734921288",
	["pie-chart"] = "rbxassetid://10734921727",
	["piggy-bank"] = "rbxassetid://10734921935",
	["pin"] = "rbxassetid://10734922324",
	["pin-off"] = "rbxassetid://10734922180",
	["pipette"] = "rbxassetid://10734922497",
	["pizza"] = "rbxassetid://10734922774",
	["plane"] = "rbxassetid://10734922971",
	["play"] = "rbxassetid://10734923549",
	["play-circle"] = "rbxassetid://10734923214",
	["plus"] = "rbxassetid://10734924532",
	["plus-circle"] = "rbxassetid://10734923868",
	["plus-square"] = "rbxassetid://10734924219",
	["podcast"] = "rbxassetid://10734929553",
	["pointer"] = "rbxassetid://10734929723",
	["pound-sterling"] = "rbxassetid://10734929981",
	["power"] = "rbxassetid://10734930466",
	["power-off"] = "rbxassetid://10734930257",
	["printer"] = "rbxassetid://10734930632",
	["puzzle"] = "rbxassetid://10734930886",
	["quote"] = "rbxassetid://10734931234",
	["radio"] = "rbxassetid://10734931596",
	["radio-receiver"] = "rbxassetid://10734931402",
	["rectangle-horizontal"] = "rbxassetid://10734931777",
	["rectangle-vertical"] = "rbxassetid://10734932081",
	["recycle"] = "rbxassetid://10734932295",
	["redo"] = "rbxassetid://10734932822",
	["redo-2"] = "rbxassetid://10734932586",
	["refresh-ccw"] = "rbxassetid://10734933056",
	["refresh-cw"] = "rbxassetid://10734933222",
	["refrigerator"] = "rbxassetid://10734933465",
	["regex"] = "rbxassetid://10734933655",
	["repeat"] = "rbxassetid://10734933966",
	["repeat-1"] = "rbxassetid://10734933826",
	["reply"] = "rbxassetid://10734934252",
	["reply-all"] = "rbxassetid://10734934132",
	["rewind"] = "rbxassetid://10734934347",
	["rocket"] = "rbxassetid://10734934585",
	["rocking-chair"] = "rbxassetid://10734939942",
	["rotate-3d"] = "rbxassetid://10734940107",
	["rotate-ccw"] = "rbxassetid://10734940376",
	["rotate-cw"] = "rbxassetid://10734940654",
	["rss"] = "rbxassetid://10734940825",
	["ruler"] = "rbxassetid://10734941018",
	["russian-ruble"] = "rbxassetid://10734941199",
	["sailboat"] = "rbxassetid://10734941354",
	["save"] = "rbxassetid://10734941499",
	["scale"] = "rbxassetid://10734941912",
	["scale-3d"] = "rbxassetid://10734941739",
	["scaling"] = "rbxassetid://10734942072",
	["scan"] = "rbxassetid://10734942565",
	["scan-face"] = "rbxassetid://10734942198",
	["scan-line"] = "rbxassetid://10734942351",
	["scissors"] = "rbxassetid://10734942778",
	["screen-share"] = "rbxassetid://10734943193",
	["screen-share-off"] = "rbxassetid://10734942967",
	["scroll"] = "rbxassetid://10734943448",
	["search"] = "rbxassetid://10734943674",
	["send"] = "rbxassetid://10734943902",
	["separator-horizontal"] = "rbxassetid://10734944115",
	["separator-vertical"] = "rbxassetid://10734944326",
	["server"] = "rbxassetid://10734949856",
	["server-cog"] = "rbxassetid://10734944444",
	["server-crash"] = "rbxassetid://10734944554",
	["server-off"] = "rbxassetid://10734944668",
	["settings"] = "rbxassetid://10734950309",
	["settings-2"] = "rbxassetid://10734950020",
	["share"] = "rbxassetid://10734950813",
	["share-2"] = "rbxassetid://10734950553",
	["sheet"] = "rbxassetid://10734951038",
	["shield"] = "rbxassetid://10734951847",
	["shield-alert"] = "rbxassetid://10734951173",
	["shield-check"] = "rbxassetid://10734951367",
	["shield-close"] = "rbxassetid://10734951535",
	["shield-off"] = "rbxassetid://10734951684",
	["shirt"] = "rbxassetid://10734952036",
	["shopping-bag"] = "rbxassetid://10734952273",
	["shopping-cart"] = "rbxassetid://10734952479",
	["shovel"] = "rbxassetid://10734952773",
	["shower-head"] = "rbxassetid://10734952942",
	["shrink"] = "rbxassetid://10734953073",
	["shrub"] = "rbxassetid://10734953241",
	["shuffle"] = "rbxassetid://10734953451",
	["sidebar"] = "rbxassetid://10734954301",
	["sidebar-close"] = "rbxassetid://10734953715",
	["sidebar-open"] = "rbxassetid://10734954000",
	["sigma"] = "rbxassetid://10734954538",
	["signal"] = "rbxassetid://10734961133",
	["signal-high"] = "rbxassetid://10734954807",
	["signal-low"] = "rbxassetid://10734955080",
	["signal-medium"] = "rbxassetid://10734955336",
	["signal-zero"] = "rbxassetid://10734960878",
	["siren"] = "rbxassetid://10734961284",
	["skip-back"] = "rbxassetid://10734961526",
	["skip-forward"] = "rbxassetid://10734961809",
	["skull"] = "rbxassetid://10734962068",
	["slack"] = "rbxassetid://10734962339",
	["slash"] = "rbxassetid://10734962600",
	["slice"] = "rbxassetid://10734963024",
	["sliders"] = "rbxassetid://10734963400",
	["sliders-horizontal"] = "rbxassetid://10734963191",
	["smartphone"] = "rbxassetid://10734963940",
	["smartphone-charging"] = "rbxassetid://10734963671",
	["smile"] = "rbxassetid://10734964441",
	["smile-plus"] = "rbxassetid://10734964188",
	["snowflake"] = "rbxassetid://10734964600",
	["sofa"] = "rbxassetid://10734964852",
	["sort-asc"] = "rbxassetid://10734965115",
	["sort-desc"] = "rbxassetid://10734965287",
	["speaker"] = "rbxassetid://10734965419",
	["sprout"] = "rbxassetid://10734965572",
	["square"] = "rbxassetid://10734965702",
	["star"] = "rbxassetid://10734966248",
	["star-half"] = "rbxassetid://10734965897",
	["star-off"] = "rbxassetid://10734966097",
	["stethoscope"] = "rbxassetid://10734966384",
	["sticker"] = "rbxassetid://10734972234",
	["sticky-note"] = "rbxassetid://10734972463",
	["stop-circle"] = "rbxassetid://10734972621",
	["stretch-horizontal"] = "rbxassetid://10734972862",
	["stretch-vertical"] = "rbxassetid://10734973130",
	["strikethrough"] = "rbxassetid://10734973290",
	["subscript"] = "rbxassetid://10734973457",
	["sun"] = "rbxassetid://10734974297",
	["sun-dim"] = "rbxassetid://10734973645",
	["sun-medium"] = "rbxassetid://10734973778",
	["sun-moon"] = "rbxassetid://10734973999",
	["sun-snow"] = "rbxassetid://10734974130",
	["sunrise"] = "rbxassetid://10734974522",
	["sunset"] = "rbxassetid://10734974689",
	["superscript"] = "rbxassetid://10734974850",
	["swiss-franc"] = "rbxassetid://10734975024",
	["switch-camera"] = "rbxassetid://10734975214",
	["sword"] = "rbxassetid://10734975486",
	["swords"] = "rbxassetid://10734975692",
	["syringe"] = "rbxassetid://10734975932",
	["table"] = "rbxassetid://10734976230",
	["table-2"] = "rbxassetid://10734976097",
	["tablet"] = "rbxassetid://10734976394",
	["tag"] = "rbxassetid://10734976528",
	["tags"] = "rbxassetid://10734976739",
	["target"] = "rbxassetid://10734977012",
	["tent"] = "rbxassetid://10734981750",
	["terminal"] = "rbxassetid://10734982144",
	["terminal-square"] = "rbxassetid://10734981995",
	["text-cursor"] = "rbxassetid://10734982395",
	["text-cursor-input"] = "rbxassetid://10734982297",
	["thermometer"] = "rbxassetid://10734983134",
	["thermometer-snowflake"] = "rbxassetid://10734982571",
	["thermometer-sun"] = "rbxassetid://10734982771",
	["thumbs-down"] = "rbxassetid://10734983359",
	["thumbs-up"] = "rbxassetid://10734983629",
	["ticket"] = "rbxassetid://10734983868",
	["timer"] = "rbxassetid://10734984606",
	["timer-off"] = "rbxassetid://10734984138",
	["timer-reset"] = "rbxassetid://10734984355",
	["toggle-left"] = "rbxassetid://10734984834",
	["toggle-right"] = "rbxassetid://10734985040",
	["tornado"] = "rbxassetid://10734985247",
	["toy-brick"] = "rbxassetid://10747361919",
	["train"] = "rbxassetid://10747362105",
	["trash"] = "rbxassetid://10747362393",
	["trash-2"] = "rbxassetid://10747362241",
	["tree-deciduous"] = "rbxassetid://10747362534",
	["tree-pine"] = "rbxassetid://10747362748",
	["trees"] = "rbxassetid://10747363016",
	["trending-down"] = "rbxassetid://10747363205",
	["trending-up"] = "rbxassetid://10747363465",
	["triangle"] = "rbxassetid://10747363621",
	["trophy"] = "rbxassetid://10747363809",
	["truck"] = "rbxassetid://10747364031",
	["tv"] = "rbxassetid://10747364593",
	["tv-2"] = "rbxassetid://10747364302",
	["type"] = "rbxassetid://10747364761",
	["umbrella"] = "rbxassetid://10747364971",
	["underline"] = "rbxassetid://10747365191",
	["undo"] = "rbxassetid://10747365484",
	["undo-2"] = "rbxassetid://10747365359",
	["unlink"] = "rbxassetid://10747365771",
	["unlink-2"] = "rbxassetid://10747397871",
	["unlock"] = "rbxassetid://10747366027",
	["upload"] = "rbxassetid://10747366434",
	["upload-cloud"] = "rbxassetid://10747366266",
	["usb"] = "rbxassetid://10747366606",
	["user"] = "rbxassetid://10747373176",
	["user-check"] = "rbxassetid://10747371901",
	["user-cog"] = "rbxassetid://10747372167",
	["user-minus"] = "rbxassetid://10747372346",
	["user-plus"] = "rbxassetid://10747372702",
	["user-x"] = "rbxassetid://10747372992",
	["users"] = "rbxassetid://10747373426",
	["utensils"] = "rbxassetid://10747373821",
	["utensils-crossed"] = "rbxassetid://10747373629",
	["venetian-mask"] = "rbxassetid://10747374003",
	["verified"] = "rbxassetid://10747374131",
	["vibrate"] = "rbxassetid://10747374489",
	["vibrate-off"] = "rbxassetid://10747374269",
	["video"] = "rbxassetid://10747374938",
	["video-off"] = "rbxassetid://10747374721",
	["view"] = "rbxassetid://10747375132",
	["voicemail"] = "rbxassetid://10747375281",
	["volume"] = "rbxassetid://10747376008",
	["volume-1"] = "rbxassetid://10747375450",
	["volume-2"] = "rbxassetid://10747375679",
	["volume-x"] = "rbxassetid://10747375880",
	["wallet"] = "rbxassetid://10747376205",
	["wand"] = "rbxassetid://10747376565",
	["wand-2"] = "rbxassetid://10747376349",
	["watch"] = "rbxassetid://10747376722",
	["waves"] = "rbxassetid://10747376931",
	["webcam"] = "rbxassetid://10747381992",
	["wifi"] = "rbxassetid://10747382504",
	["wifi-off"] = "rbxassetid://10747382268",
	["wind"] = "rbxassetid://10747382750",
	["wrap-text"] = "rbxassetid://10747383065",
	["wrench"] = "rbxassetid://10747383470",
	["x"] = "rbxassetid://10747384394",
	["x-circle"] = "rbxassetid://10747383819",
	["x-octagon"] = "rbxassetid://10747384037",
	["x-square"] = "rbxassetid://10747384217",
	["zoom-in"] = "rbxassetid://10747384552",
	["zoom-out"] = "rbxassetid://10747384679"
}
--local IconList = loadstring(game:HttpGet("https://raw.githubusercontent.com/SecretReal/Secret/refs/heads/main/Icon/Icon.lua"))()
local function GetLogo(i)
	if IconList[i] then
		return IconList[i]
	elseif type(i) == 'string' and not i:find('rbxassetid://') then
		return "rbxassetid://".. i
	elseif type(i) == 'number' then
		return "rbxassetid://".. i
	else
		return i
	end
end
local function NewClick(i)
	return New("TextButton", {
		Name = "Click",
		Parent = i,
		Active = true,
		BackgroundColor3 = Color3.fromRGB(255,255,255),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0,0,0),
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0,1, 0),
		Font = Enum.Font.SourceSans,
		Text = "",
		TextSize = 14
	})
end
local function JustClick(c,p)
	local Mouse = game.Players.LocalPlayer:GetMouse()

	local relativeX = Mouse.X - c.AbsolutePosition.X
	local relativeY = Mouse.Y - c.AbsolutePosition.Y

	if relativeX < 0 or relativeY < 0 or relativeX > c.AbsoluteSize.X or relativeY > c.AbsoluteSize.Y then
		return
	end

	local ClickButtonCircle = New("Frame", {
		Name = "ClickButtonCircle",
		Parent = p,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 0.5,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0, relativeX, 0, relativeY),
		Size = UDim2.new(0, 0, 0, 0),
		ZIndex = 10
	})

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = ClickButtonCircle

	local expandTween = game:GetService("TweenService"):Create(ClickButtonCircle, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, c.AbsoluteSize.X * 1.5, 0, c.AbsoluteSize.X * 1.5),
		BackgroundTransparency = 1
	})

	expandTween.Completed:Connect(function()
		ClickButtonCircle:Destroy()
	end)

	expandTween:Play()
end

function Library:CreateWindow(info)

	local HubName = infolib(info, "name") or infolib(info, "title") or  infolib(info, "text")
	local IconHub = infolib(info, "logo") or infolib(info, "icon")
	local KeyCloseUI = infolib(info, "keybind") or Enum.KeyCode.LeftControl
	local Background, ScrollingFrame_1

	local ScreenGui = New("ScreenGui", {
		Name = "Exclusive",
		Parent = not game:GetService("RunService"):IsStudio() and game:GetService("CoreGui") or game:GetService("Players").LocalPlayer.PlayerGui
	}, {
		New("Frame", {
			Name = "Background",
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(2, 2, 2),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, 0, 0, 0),
			ClipsDescendants = true
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0,10)
			}),
			New("ImageLabel", {
				Name = "Logo",
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundTransparency = 1,
				Position = UDim2.new(0.0299999993, 0,0.0799999982, 0),
				Size = UDim2.new(0, 45,0, 45),
				Image = GetLogo(IconHub)
			}),
			New("TextLabel", {
				Name = "HubName",
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Position = UDim2.new(0.248999998, 0,0.0599999987, 0),
				Size = UDim2.new(0, 63,0, 30),
				Font = Enum.Font.SourceSansBold,
				Text = tostring(HubName),
				TextSize = 21,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = Color3.fromRGB(255,255,255)
			}),
			New("TextLabel", {
				Name = "Day",
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Position = UDim2.new(0.248999998, 0,0.100000001, 0),
				Size = UDim2.new(0, 63,0, 30),
				FontFace = Font.new("rbxassetid://16658237174", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
				Text = os.date("%B %d, %Y"),
				TextColor3 = Color3.fromRGB(255,255,255),
				TextSize = 10,
				TextTransparency = 0.5,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			New("Frame", {
				Name = "Line",
				BackgroundColor3 = Color3.fromRGB(255,255,255),
				BackgroundTransparency = 0.5,
				BorderSizePixel = 0,
				Position = UDim2.new(0, 0,0.145999998, 0),
				Size = UDim2.new(1, 0,0, 2)
			}, {
				New("UIGradient", {
					Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(13, 13, 13)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 12, 12))}
				})
			}),
			New("Frame", {
				Name = "Tablist",
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = Color3.fromRGB(255,255,255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0,0,0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.970000029, 0,0.0799999982, 0),
				Size = UDim2.new(0, 182,0, 45)
			}, {
				New("ScrollingFrame", {
					Active = true,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,1, 0),
					ClipsDescendants = true,
					AutomaticCanvasSize = Enum.AutomaticSize.None,
					BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png",
					CanvasPosition = Vector2.new(0, 0),
					CanvasSize = UDim2.new(2, 0,0, 0),
					ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
					HorizontalScrollBarInset = Enum.ScrollBarInset.None,
					MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
					ScrollBarImageColor3 = Color3.fromRGB(0,0,0),
					ScrollBarImageTransparency = 0,
					ScrollBarThickness = 0,
					ScrollingDirection = Enum.ScrollingDirection.XY,
					TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png",
					VerticalScrollBarInset = Enum.ScrollBarInset.None,
					VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
				}, {
					New("UIListLayout", {
						Padding = UDim.new(0,8),
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					})
				}, function(scrollingframe)
					ScrollingFrame_1 = scrollingframe
				end)
			})
		}, function(background)
			Background = background
		end)
	})

	local CloseUI = Instance.new("TextButton")
	local UICorner_1 = Instance.new("UICorner")
	local ClouseUIIcon = Instance.new("ImageLabel")
	local BackgroundGradient_1 = Instance.new("UIGradient")
	local FPSText = Instance.new("TextLabel")
	local ServerTimeText = Instance.new("TextLabel")

	CloseUI.Name = "CloseUI"
	CloseUI.Parent = ScreenGui
	CloseUI.Active = true
	CloseUI.AnchorPoint = Vector2.new(0.5, 0.5)
	CloseUI.BackgroundColor3 = Color3.fromRGB(58,58,58)
	CloseUI.BorderColor3 = Color3.fromRGB(0,0,0)
	CloseUI.BorderSizePixel = 0
	CloseUI.Position = UDim2.new(0.0909999982, 0,0.186000004, 0)
	CloseUI.Size = UDim2.new(0, 70,0, 30)
	CloseUI.Font = Enum.Font.Gotham
	CloseUI.Text = ""
	CloseUI.TextColor3 = Color3.fromRGB(255,255,255)
	CloseUI.TextSize = 14
	CloseUI.BackgroundTransparency = 1

	UICorner_1.Parent = CloseUI
	UICorner_1.CornerRadius = UDim.new(1,0)

	ClouseUIIcon.Parent = CloseUI
	ClouseUIIcon.AnchorPoint = Vector2.new(0.5, 0.5)
	ClouseUIIcon.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ClouseUIIcon.BackgroundTransparency = 1
	ClouseUIIcon.BorderColor3 = Color3.fromRGB(0,0,0)
	ClouseUIIcon.BorderSizePixel = 0
	ClouseUIIcon.Position = UDim2.new(0.5, 0,0.5, 0)
	ClouseUIIcon.Size = UDim2.new(0, 20,0, 20)
	if type(IconHub) == 'string' and not IconHub:find('rbxassetid://') then
		ClouseUIIcon.Image = "rbxassetid://".. IconHub
	elseif type(IconHub) == 'number' then
		ClouseUIIcon.Image = "rbxassetid://".. IconHub
	else
		ClouseUIIcon.Image = IconHub
	end
	ClouseUIIcon.ImageTransparency = 1

	BackgroundGradient_1.Name = "BackgroundGradient"
	BackgroundGradient_1.Parent = CloseUI
	BackgroundGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(13, 13, 13)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
	BackgroundGradient_1.Rotation = -100

	FPSText.Name = "FPSText"
	FPSText.Parent = CloseUI
	FPSText.AnchorPoint = Vector2.new(0.5, 0.5)
	FPSText.BackgroundColor3 = Color3.fromRGB(255,255,255)
	FPSText.BackgroundTransparency = 1
	FPSText.BorderColor3 = Color3.fromRGB(0,0,0)
	FPSText.BorderSizePixel = 0
	FPSText.Position = UDim2.new(0.5, 0,0.5, 0)
	FPSText.Size = UDim2.new(0.800000012, 0,1, 0)
	FPSText.Font = Enum.Font.Gotham
	FPSText.Text = "FPS : 60"
	FPSText.TextColor3 = Color3.fromRGB(255,255,255)
	FPSText.TextSize = 10
	FPSText.TextXAlignment = Enum.TextXAlignment.Left
	FPSText.TextTransparency = 1

	ServerTimeText.Name = "ServerTimeText"
	ServerTimeText.Parent = CloseUI
	ServerTimeText.AnchorPoint = Vector2.new(0.5, 0.5)
	ServerTimeText.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ServerTimeText.BackgroundTransparency = 1
	ServerTimeText.BorderColor3 = Color3.fromRGB(0,0,0)
	ServerTimeText.BorderSizePixel = 0
	ServerTimeText.Position = UDim2.new(0.5, 0,0.5, 0)
	ServerTimeText.Size = UDim2.new(0.800000012, 0,1, 0)
	ServerTimeText.Font = Enum.Font.Gotham
	ServerTimeText.Text = "00:00:00"
	ServerTimeText.TextColor3 = Color3.fromRGB(255,255,255)
	ServerTimeText.TextSize = 10
	ServerTimeText.TextXAlignment = Enum.TextXAlignment.Right
	ServerTimeText.TextTransparency = 1

	lak(CloseUI)

	local Sound_1 = Instance.new("Sound")

	Sound_1.Parent = CloseUI
	Sound_1.Volume = 0.3
	Sound_1.RollOffMode = Enum.RollOffMode.InverseTapered
	Sound_1.SoundId = "rbxassetid://17208361335"

	delay(0,function()
		Tw({
			v = CloseUI,
			t = 0.3,
			s = "Linear",
			d = "Out",
			g = {BackgroundTransparency = 0}
		}):Play()
		Tw({
			v = ClouseUIIcon,
			t = 0.3,
			s = "Linear",
			d = "Out",
			g = {ImageTransparency = 0}
		}):Play()
		Tw({
			v = Background,
			t = 0.3,
			s = "Linear",
			d = "Out",
			g = {Size = UDim2.new(0, 400,0, 300)}
		}):Play()
	end)

	local isopen = false
	local oripos

	local function closeopenui()
		isopen = not isopen
		if isopen then
			oripos = CloseUI.Position
			Tw({
				v = Background,
				t = 0.15,
				s = "Linear",
				d = "Out",
				g = {Size = UDim2.new(0, 0,0, 0)}
			}):Play()
			Tw({
				v = CloseUI,
				t = 0.15,
				s = "Back",
				d = "In",
				g = {Position = UDim2.new(.5, 0,.1, 0)}
			}):Play()
			Tw({
				v = FPSText,
				t = 0.3,
				s = "Linear",
				d = "Out",
				g = {TextTransparency = 0}
			}):Play()
			Tw({
				v = ServerTimeText,
				t = 0.3,
				s = "Linear",
				d = "Out",
				g = {TextTransparency = 0}
			}):Play()
			Tw({
				v = CloseUI,
				t = 0.3,
				s = "Back",
				d = "Out",
				g = {Size = UDim2.new(0, 200,0, 30)}
			}):Play()
		else
			Tw({
				v = Background,
				t = 0.15,
				s = "Linear",
				d = "Out",
				g = {Size = UDim2.new(0, 400,0, 300)}
			}):Play()
			Tw({
				v = CloseUI,
				t = 0.15,
				s = "Linear",
				d = "Out",
				g = {Position = oripos}
			}):Play()
			Tw({
				v = FPSText,
				t = 0.3,
				s = "Linear",
				d = "Out",
				g = {TextTransparency = 1}
			}):Play()
			Tw({
				v = ServerTimeText,
				t = 0.3,
				s = "Linear",
				d = "Out",
				g = {TextTransparency = 1}
			}):Play()
			Tw({
				v = CloseUI,
				t = 0.3,
				s = "Back",
				d = "Out",
				g = {Size = UDim2.new(0, 70,0, 30)}
			}):Play()
		end
	end

	CloseUI.MouseButton1Click:Connect(function()
		closeopenui()
	end)

	local fps = 0
	local lastTime = tick()

	game:GetService("RunService").RenderStepped:Connect(function()
		local currentTime = tick()
		local deltaTime = currentTime - lastTime
		lastTime = currentTime
		fps = 1 / deltaTime
	end)

	spawn(function()
		while wait(1) do
			pcall(function()
				local scripttime = game.Workspace.DistributedGameTime
				local seconds = scripttime%60
				local minutes = math.floor(scripttime/60%60)
				local hours = math.floor(scripttime/3600)
				local tempo = string.format("%02d:%02d:%02d", hours ,minutes, seconds)
				ServerTimeText.Text = tostring(tempo)
				FPSText.Text = "FPS : "..string.format("%.0f", fps)
			end)
		end
	end)

	game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
		if not gameProcessed and input.KeyCode == KeyCloseUI then
			closeopenui()
		end
	end)

	lak(Background)

	Library.Tab = {
		Value = false
	}

	function Library.Tab:CreateTab(info)

		local Title = infolib(info, "name") or infolib(info, "title") or "Tab"
		local Icon = infolib(info, "logo") or infolib(info, "icon")
		local PageLeft, PageRight

		local Tab = New("Frame", {
			Name = "Tab",
			Parent = ScrollingFrame_1,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0,0,0),
			BorderSizePixel = 0,
			Size = UDim2.new(0, 43,0, 35),
			ClipsDescendants = true,
		}, {
			New("UICorner", {
				CornerRadius = UDim.new(0,4)
			}),
			New("Frame", {
				Name = "List",
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(255,255,255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0,0,0),
				BorderSizePixel = 0,
				Position = UDim2.new(0.5, 0,0.5, 0),
				Size = UDim2.new(0.9, 0,0.9, 0)
			}, {
				New("UIListLayout", {
					Padding = UDim.new(0,5),
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				New("TextLabel", {
					Name = "Title",
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(0, 50,0, 5),
					Font = Enum.Font.GothamBold,
					Text = tostring(Title),
					TextColor3 = Color3.fromRGB(255,255,255),
					TextSize = 9,
					TextTransparency = 0.8
				}),
				New("Frame", {
					Name = "Icon",
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(0, 18,0, 18)
				}, {
					New("ImageLabel", {
						Name = "Icon",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(255,255,255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0,0,0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 0,0.5, 0),
						Size = UDim2.new(0, 15,0, 15),
						Image = GetLogo(Icon),
						ImageTransparency = 0.8
					})
				})
			})
		})

		local Page = New("Frame", {
			Name = "Page",
			Parent = Background,
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255,255,255),
			BackgroundTransparency = 1,
			BorderColor3 = Color3.fromRGB(0,0,0),
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 0,0.6, 0),
			Size = UDim2.new(0, 380,0, 240),
			Visible = false
		}, {
			New("UIListLayout", {
				Padding = UDim.new(0,5),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			New("ScrollingFrame", {
				Name = "PageLeft",
				Active = true,
				BackgroundColor3 = Color3.fromRGB(255,255,255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0,0,0),
				BorderSizePixel = 0,
				Size = UDim2.new(0.5, 0,1, 0),
				ClipsDescendants = true,
				AutomaticCanvasSize = Enum.AutomaticSize.None,
				BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png",
				CanvasPosition = Vector2.new(0, 0),
				ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
				HorizontalScrollBarInset = Enum.ScrollBarInset.None,
				MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
				ScrollBarImageColor3 = Color3.fromRGB(0,0,0),
				ScrollBarImageTransparency = 0,
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.XY,
				TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png",
				VerticalScrollBarInset = Enum.ScrollBarInset.None,
				VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
			}, {
				New("UIListLayout", {
					Padding = UDim.new(0,10),
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				})
			}, function(left)
				PageLeft = left
			end),
			New("ScrollingFrame", {
				Name = "PageRight",
				Active = true,
				BackgroundColor3 = Color3.fromRGB(255,255,255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0,0,0),
				BorderSizePixel = 0,
				Size = UDim2.new(0.5, 0,1, 0),
				ClipsDescendants = true,
				AutomaticCanvasSize = Enum.AutomaticSize.None,
				BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png",
				CanvasPosition = Vector2.new(0, 0),
				ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
				HorizontalScrollBarInset = Enum.ScrollBarInset.None,
				MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
				ScrollBarImageColor3 = Color3.fromRGB(0,0,0),
				ScrollBarImageTransparency = 0,
				ScrollBarThickness = 0,
				ScrollingDirection = Enum.ScrollingDirection.XY,
				TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png",
				VerticalScrollBarInset = Enum.ScrollBarInset.None,
				VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right
			}, {
				New("UIListLayout", {
					Padding = UDim.new(0,10),
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				})
			}, function(right)
				PageRight = right
			end)
		})

		local Click = NewClick(Tab)

		local function ui()
			Tw({
				v = Tab,
				t = 0.3,
				s = "Quint",
				d = "InOut",
				g = {BackgroundTransparency = 0.8}
			}):Play()
			Tw({
				v = Tab.List.Title,
				t = 0.3,
				s = "Quint",
				d = "InOut",
				g = {TextTransparency = 0}
			}):Play()
			Tw({
				v = Tab.List.Icon.Icon,
				t = 0.3,
				s = "Quint",
				d = "InOut",
				g = {ImageTransparency = 0}
			}):Play()
			delay(.15,function()
				Page.Visible = true
				Tw({
					v = Page,
					t = 0.3,
					s = "Quint",
					d = "InOut",
					g = {Position = UDim2.new(0.5, 0,0.57, 0)}
				}):Play()
			end)
		end

		Click.MouseButton1Click:Connect(function()
			JustClick(Click,Tab)
			for i,v in pairs(Background:GetChildren()) do
				if v.Name == "Page" then
					v.Visible = false
					v.Position = UDim2.new(0.5, 0,0.6, 0)
				end
			end
			for i,v in pairs(ScrollingFrame_1:GetChildren()) do
				if v:IsA("Frame") then
					Tw({
						v = v,
						t = 0.3,
						s = "Quint",
						d = "InOut",
						g = {BackgroundTransparency = 1}
					}):Play()
					Tw({
						v = v.List.Title,
						t = 0.3,
						s = "Quint",
						d = "InOut",
						g = {TextTransparency = 0.8}
					}):Play()
					Tw({
						v = v.List.Icon.Icon,
						t = 0.3,
						s = "Quint",
						d = "InOut",
						g = {ImageTransparency = 0.8}
					}):Play()
				end
			end
			ui()
		end)

		delay(0.3,function()
			if not Library.Tab.Value then
				ui()
				Library.Tab.Value = true
			end
		end)

		local function GetSide(side)
			if not side then
				return PageLeft
			end

			local sideLower = string.lower(tostring(side))
			if sideLower == "r" or sideLower == "right" or side == 2 then
				return PageRight
			elseif sideLower == "l" or sideLower == "left" or side == 1 then
				return PageLeft
			else
				return PageLeft
			end
		end

		Library.Section = {}

		function Library.Section:CreateSection(info)

			local Title = infolib(info, "name") or infolib(info, "title") or infolib(info, "text") or nil
			local Side = infolib(info, "side")

			local Section = New("Frame", {
				Parent = GetSide(Side),
				Name = "Section",
				BackgroundColor3 = Color3.fromRGB(13, 13, 13),
				BorderColor3 = Color3.fromRGB(0,0,0),
				BorderSizePixel = 0,
				Size = UDim2.new(0.99000001, 0,0, 500),
				ClipsDescendants = true
			}, {
				New("UICorner"),
				New("UIListLayout", {
					Padding = UDim.new(0,5),
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				New("TextLabel", {
					Name = "SectionTitle",
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,0, 20),
					Font = Enum.Font.GothamBold,
					Text = tostring(Title),
					TextColor3 = Color3.fromRGB(255,255,255),
					TextSize = 10
				})
			})

			Library.Main = {}

			function Library.Main:CreateToggle(info)

				local Title = infolib(info, "name") or infolib(info, "title") or infolib(info, "text") or nil
				local Value = infolib(info, "value") or infolib(info, "defuse") or false
				local Callback = infolib(info, "callback") or function() end

				local Toggle = New("Frame", {
					Name = "Toggle",
					Parent = Section,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,0, 25),
				}, {
					New("Frame", {
						Name = "FrameClick",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(255, 0, 89),
						BorderColor3 = Color3.fromRGB(0,0,0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 0,0.5, 0),
						Size = UDim2.new(0.899999976, 0,0, 25),
						BackgroundTransparency = 1,
						ClipsDescendants = true
					}, {
						New("Frame", {
							Name = "ListfunctionToggle",
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundColor3 = Color3.fromRGB(13, 13, 13),
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.5, 0,0.5, 0),
							Size = UDim2.new(1, 0,1, 0)
						}, {
							New("UIListLayout", {
								Padding = UDim.new(0,8),
								FillDirection = Enum.FillDirection.Horizontal,
								HorizontalAlignment = Enum.HorizontalAlignment.Center,
								SortOrder = Enum.SortOrder.LayoutOrder,
								VerticalAlignment = Enum.VerticalAlignment.Center
							}),
							New("TextLabel", {
								Name = "Title",
								BackgroundColor3 = Color3.fromRGB(255,255,255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0,0,0),
								BorderSizePixel = 0,
								Size = UDim2.new(0.800000012, 0,1, 0),
								Font = Enum.Font.GothamBold,
								Text = tostring(Title),
								TextColor3 = Color3.fromRGB(255,255,255),
								TextSize = 10,
								TextTransparency = 0.5,
								TextXAlignment = Enum.TextXAlignment.Left
							}),
							New("UICorner", {
								CornerRadius = UDim.new(0,5)
							}),
							New("Frame", {
								Name = "ToggleO",
								BackgroundColor3 = Color3.fromRGB(30,30,30),
								BorderColor3 = Color3.fromRGB(0,0,0),
								BorderSizePixel = 0,
								LayoutOrder = 1,
								Size = UDim2.new(0, 14,0, 14)
							}, {
								New("UICorner", {
									CornerRadius = UDim.new(0,4)
								}),
								--[[New("UIGradient", {
									Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(122, 122, 122))},
									Rotation = 30
								}),]]
								New("ImageLabel", {
									Name = "done",
									AnchorPoint = Vector2.new(0.5, 0.5),
									BackgroundColor3 = Color3.fromRGB(27,27,27),
									BackgroundTransparency = 1,
									BorderColor3 = Color3.fromRGB(27,27,27),
									Position = UDim2.new(0.5, 0,0.5, 0),
									Size = UDim2.new(0.800000012, 0,0.800000012, 0),
									Image = "rbxassetid://3926305904",
									ImageColor3 = Color3.fromRGB(27,27,27),
									ImageRectOffset = Vector2.new(644, 204),
									ImageRectSize = Vector2.new(36, 36),
									ImageTransparency = 1,
									Rotation = 90
								}, {
									New("UICorner", {
										CornerRadius = UDim.new(0,4)
									})
								})
							})
						})
					})
				})

				local Click = NewClick(Toggle)

				local function ToggleC(Value)
					if not Value then 
						Callback(Value)
						Tw({
							v = Toggle.FrameClick.ListfunctionToggle.ToggleO,
							t = 0.1,
							s = "Linear",
							d = "Out",
							g = {BackgroundColor3 = Color3.fromRGB(30,30,30)}
						}):Play()
						Tw({
							v = Toggle.FrameClick.ListfunctionToggle.Title,
							t = 0.15,
							s = "Linear",
							d = "Out",
							g = {TextTransparency = 0.1}
						}):Play()
						Tw({
							v = Toggle.FrameClick.ListfunctionToggle.ToggleO.done,
							t = 0.15,
							s = "Linear",
							d = "Out",
							g = {ImageTransparency = 1,Rotation = 90}
						}):Play()
					elseif Value then 
						Callback(Value)
						Tw({
							v = Toggle.FrameClick.ListfunctionToggle.ToggleO,
							t = 0.1,
							s = "Linear",
							d = "Out",
							g = {BackgroundColor3 = Color3.fromRGB(255, 0, 89)}
						}):Play()
						Tw({
							v = Toggle.FrameClick.ListfunctionToggle.Title,
							t = 0.15,
							s = "Linear",
							d = "Out",
							g = {TextTransparency = 0}
						}):Play()
						Tw({
							v = Toggle.FrameClick.ListfunctionToggle.ToggleO.done,
							t = 0.15,
							s = "Linear",
							d = "Out",
							g = {ImageTransparency = 0,Rotation = 0}
						}):Play()
					end
				end

				Click.MouseButton1Click:Connect(function()
					JustClick(Click,Toggle.FrameClick)
					Value = not Value
					ToggleC(Value)
				end)

				ToggleC(Value)

				local NewValue = {}

				function NewValue:SetValue(a)
					Value = a
					ToggleC(Value)
				end

				function NewValue:SetTitle(b)
					Toggle.FrameClick.ListfunctionToggle.Title.Text = b
				end

				return NewValue
			end

			function Library.Main:CreateSlider(info)

				local Title = infolib(info, "name") or infolib(info, "title") or infolib(info, "text") or nil
				local Desc = infolib(info, "description") or infolib(info, "desc") or nil
				local Min = infolib(info, "min")
				local Max = infolib(info, "max")
				local Value = infolib(info, "value") or infolib(info, "defuse") or Min
				local Callback = infolib(info, "callback") or function() end

				local Slider = New("Frame", {
					Name = "Slider",
					Parent = Section,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,0, 50),
				}, {
					New("Frame", {
						Name = "Inslider",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(13,13,13),
						BorderColor3 = Color3.fromRGB(0,0,0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 0,0.5, 0),
						Size = UDim2.new(0.899999976, 0,1, 0),
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(0,5)
						}),
						New("Frame", {
							Name = "TextHub",
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.0299999993, 0,0.5, 0),
							Size = UDim2.new(1, 0,0.800000012, 0),
						}, {
							New("UIListLayout", {
								Padding = UDim.new(0,2),
								SortOrder = Enum.SortOrder.LayoutOrder
							}),
							New("TextLabel", {
								Name = "Desc",
								AnchorPoint = Vector2.new(0.5, 0.5),
								BackgroundColor3 = Color3.fromRGB(255,255,255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0,0,0),
								BorderSizePixel = 0,
								LayoutOrder = 1,
								Position = UDim2.new(0.248750001, 0,0.0944999978, 0),
								Size = UDim2.new(0, 150,0, 11),
								Font = Enum.Font.GothamBold,
								Text = tostring(Desc),
								TextColor3 = Color3.fromRGB(255,255,255),
								TextSize = 8,
								TextTransparency = 0.5,
								TextXAlignment = Enum.TextXAlignment.Left,
							}),
							New("TextLabel", {
								Name = "Title",
								AnchorPoint = Vector2.new(0.5, 0.5),
								BackgroundColor3 = Color3.fromRGB(255,255,255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0,0,0),
								BorderSizePixel = 0,
								Position = UDim2.new(0.248750001, 0,0.0644999966, 0),
								Size = UDim2.new(0, 150,0, 11),
								Font = Enum.Font.GothamBold,
								Text = tostring(Title),
								TextColor3 = Color3.fromRGB(255,255,255),
								TextSize = 11,
								TextXAlignment = Enum.TextXAlignment.Left,
							})
						})
					}),
					New("Frame", {
						Name = "SliderBar",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(14,14,14),
						BorderColor3 = Color3.fromRGB(0,0,0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 0,0.75, 0),
						Size = UDim2.new(0, 160,0, 4),
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(0,4)
						}),
						New("Frame", {
							Name = "SliderBarValue",
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundColor3 = Color3.fromRGB(179,0,71),
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 0,0.5, 0),
							Size = UDim2.new(0.800000012, 0,0, 4),
						}, {
							New("UICorner", {
								CornerRadius = UDim.new(1,0)
							}),
							New("UIGradient", {
								Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(122, 122, 122))},
								Rotation = 90
							}),
							New("Frame", {
								Name = "ValueLine",
								AnchorPoint = Vector2.new(1, 0.5),
								BackgroundColor3 = Color3.fromRGB(255, 0, 89),
								BorderColor3 = Color3.fromRGB(0,0,0),
								BorderSizePixel = 0,
								Position = UDim2.new(1, 0,0.5, 0),
								Size = UDim2.new(0, 5,0, 5),
							}, {
								New("UICorner", {
									CornerRadius = UDim.new(1,0)
								}),
								New("UIGradient", {
									Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(122, 122, 122))},
									Rotation = 90
								}),
							}),
						}),
						New("TextButton", {
							Name = "Click",
							Active = true,
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.5, 0,0.5, 0),
							Size = UDim2.new(1, 10,1, 10),
							Font = Enum.Font.SourceSans,
							Text = "",
							TextSize = 14,
						})
					}),
					New("TextBox", {
						Name = "ValueBox",
						Active = true,
						AnchorPoint = Vector2.new(1, 0.5),
						BackgroundColor3 = Color3.fromRGB(35,35,35),
						BorderColor3 = Color3.fromRGB(0,0,0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.920000017, 0,0.349999994, 0),
						Size = UDim2.new(0, 30,0, 15),
						Font = Enum.Font.GothamBold,
						PlaceholderColor3 = Color3.fromRGB(178,178,178),
						PlaceholderText = "",
						Text = tonumber(Value),
						TextColor3 = Color3.fromRGB(255,255,255),
						TextSize = 10,
						TextTransparency = 0.30000001192092896,
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(1,0)
						}),
						New("UIStroke", {
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Color = Color3.fromRGB(52,52,52),
							Thickness = 1
						})
					})
				})

				local function updateSlider(value)
					value = math.clamp(value, Min, Max)
					Tw({
						v = Slider.SliderBar.SliderBarValue,
						t = 0.5,
						s = "Exponential",
						d = "Out",
						g = {Size = UDim2.new((value - Min) / (Max - Min), 0, 1, 0)}
					}):Play()
					Slider.ValueBox.Text = tonumber(value)
					Tw({
						v = Slider.ValueBox,
						t = 0.5,
						s = "Exponential",
						d = "Out",
						g = {Size = UDim2.new(0, Slider.ValueBox.TextBounds.X + 20, 0, 15)}
					}):Play()
					Callback(value)
				end

				updateSlider(Value or 0)

				Slider.ValueBox.FocusLost:Connect(function()
					local value = tonumber(Slider.ValueBox.Text) or Min
					updateSlider(value)
				end)

				local function move(input)
					local sliderBar = Slider.SliderBar
					local relativeX = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
					local value = math.floor(relativeX * (Max - Min) + Min)
					updateSlider(value)
				end

				local dragging = false

				Slider.SliderBar.Click.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						dragging = true
						move(input)
					end
				end)

				Slider.SliderBar.Click.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						dragging = false
					end
				end)

				game:GetService("UserInputService").InputChanged:Connect(function(input)
					if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
						move(input)
					end
				end)
			end

			function Library.Main:CreateButton(info)

				local Title = infolib(info, "name") or infolib(info, "title") or infolib(info, "text") or nil
				local Callback = infolib(info, "callback") or function() end

				local Button = New("Frame", {
					Name = "Button",
					Parent = Section,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,0, 28)
				}, {
					New("Frame", {
						Name = "ButtonFrame",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(255, 0, 89),
						BorderColor3 = Color3.fromRGB(0,0,0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 0,0.5, 0),
						Size = UDim2.new(0.899999976, 0,0, 25),
						ClipsDescendants = true
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(0,5)
						}),
						New("TextLabel", {
							Name = "Title",
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0,1, 0),
							Font = Enum.Font.GothamBold,
							Text = tostring(Title),
							TextColor3 = Color3.fromRGB(204,204,204),
							TextSize = 11
						})
					})
				})

				local Click = NewClick(Button)

				Click.MouseButton1Click:Connect(function()
					JustClick(Click, Button.ButtonFrame)
					Callback()
				end)
			end

			function Library.Main:CreateDropdown(info)

				local Title = infolib(info, "name") or infolib(info, "title") or infolib(info, "text") or nil
				local Callback = infolib(info, "callback") or function() end
				local Value = infolib(info, "value") or ""
				local List = infolib(info, "list")
				local Multi = infolib(info, "multi") or infolib(info, "multidropdown") or false
				local ScrollingFrame

				local function valuedropdown()
					if type(Value) == "table" then
						return table.concat(Value, ", ")
					else
						return Value
					end
				end

				local isopen = false

				local Dropdown = New("Frame", {
					Name = "Dropdown",
					Parent = Section,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,0, 30)
				}, {
					New("Frame", {
						Name = "DropdownFrame",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(29,29,29),
						BorderColor3 = Color3.fromRGB(0,0,0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 0,0.5, 0),
						Size = UDim2.new(0.899999976, 0,1, 0),
						ClipsDescendants = true
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(0,5)
						}),
						New("Frame", {
							Name = "TextHub",
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.0299999993, 0,0.5, 0),
							Size = UDim2.new(1, 0,0.800000012, 0)
						}, {
							New("UIListLayout", {
								Padding = UDim.new(0,2),
								SortOrder = Enum.SortOrder.LayoutOrder
							}),
							New("TextLabel", {
								Name = "Selected",
								AnchorPoint = Vector2.new(0.5, 0.5),
								BackgroundColor3 = Color3.fromRGB(255,255,255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0,0,0),
								BorderSizePixel = 0,
								LayoutOrder = 1,
								Position = UDim2.new(0.248750001, 0,0.0944999978, 0),
								Size = UDim2.new(0, 150,0, 11),
								Font = Enum.Font.GothamBold,
								Text = valuedropdown(),
								TextColor3 = Color3.fromRGB(255,255,255),
								TextSize = 8,
								TextTransparency = 0.5,
								TextXAlignment = Enum.TextXAlignment.Left,
							}),
							New("TextLabel", {
								Name = "Title",
								AnchorPoint = Vector2.new(0.5, 0.5),
								BackgroundColor3 = Color3.fromRGB(255,255,255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0,0,0),
								BorderSizePixel = 0,
								Position = UDim2.new(0.248750001, 0,0.0644999966, 0),
								Size = UDim2.new(0, 150,0, 11),
								Font = Enum.Font.GothamBold,
								Text = tostring(Title),
								TextColor3 = Color3.fromRGB(255,255,255),
								TextSize = 10,
								TextXAlignment = Enum.TextXAlignment.Left
							})
						}),
						New("ImageLabel", {
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.970000029, 0,0.5, 0),
							Size = UDim2.new(0, 10,0, 10),
							Image = "rbxassetid://11419703997"
						})
					}),
				})

				local DropdownSelect = New("Frame", {
					Name = "DropdownSelect",
					Parent = ScreenGui,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(0, 188,0, 0)
				}, {
					New("Frame", {
						Name = "DropdownFrame",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(28,28,28),
						BorderColor3 = Color3.fromRGB(0,0,0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 0,0.5, 0),
						Size = UDim2.new(0.899999976, 0,1, 0)
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(0,5)
						}),
						New("ScrollingFrame", {
							Active = true,
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0, 0,0.5, 0),
							Size = UDim2.new(1, 0,0.899999976, 0),
							ClipsDescendants = true,
							AutomaticCanvasSize = Enum.AutomaticSize.None,
							BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png",
							CanvasPosition = Vector2.new(0, 0),
							ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
							HorizontalScrollBarInset = Enum.ScrollBarInset.None,
							MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
							ScrollBarImageColor3 = Color3.fromRGB(0,0,0),
							ScrollBarImageTransparency = 0,
							ScrollBarThickness = 0,
							ScrollingDirection = Enum.ScrollingDirection.XY,
							TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png",
							VerticalScrollBarInset = Enum.ScrollBarInset.None,
							VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right,
						}, {
							New("UIListLayout", {
								Padding = UDim.new(0,4),
								SortOrder = Enum.SortOrder.LayoutOrder
							})
						}, function(sc)
							ScrollingFrame = sc
						end)
					})
				})

				local function openDropdown()
					local screenGui = DropdownSelect:FindFirstAncestorWhichIsA("ScreenGui")
					local screenSize = screenGui and screenGui.AbsoluteSize or Vector2.new(1920, 1080)

					local targetX = Dropdown.AbsolutePosition.X 
					- DropdownSelect.Parent.AbsolutePosition.X 
						+ Dropdown.Size.X.Offset 
						+ 3

					local targetY = Dropdown.AbsolutePosition.Y 
					- DropdownSelect.Parent.AbsolutePosition.Y 
						+ Dropdown.Size.Y.Offset 
						+ 5

					targetX = math.clamp(targetX, 0, screenSize.X - 169)
					targetY = math.clamp(targetY, 0, screenSize.Y - 130)
					isopen = true
					if ScrollingFrame.UIListLayout.AbsoluteContentSize.Y + 5 < 200 then
						Tw({
							v = DropdownSelect,
							t = 0.3,
							s = "Exponential",
							d = "Out",
							g = {Size = UDim2.new(0, 188,0, ScrollingFrame.UIListLayout.AbsoluteContentSize.Y + 5), Position = UDim2.new(0, targetX, 0, targetY)}
						}):Play()
					else
						Tw({
							v = DropdownSelect,
							t = 0.3,
							s = "Exponential",
							d = "Out",
							g = {Size = UDim2.new(0, 188,0, 100), Position = UDim2.new(0, targetX, 0, targetY)}
						}):Play()
					end
				end

				local function closeDropdown()
					isopen = false
					Tw({
						v = DropdownSelect,
						t = 0.3,
						s = "Exponential",
						d = "Out",
						g = {Size = UDim2.new(0, 188,0, 0)}
					}):Play()
				end

				local Click = NewClick(Dropdown)

				game:GetService "UserInputService".InputBegan:Connect(function(A)
					if A.UserInputType == Enum.UserInputType.MouseButton1 or A.UserInputType == Enum.UserInputType.Touch then
						local B, C = DropdownSelect.AbsolutePosition, DropdownSelect.AbsoluteSize
						if game:GetService "Players".LocalPlayer:GetMouse().X < B.X or game:GetService "Players".LocalPlayer:GetMouse().X > B.X + C.X or game:GetService "Players".LocalPlayer:GetMouse().Y < (B.Y - 20 - 1) or game:GetService "Players".LocalPlayer:GetMouse().Y > B.Y + C.Y then
							closeDropdown()
						end
					end
				end)

				Click.MouseButton1Click:Connect(function()
					JustClick(Click, Dropdown.DropdownFrame)
					isopen = not isopen
					if isopen then
						openDropdown()
					else
						closeDropdown()
					end
				end)

				local itemslist = {}
				local selectedItem

				local selectedValues = {}

				function itemslist:Clear()
					if not Multi then
						for _, child in ipairs(ScrollingFrame:GetChildren()) do
							if child:IsA("Frame") then
								child:Destroy()
							end
						end

						selectedItem = nil
						Dropdown.DropdownFrame.TextHub.Selected.Text = ""
					else
						for key in pairs(selectedValues) do
							selectedValues[key] = nil
						end
						
						for _, child in ipairs(ScrollingFrame:GetChildren()) do
							if child:IsA("Frame") then
								child:Destroy()
							end
						end

						Dropdown.DropdownFrame.TextHub.Selected.Text = ""
					end
				end

				function itemslist:AddList(text)

					local item = New("Frame", {
						Name = "Item",
						Parent = ScrollingFrame,
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						BorderSizePixel = 0,
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, 25),
						ClipsDescendants = true
					}, {
						New("Frame", {
							Name = "LabelFrame",
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 0, 89),
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.5, 0, 0.5, 0),
							Size = UDim2.new(0.9, 0, 0, 25),
							BackgroundTransparency = 1
						}, {
							New("UICorner", {
								CornerRadius = UDim.new(0, 5)
							}),
							New("UIGradient", {
								Color = ColorSequence.new({
									ColorSequenceKeypoint.new(0, Color3.fromRGB(113, 113, 113)),
									ColorSequenceKeypoint.new(1, Color3.fromRGB(94, 94, 94))
								})
							}),
							New("TextLabel", {
								Name = "Title",
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0, 0, 0),
								BorderSizePixel = 0,
								Size = UDim2.new(1, 0, 1, 0),
								Font = Enum.Font.GothamBold,
								RichText = true,
								Text = tostring(text),
								TextColor3 = Color3.fromRGB(204, 204, 204),
								TextSize = 9,
								TextWrapped = true,
								TextTransparency = 0.5
							})
						}),
						New("Frame", {
							Name = "Selected",
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundColor3 = Color3.fromRGB(255, 0, 89),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0, 0, 0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.1, 0, 0.5, 0),
							Size = UDim2.new(0, 4, 0, 15)
						}, {
							New("UICorner", {
								CornerRadius = UDim.new(1, 0)
							}),
							New("UIStroke", {
								Color = Color3.fromRGB(255, 0, 89),
								Thickness = 1,
								Transparency = 1
							})
						})
					})

					local Click_2 = NewClick(item)

					Click_2.MouseButton1Click:Connect(function()
						JustClick(Click_2, item)
						if Multi then
							if selectedValues[text] then
								selectedValues[text] = nil
								Tw({
									v = item.LabelFrame,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {BackgroundTransparency = 1}
								}):Play()
								Tw({
									v = item.LabelFrame.Title,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {TextTransparency = 0.5}
								}):Play()
								Tw({
									v = item.Selected,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {BackgroundTransparency = 1}
								}):Play()
								Tw({
									v = item.Selected.UIStroke,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {Transparency = 1}
								}):Play()
								local selectedList = {}
								for i, v in pairs(selectedValues) do
									table.insert(selectedList, i)
								end
								if #selectedList > 0 then
									Dropdown.DropdownFrame.TextHub.Selected.Text = table.concat(selectedList, ", ")
								else
									Dropdown.DropdownFrame.TextHub.Selected.Text = ""
								end
								Callback(selectedList)
							else
								Tw({
									v = item.LabelFrame,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {BackgroundTransparency = 0}
								}):Play()
								Tw({
									v = item.LabelFrame.Title,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {TextTransparency = 0}
								}):Play()
								Tw({
									v = item.Selected,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {BackgroundTransparency = 0.3}
								}):Play()
								Tw({
									v = item.Selected.UIStroke,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {Transparency = 0}
								}):Play()
								selectedValues[text] = true
								local selectedList = {}
								for i, v in pairs(selectedValues) do
									table.insert(selectedList, i)
								end
								Dropdown.DropdownFrame.TextHub.Selected.Text = table.concat(selectedList, ", ")
								Callback(selectedList)
							end
						else
							for i,v in pairs(ScrollingFrame:GetChildren()) do
								if v:IsA("Frame") then
									Tw({
										v = v.LabelFrame,
										t = 0.15,
										s = "Linear",
										d = "Out",
										g = {BackgroundTransparency = 1}
									}):Play()
									Tw({
										v = v.LabelFrame.Title,
										t = 0.15,
										s = "Linear",
										d = "Out",
										g = {TextTransparency = 0.5}
									}):Play()
									Tw({
										v = v.Selected,
										t = 0.15,
										s = "Linear",
										d = "Out",
										g = {BackgroundTransparency = 1}
									}):Play()
									Tw({
										v = v.Selected.UIStroke,
										t = 0.15,
										s = "Linear",
										d = "Out",
										g = {Transparency = 1}
									}):Play()
								end
							end
							Tw({
								v = item.LabelFrame,
								t = 0.15,
								s = "Linear",
								d = "Out",
								g = {BackgroundTransparency = 0}
							}):Play()
							Tw({
								v = item.LabelFrame.Title,
								t = 0.15,
								s = "Linear",
								d = "Out",
								g = {TextTransparency = 0}
							}):Play()
							Tw({
								v = item.Selected,
								t = 0.15,
								s = "Linear",
								d = "Out",
								g = {BackgroundTransparency = 0.3}
							}):Play()
							Tw({
								v = item.Selected.UIStroke,
								t = 0.15,
								s = "Linear",
								d = "Out",
								g = {Transparency = 0}
							}):Play()
							Value = text
							Dropdown.DropdownFrame.TextHub.Selected.Text = text
							Callback(Dropdown.DropdownFrame.TextHub.Selected.Text)
						end
					end)

					local function isValueInTable(val, tbl)
						if type(tbl) ~= "table" then
							return false
						end

						for _, v in pairs(tbl) do
							if v == val then
								return true
							end
						end
						return false
					end

					delay(0,function()
						if Multi then
							if isValueInTable(text, Value) then
								Tw({
									v = item.LabelFrame,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {BackgroundTransparency = 0}
								}):Play()
								Tw({
									v = item.LabelFrame.Title,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {TextTransparency = 0}
								}):Play()
								Tw({
									v = item.Selected,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {BackgroundTransparency = 0.3}
								}):Play()
								Tw({
									v = item.Selected.UIStroke,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {Transparency = 0}
								}):Play()
								selectedValues[text] = true
								local selectedList = {}
								for i, v in pairs(selectedValues) do
									table.insert(selectedList, i)
								end
								Dropdown.DropdownFrame.TextHub.Selected.Text = table.concat(selectedList, ", ")
								Callback(selectedList)
							end
						else
							if text == Value then
								Tw({
									v = item.LabelFrame,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {BackgroundTransparency = 0}
								}):Play()
								Tw({
									v = item.LabelFrame.Title,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {TextTransparency = 0}
								}):Play()
								Tw({
									v = item.Selected,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {BackgroundTransparency = 0.3}
								}):Play()
								Tw({
									v = item.Selected.UIStroke,
									t = 0.15,
									s = "Linear",
									d = "Out",
									g = {Transparency = 0}
								}):Play()
								Value = text
								Dropdown.DropdownFrame.TextHub.Selected.Text = text
								Callback(Dropdown.DropdownFrame.TextHub.Selected.Text)
							end
						end
					end)
				end

				for i,v in ipairs(List) do
					itemslist:AddList(v)
				end

				ScrollingFrame.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, ScrollingFrame.UIListLayout.AbsoluteContentSize.Y + 5)
				end)

				return itemslist
			end

			function Library.Main:CreateLabel(info)

				local Title = infolib(info, "name") or infolib(info, "title") or "Label"
				local Side = infolib(info, "side") or infolib(info, "textxalignment") or "Center"

				local function GetAlignment(va)
					local sideLower = string.lower(tostring(va))
					if sideLower == "left" then
						return Enum.TextXAlignment.Left
					elseif sideLower == "right" then
						return Enum.TextXAlignment.Right
					else
						return Enum.TextXAlignment.Center
					end
				end

				local Label = New("Frame", {
					Name = "Label",
					Parent = Section,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,0, 25)
				}, {
					New("Frame", {
						Name = "LabelFrame",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(255,255,255),
						BackgroundTransparency = 1,
						BorderColor3 = Color3.fromRGB(0,0,0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 0,0.5, 0),
						Size = UDim2.new(0.899999976, 0,0, 25)
					}, {
						New("TextLabel", {
							Name = "Title",
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0,1, 0),
							Font = Enum.Font.GothamBold,
							RichText = true,
							Text = tostring(Title),
							TextColor3 = Color3.fromRGB(204,204,204),
							TextSize = 9,
							TextWrapped = true,
							TextXAlignment = GetAlignment(Side)
						})
					})
				})

				Label.LabelFrame.Title.Size = UDim2.new(1, 0, 0, Label.LabelFrame.Title.TextBounds.Y)
				Label.LabelFrame.Size = UDim2.new(.9, 0, 0, Label.LabelFrame.Title.TextBounds.Y + 5)
				Label.Size = UDim2.new(1, 0, 0, Label.LabelFrame.Title.TextBounds.Y + 10)

				local NewText = {}

				function NewText:SetVisible(a)
					Label.Visible = a
				end

				function NewText:SetTitle(b)
					Label.LabelFrame.Title.Text = tostring(b)
					Label.LabelFrame.Title.Size = UDim2.new(1, 0, 0, Label.LabelFrame.Title.TextBounds.Y)
					Label.LabelFrame.Size = UDim2.new(.9, 0, 0, Label.LabelFrame.Title.TextBounds.Y + 5)
					Label.Size = UDim2.new(1, 0, 0, Label.LabelFrame.Title.TextBounds.Y + 10)
				end
				return NewText
			end

			function Library.Main:CreateTextbox(info)

				local Title = infolib(info, "name") or infolib(info, "title") or infolib(info, "text") or nil
				local Placeholder = infolib(info, "placeholder") or "Paste Your Text"
				local Value = infolib(info, "value") or nil
				local Callback = infolib(info, "callback") or function() end

				local TextBox = New("Frame", {
					Name = "TextBox",
					Parent = Section,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,0, 35)
				}, {
					New("Frame", {
						Name = "Textboxinside",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(13,13,13),
						BorderColor3 = Color3.fromRGB(0,0,0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 0,0.5, 0),
						Size = UDim2.new(0.899999976, 0,1, 0)
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(0,5)
						}),
						New("Frame", {
							Name = "TextHub",
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.0299999993, 0,0.5, 0),
							Size = UDim2.new(1, 0,0.800000012, 0)
						}, {
							New("UIListLayout", {
								Padding = UDim.new(0,2),
								SortOrder = Enum.SortOrder.LayoutOrder,
								VerticalAlignment = Enum.VerticalAlignment.Center
							}),
							New("TextLabel", {
								Name = "Title",
								AnchorPoint = Vector2.new(0.5, 0.5),
								BackgroundColor3 = Color3.fromRGB(255,255,255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0,0,0),
								BorderSizePixel = 0,
								LayoutOrder = 1,
								Position = UDim2.new(0.248750001, 0,0.0944999978, 0),
								Size = UDim2.new(0, 90,0, 11),
								Font = Enum.Font.GothamBold,
								Text = tostring(Title),
								TextColor3 = Color3.fromRGB(255,255,255),
								TextSize = 11,
								TextTransparency = 0,
								TextXAlignment = Enum.TextXAlignment.Left
							})
						}),
						New("Frame", {
							Name = "TextBoxBar",
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = Color3.fromRGB(22,22,22),
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.959999979, 0,0.5, 0),
							Size = UDim2.new(0, 80,0, 20),
							ClipsDescendants = true
						}, {
							New("UICorner", {
								CornerRadius = UDim.new(0,4)
							}),
							New("TextBox", {
								Name = "TextBoxValue",
								Active = true,
								AnchorPoint = Vector2.new(0.5, 0.5),
								BackgroundColor3 = Color3.fromRGB(255,255,255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0,0,0),
								BorderSizePixel = 0,
								Position = UDim2.new(0.5, 0,0.5, 0),
								Size = UDim2.new(0.899999976, 0,1, 0),
								Font = Enum.Font.Gotham,
								PlaceholderColor3 = Color3.fromRGB(145,145,145),
								PlaceholderText = tostring(Placeholder),
								Text = tostring(Value),
								TextColor3 = Color3.fromRGB(255,255,255),
								TextSize = 9
							})
						})
					})
				})

				TextBox.Textboxinside.TextBoxBar.TextBoxValue.FocusLost:Connect(function()
					if Value then
						if #TextBox.Textboxinside.TextBoxBar.TextBoxValue.Text > 0 then
							pcall(Callback,TextBox.Textboxinside.TextBoxBar.TextBoxValue.Text)
						end
					end
				end)

				delay(0,function()
					if Value then
						if #TextBox.Textboxinside.TextBoxBar.TextBoxValue.Text > 0 then
							pcall(Callback,TextBox.Textboxinside.TextBoxBar.TextBoxValue.Text)
						end
					end
				end)
			end

			function Library.Main:CreateKeyBind(info)

				local Title = infolib(info, "name") or infolib(info, "title") or infolib(info, "text") or nil
				local Key = infolib(info, "key") or infolib(info, "defuse") or infolib(info, "defusekey") or Enum.KeyCode.Q
				local ValueToggle = infolib(info, "value") or false
				local Callback = infolib(info, "callback") or function() end
				local ValueBind_1, BoxBind, Click2, Frame

				local Keybind = New("Frame", {
					Name = "Keybind",
					Parent = Section,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,0, 35)
				}, {
					New("Frame", {
						Name = "Textboxinside",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(13,13,13),
						BorderColor3 = Color3.fromRGB(0,0,0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 0,0.5, 0),
						Size = UDim2.new(0.899999976, 0,1, 0)
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(0,5)
						}),
						New("Frame", {
							Name = "TextHub",
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.0299999993, 0,0.5, 0),
							Size = UDim2.new(1, 0,0.800000012, 0)
						}, {
							New("UIListLayout", {
								Padding = UDim.new(0,2),
								SortOrder = Enum.SortOrder.LayoutOrder,
								VerticalAlignment = Enum.VerticalAlignment.Center,
							}),
							New("TextLabel", {
								Name = "Title",
								AnchorPoint = Vector2.new(0.5, 0.5),
								BackgroundColor3 = Color3.fromRGB(255,255,255),
								BackgroundTransparency = 1,
								BorderColor3 = Color3.fromRGB(0,0,0),
								BorderSizePixel = 0,
								Position = UDim2.new(0.248750001, 0,0.0644999966, 0),
								Size = UDim2.new(0, 90,0, 11),
								Font = Enum.Font.GothamBold,
								Text = tostring(Title),
								TextColor3 = Color3.fromRGB(255,255,255),
								TextSize = 11,
								TextXAlignment = Enum.TextXAlignment.Left
							})
						}),
						New("Frame", {
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.949999988, 0,0.5, 0),
							Size = UDim2.new(0, 25,0, 10)
						}, {
							New("UIListLayout", {
								Padding = UDim.new(0,5),
								FillDirection = Enum.FillDirection.Horizontal,
								HorizontalAlignment = Enum.HorizontalAlignment.Right,
								SortOrder = Enum.SortOrder.LayoutOrder,
								VerticalAlignment = Enum.VerticalAlignment.Center
							}),
							New("Frame", {
								Name = "BoxBind",
								AnchorPoint = Vector2.new(1, 0.5),
								BackgroundColor3 = Color3.fromRGB(35,35,35),
								BorderColor3 = Color3.fromRGB(0,0,0),
								BorderSizePixel = 0,
								Position = UDim2.new(1, 0,0.5, 0),
								Size = UDim2.new(0, 25,0, 14)
							}, {
								New("UICorner", {
									CornerRadius = UDim.new(0,4)
								}),
								New("UIStroke", {
									ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
									Color = Color3.fromRGB(52,52,52),
									Thickness = 1
								}),
								New("TextLabel", {
									Name = "ValueBind",
									BackgroundColor3 = Color3.fromRGB(255,255,255),
									BackgroundTransparency = 1,
									BorderColor3 = Color3.fromRGB(0,0,0),
									BorderSizePixel = 0,
									Size = UDim2.new(1, 0,1, 0),
									Font = Enum.Font.Gotham,
									Text = tostring(Key):gsub("Enum.KeyCode.", ""),
									TextColor3 = Color3.fromRGB(255,255,255),
									TextSize = 8
								}, nil, function(ValueBind)
									ValueBind_1 = ValueBind
								end),
								New("TextButton", {
									Name = "Click",
									Active = true,
									BackgroundColor3 = Color3.fromRGB(255,255,255),
									BackgroundTransparency = 1,
									BorderColor3 = Color3.fromRGB(0,0,0),
									BorderSizePixel = 0,
									Size = UDim2.new(1, 0,1, 0),
									Font = Enum.Font.SourceSans,
									Text = "",
									TextSize = 14,
									ZIndex = 2
								}, nil, function(a)
									Click2 = a
								end)
							}, function(boxBind)
								BoxBind = boxBind
							end),
							New("Frame", {
								Name = "ToggleO",
								BackgroundColor3 = Color3.fromRGB(30,30,30),
								BorderColor3 = Color3.fromRGB(0,0,0),
								BorderSizePixel = 0,
								LayoutOrder = 1,
								Size = UDim2.new(0, 14,0, 14)
							}, {
								New("UICorner", {
									CornerRadius = UDim.new(0,4)
								}),
								--[[New("UIGradient", {
									Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(122, 122, 122))},
									Rotation = 30
								}),]]
								New("ImageLabel", {
									Name = "done",
									AnchorPoint = Vector2.new(0.5, 0.5),
									BackgroundColor3 = Color3.fromRGB(27,27,27),
									BackgroundTransparency = 1,
									BorderColor3 = Color3.fromRGB(27,27,27),
									Position = UDim2.new(0.5, 0,0.5, 0),
									Size = UDim2.new(0.800000012, 0,0.800000012, 0),
									Image = "rbxassetid://3926305904",
									ImageColor3 = Color3.fromRGB(27,27,27),
									ImageRectOffset = Vector2.new(644, 204),
									ImageRectSize = Vector2.new(36, 36),
									ImageTransparency = 1,
									Rotation = 90
								}, {
									New("UICorner", {
										CornerRadius = UDim.new(0,4)
									})
								})
							})
						}, function(f)
							Frame = f
						end)
					})
				})

				local Click = NewClick(Keybind.Textboxinside)

				local function adjustBoxBindSize()
					local textSize = game:GetService("TextService"):GetTextSize(ValueBind_1.Text, ValueBind_1.TextSize, ValueBind_1.Font, Vector2.new(1000, 1000))
					BoxBind.Size = UDim2.new(0, textSize.X + 10, 0, 14)
				end

				adjustBoxBindSize()

				local function changeKey()
					ValueBind_1.Text = "..."
					local inputConnection

					inputConnection = game:GetService("UserInputService").InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Keyboard then
							Key = input.KeyCode
							ValueBind_1.Text = tostring(Key):gsub("Enum.KeyCode.", "")
							adjustBoxBindSize()
							inputConnection:Disconnect()
						end
					end)
				end

				Click2.MouseButton1Click:Connect(function()
					changeKey()
				end)

				local function ToggleC(Value)
					if not Value then 
						Callback(Value)
						Tw({
							v = Frame.ToggleO,
							t = 0.1,
							s = "Linear",
							d = "Out",
							g = {BackgroundColor3 = Color3.fromRGB(30,30,30)}
						}):Play()
						Tw({
							v = Keybind.Textboxinside.TextHub.Title,
							t = 0.15,
							s = "Linear",
							d = "Out",
							g = {TextTransparency = 0.6}
						}):Play()
						Tw({
							v = Frame.ToggleO.done,
							t = 0.15,
							s = "Linear",
							d = "Out",
							g = {ImageTransparency = 1,Rotation = 90}
						}):Play()
					elseif Value then 
						Callback(Value)
						Tw({
							v = Frame.ToggleO,
							t = 0.1,
							s = "Linear",
							d = "Out",
							g = {BackgroundColor3 = Color3.fromRGB(255, 0, 89)}
						}):Play()
						Tw({
							v = Keybind.Textboxinside.TextHub.Title,
							t = 0.15,
							s = "Linear",
							d = "Out",
							g = {TextTransparency = 0}
						}):Play()
						Tw({
							v = Frame.ToggleO.done,
							t = 0.15,
							s = "Linear",
							d = "Out",
							g = {ImageTransparency = 0,Rotation = 0}
						}):Play()
					end
				end

				Click.MouseButton1Click:Connect(function()
					ValueToggle = not ValueToggle
					ToggleC(ValueToggle)
				end)

				game:GetService("UserInputService").InputEnded:Connect(function(input, gameProcessed)
					if input.KeyCode == Key then
						ValueToggle = not ValueToggle
						ToggleC(ValueToggle)
					end
				end)

				delay(0,function()
					if ValueBind_1 ~= "..." then
						ToggleC(ValueToggle)
					end
				end)

				local NewText = {}

				function NewText:SetTitle(b)
					Keybind.Textboxinside.TextHub.Title.Text = b
				end
				function NewText:SetValue(b)
					ValueBind_1.Text = b
					adjustBoxBindSize()
				end
				return NewText
			end

			function Library.Main:CreateColorPicker(info)

				local Title = infolib(info, "name") or infolib(info, "title") or infolib(info, "text") or nil
				local preset = infolib(info, "color") or Color3.fromRGB(255, 255, 255)
				local Callback = infolib(info, "callback") or function() end
				local IsOpen = false
				local ColorH, ColorS, ColorV = 1, 1, 1
				local ColorInput, HueInput, lastColor = nil, nil, nil
				local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
				local isTouchDevice = game:GetService("UserInputService").TouchEnabled

				local colorpick = New("Frame", {
					Name = "Colorpick",
					Parent = Section,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0,0, 35)
				}, {
					New("Frame", {
						Name = "Textboxinside",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(13,13,13),
						BorderColor3 = Color3.fromRGB(0,0,0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 0,0.5, 0),
						Size = UDim2.new(0.899999976, 0,1, 0),
						ClipsDescendants = true
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(0,5)
						}),
						New("Frame", {
							Name = "Picker",
							AnchorPoint = Vector2.new(1, 0.5),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.949999988, 0,0.5, 0),
							Size = UDim2.new(0, 20,0, 15)
						}, {
							New("UICorner", {
								CornerRadius = UDim.new(0,3)
							}),
							New("UIStroke", {
								Color = Color3.fromRGB(44,47,53),
								Thickness = 1
							})
						}),
						New("TextLabel", {
							Name = "Title",
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.0299999993, 0,0.5, 0),
							Size = UDim2.new(0, 90,0, 11),
							Font = Enum.Font.GothamBold,
							Text = tostring(Title),
							TextColor3 = Color3.fromRGB(255,255,255),
							TextSize = 11,
							TextXAlignment = Enum.TextXAlignment.Left
						})
					})
				})

				local ColorPickerBar = New("Frame", {
					Name = "ColorPickerBar",
					Parent = ScreenGui,
					AnchorPoint = Vector2.new(1, 0),
					BackgroundColor3 = Color3.fromRGB(28,28,28),
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(0, 169,0, 0),
					ClipsDescendants = true
				}, {
					New("UICorner", {
						CornerRadius = UDim.new(0,4)
					}),
					New("ImageButton", {
						Name = "Color",
						BackgroundColor3 = Color3.fromRGB(39,39,39),
						Position = UDim2.new(0, 9,0, 9),
						Size = UDim2.new(0, 80,0, 80),
						Image = "rbxassetid://4155801252"
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(0,3)
						}),
						New("ImageLabel", {
							Name = "ColorSelection",
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							Position = UDim2.new(0.152941182, 0,0, 0),
							Size = UDim2.new(0, 18,0, 18),
							Image = "http://www.roblox.com/asset/?id=4805639000",
							ScaleType = Enum.ScaleType.Fit
						})
					}),
					New("ImageButton", {
						Name = "Hue",
						AnchorPoint = Vector2.new(1, 0),
						BackgroundColor3 = Color3.fromRGB(255,255,255),
						Position = UDim2.new(0.899999976, 0,0, 9),
						Size = UDim2.new(0, 25,0, 80),
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(0,3)
						}),
						New("UIGradient", {
							Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(0.2, Color3.fromRGB(234, 255, 0)), ColorSequenceKeypoint.new(0.4, Color3.fromRGB(21, 255, 0)), ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 17, 255)), ColorSequenceKeypoint.new(0.9, Color3.fromRGB(255, 0, 251)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 4))},
							Rotation = 270
						}),
						New("ImageLabel", {
							Name = "HueSelection",
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							Position = UDim2.new(0.479999989, 0,1, 0),
							Size = UDim2.new(0, 18,0, 18),
							Image = "http://www.roblox.com/asset/?id=4805639000"
						})
					}),
					New("Frame", {
						Name = "Box",
						AnchorPoint = Vector2.new(0.5, 0.5),
						BackgroundColor3 = Color3.fromRGB(22,22,22),
						BorderColor3 = Color3.fromRGB(0,0,0),
						BorderSizePixel = 0,
						Position = UDim2.new(0.5, 0,0, 110),
						Size = UDim2.new(0.899999976, 0,0, 20)
					}, {
						New("UICorner", {
							CornerRadius = UDim.new(0,3)
						}),
						New("ImageLabel", {
							Name = "IconTextBoxDD",
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							LayoutOrder = 1,
							Position = UDim2.new(0.899999976, 0,0.5, 0),
							Size = UDim2.new(0, 10,0, 10),
							Image = "rbxassetid://10734919691"
						}),
						New("TextBox", {
							Active = true,
							AnchorPoint = Vector2.new(0.5, 0),
							BackgroundColor3 = Color3.fromRGB(255,255,255),
							BackgroundTransparency = 1,
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Position = UDim2.new(0.5, 0,0, 0),
							Size = UDim2.new(0.899999976, 0,1, 0),
							Font = Enum.Font.Gotham,
							PlaceholderColor3 = Color3.fromRGB(178,178,178),
							PlaceholderText = "Place",
							Text = "R, G, B",
							TextColor3 = Color3.fromRGB(255,255,255),
							TextSize = 9,
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
						})
					})
				})

				lak(ColorPickerBar)

				local Click = NewClick(colorpick.Textboxinside)

				Click.MouseButton1Click:Connect(function()

					JustClick(Click, colorpick.Textboxinside)

					local screenGui = ColorPickerBar:FindFirstAncestorWhichIsA("ScreenGui")
					local screenSize = screenGui and screenGui.AbsoluteSize or Vector2.new(1920, 1080)

					local targetX = colorpick.Textboxinside.Picker.AbsolutePosition.X 
					- ColorPickerBar.Parent.AbsolutePosition.X 
						+ colorpick.Textboxinside.Picker.Size.X.Offset 
						+ 8

					local targetY = colorpick.Textboxinside.Picker.AbsolutePosition.Y 
					- ColorPickerBar.Parent.AbsolutePosition.Y 
						+ colorpick.Textboxinside.Picker.Size.Y.Offset 
						+ 15

					targetX = math.clamp(targetX, 0, screenSize.X - 169)
					targetY = math.clamp(targetY, 0, screenSize.Y - 130)

					Tw({
						v = ColorPickerBar,
						t = 0.3,
						s = "Exponential",
						d = "Out",
						g = {
							Size = UDim2.new(0, 169, 0, 130),
							Position = UDim2.new(0, targetX, 0, targetY)
						}
					}):Play()

					IsOpen = not IsOpen
					if IsOpen then
						Tw({
							v = ColorPickerBar,
							t = 0.3,
							s = "Exponential",
							d = "Out",
							g = {Size = UDim2.new(0, 169,0, 130), Position = UDim2.new(0, targetX, 0, targetY)}
						}):Play()
					else
						Tw({
							v = ColorPickerBar,
							t = 0.3,
							s = "Exponential",
							d = "Out",
							g = {Size = UDim2.new(0, 169,0, 0)}
						}):Play()
					end
				end)

				game:GetService "UserInputService".InputBegan:Connect(function(A)
					if A.UserInputType == Enum.UserInputType.MouseButton1 or A.UserInputType == Enum.UserInputType.Touch then
						local B, C = ColorPickerBar.AbsolutePosition, ColorPickerBar.AbsoluteSize
						if game:GetService "Players".LocalPlayer:GetMouse().X < B.X or game:GetService "Players".LocalPlayer:GetMouse().X > B.X + C.X or game:GetService "Players".LocalPlayer:GetMouse().Y < (B.Y - 20 - 1) or game:GetService "Players".LocalPlayer:GetMouse().Y > B.Y + C.Y then
							IsOpen = false
							Tw({
								v = ColorPickerBar,
								t = 0.3,
								s = "Exponential",
								d = "Out",
								g = {Size = UDim2.new(0, 169,0, 0)}
							}):Play()
						end
					end
				end)

				local function UpdateColorPicker(nope)
					colorpick.Textboxinside.Picker.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					ColorPickerBar.Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

					local r, g, b = colorpick.Textboxinside.Picker.BackgroundColor3.R * 255, colorpick.Textboxinside.Picker.BackgroundColor3.G * 255, colorpick.Textboxinside.Picker.BackgroundColor3.B * 255

					ColorPickerBar.Box.TextBox.Text = string.format("%d, %d, %d", math.floor(r), math.floor(g), math.floor(b))

					if lastColor ~= colorpick.Textboxinside.Picker.BackgroundColor3 then
						lastColor = colorpick.Textboxinside.Picker.BackgroundColor3
						pcall(Callback, math.floor(r), math.floor(g), math.floor(b))
					end
				end

				ColorH = 1 - (math.clamp(ColorPickerBar.Hue.HueSelection.AbsolutePosition.Y - ColorPickerBar.Hue.AbsolutePosition.Y, 0, ColorPickerBar.Hue.AbsoluteSize.Y) / ColorPickerBar.Hue.AbsoluteSize.Y)
				ColorS = (math.clamp(ColorPickerBar.Color.ColorSelection.AbsolutePosition.X - ColorPickerBar.Color.AbsolutePosition.X, 0, ColorPickerBar.Color.AbsoluteSize.X) / ColorPickerBar.Color.AbsoluteSize.X)
				ColorV = 1 - (math.clamp(ColorPickerBar.Color.ColorSelection.AbsolutePosition.Y - ColorPickerBar.Color.AbsolutePosition.Y, 0, ColorPickerBar.Color.AbsoluteSize.Y) / ColorPickerBar.Color.AbsoluteSize.Y)

				colorpick.Textboxinside.Picker.BackgroundColor3 = preset
				ColorPickerBar.Color.BackgroundColor3 = preset

				ColorPickerBar.Color.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end

						ColorInput = game:GetService("RunService").RenderStepped:Connect(function()
							local ColorX = (math.clamp(Mouse.X - ColorPickerBar.Color.AbsolutePosition.X, 0, ColorPickerBar.Color.AbsoluteSize.X) /ColorPickerBar.Color.AbsoluteSize.X)
							local ColorY = (math.clamp(Mouse.Y - ColorPickerBar.Color.AbsolutePosition.Y, 0, ColorPickerBar.Color.AbsoluteSize.Y) /ColorPickerBar.Color.AbsoluteSize.Y)

							ColorPickerBar.Color.ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
							ColorS = ColorX
							ColorV = 1 - ColorY

							UpdateColorPicker(true)
						end)
					end
				end)

				ColorPickerBar.Color.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end)

				ColorPickerBar.Hue.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end

						HueInput = game:GetService("RunService").RenderStepped:Connect(function()
							local HueY = (math.clamp(Mouse.Y - ColorPickerBar.Hue.AbsolutePosition.Y, 0, ColorPickerBar.Hue.AbsoluteSize.Y) /ColorPickerBar.Hue.AbsoluteSize.Y)

							ColorPickerBar.Hue.HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
							ColorH = 1 - HueY

							UpdateColorPicker(true)
						end)
					end
				end)

				ColorPickerBar.Hue.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end)

				if isTouchDevice then
					ColorPickerBar.Color.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Touch then
							if ColorInput then
								ColorInput:Disconnect()
							end

							ColorInput = game:GetService("RunService").RenderStepped:Connect(function()
								local ColorX = (math.clamp(Mouse.X - ColorPickerBar.Color.AbsolutePosition.X, 0, ColorPickerBar.Color.AbsoluteSize.X) / ColorPickerBar.Color.AbsoluteSize.X)
								local ColorY = (math.clamp(Mouse.Y - ColorPickerBar.Color.AbsolutePosition.Y, 0, ColorPickerBar.Color.AbsoluteSize.Y) / ColorPickerBar.Color.AbsoluteSize.Y)

								ColorPickerBar.Color.ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
								ColorS = ColorX
								ColorV = 1 - ColorY

								UpdateColorPicker(true)
							end)
						end
					end)

					ColorPickerBar.Color.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Touch then
							if ColorInput then
								ColorInput:Disconnect()
							end
						end
					end)

					ColorPickerBar.Hue.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Touch then
							if HueInput then
								HueInput:Disconnect()
							end

							HueInput = game:GetService("RunService").RenderStepped:Connect(function()
								local HueY = (math.clamp(Mouse.Y - ColorPickerBar.Hue.AbsolutePosition.Y, 0, ColorPickerBar.Hue.AbsoluteSize.Y) / ColorPickerBar.Hue.AbsoluteSize.Y)

								ColorPickerBar.Hue.HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
								ColorH = 1 - HueY

								UpdateColorPicker(true)
							end)
						end
					end)

					ColorPickerBar.Hue.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.Touch then
							if HueInput then
								HueInput:Disconnect()
							end
						end
					end)
				end

				ColorPickerBar.Box.TextBox.FocusLost:Connect(function(enterPressed)
					if enterPressed then
						local inputText = ColorPickerBar.Box.TextBox.Text
						local r, g, b = inputText:match("(%d+),%s*(%d+),%s*(%d+)")

						if r and g and b then
							r, g, b = tonumber(r), tonumber(g), tonumber(b)
							if r >= 0 and r <= 255 and g >= 0 and g <= 255 and b >= 0 and b <= 255 then
								local newColor = Color3.fromRGB(r, g, b)
								colorpick.Textboxinside.Picker.BackgroundColor3 = newColor
								ColorPickerBar.Color.BackgroundColor3 = newColor

								local h, s, v = Color3.toHSV(newColor)
								ColorH, ColorS, ColorV = h, s, v

								ColorPickerBar.Color.ColorSelection.Position = UDim2.new(s, 0, 1 - v, 0)
								ColorPickerBar.Hue.HueSelection.Position = UDim2.new(0.48, 0, 1 - h, 0)

								pcall(Callback, r, g, b)
							else
								ColorPickerBar.Box.TextBox.Text = string.format("%d, %d, %d", math.floor(colorpick.Textboxinside.Picker.BackgroundColor3.R * 255), math.floor(colorpick.Textboxinside.Picker.BackgroundColor3.G * 255), math.floor(colorpick.Textboxinside.Picker.BackgroundColor3.B * 255))
								Library:Notify({
									Title = "Function "..Title,
									Desc = "RGB values must be between 0 and 255",
									Time = 5,
									Type = "Error"
								})
							end
						else
							ColorPickerBar.Box.TextBox.Text = string.format("%d, %d, %d", math.floor(colorpick.Textboxinside.Picker.BackgroundColor3.R * 255), math.floor(colorpick.Textboxinside.Picker.BackgroundColor3.G * 255), math.floor(colorpick.Textboxinside.Picker.BackgroundColor3.B * 255))
							Library:Notify({
								Title = "Function "..Title,
								Desc = "Please enter valid RGB values (e.g., 255, 128, 64)",
								Time = 5,
								Type = "Error"
							})
						end
					end
				end)

				delay(0,function()
					local r, g, b = colorpick.Textboxinside.Picker.BackgroundColor3.R * 255, colorpick.Textboxinside.Picker.BackgroundColor3.G * 255, colorpick.Textboxinside.Picker.BackgroundColor3.B * 255
					ColorPickerBar.Box.TextBox.Text = string.format("%d, %d, %d", math.floor(r), math.floor(g), math.floor(b))
					pcall(Callback, math.floor(r), math.floor(g), math.floor(b))
				end)

				local NewColor = {}

				function NewColor:SetColor(colorTable)
					local r = colorTable.R or colorpick.Textboxinside.Picker.BackgroundColor3.R * 255
					local g = colorTable.G or colorpick.Textboxinside.Picker.BackgroundColor3.G * 255
					local b = colorTable.B or colorpick.Textboxinside.Picker.BackgroundColor3.B * 255

					if r >= 0 and r <= 255 and g >= 0 and g <= 255 and b >= 0 and b <= 255 then
						local newColor = Color3.fromRGB(r, g, b)

						colorpick.Textboxinside.Picker.BackgroundColor3 = newColor
						ColorPickerBar.Color.BackgroundColor3 = newColor

						local h, s, v = Color3.toHSV(newColor)
						ColorH, ColorS, ColorV = h, s, v

						ColorPickerBar.Color.ColorSelection.Position = UDim2.new(s, 0, 1 - v, 0)
						ColorPickerBar.Hue.HueSelection.Position = UDim2.new(0.48, 0, 1 - h, 0)

						ColorPickerBar.Box.TextBox.Text = string.format("%d, %d, %d", math.floor(r), math.floor(g), math.floor(b))
						pcall(Callback, r, g, b)
					else
						Library:Notify({
							Title = "Function "..Title.." SetColor",
							Desc = "RGB values must be between 0 and 255",
							Time = 5,
							Type = "Error"
						})
					end
				end

				return NewColor
			end

			Section.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				Section.Size = UDim2.new(1, 0, 0, Section.UIListLayout.AbsoluteContentSize.Y + 5)
			end)

			PageLeft.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				PageLeft.CanvasSize = UDim2.new(0, 0, 0, PageLeft.UIListLayout.AbsoluteContentSize.Y + 10)
			end)
			PageRight.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				PageRight.CanvasSize = UDim2.new(0, 0, 0, PageRight.UIListLayout.AbsoluteContentSize.Y + 10)
			end)

			return Library.Main
		end

		return Library.Section
	end

	return Library.Tab
end

return Library