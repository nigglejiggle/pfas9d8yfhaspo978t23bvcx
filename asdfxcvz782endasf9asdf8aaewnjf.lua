local l0x = {
	WindowName = "danny couch",
	SubTitle = "script hub",
	Games = {
		{
			GameId = 6061766680,
			PlaceId = 17698425045,
			Image = "",
			Title = "fias",
			Body = "shitty anti cheat",
			Loader = "https://api.luarmor.net/files/v4/loaders/701bce85d570040aea631cab4b4bed41.lua",
		},
		{
			GameId = 9199655655,
			PlaceId = 128736949265057,
			Image = "",
			Title = "chudkuran",
			Body = "not recommended for xeno/solara",
			Loader = "https://api.luarmor.net/files/v4/loaders/e21e6d1dfc7dfb4b78ed6b2a21de8b68.lua",
		},
		{
			GameId = 10648640958,
			PlaceId = 113272123504853,
			Image = "",
			Title = "hood rivals",
			Body = "shooting game",
			Loader = "https://api.luarmor.net/files/v4/loaders/7bb1bd3da1bf2b6a30950e47c9f23b8b.lua",
		},
		{
			GameId = 107535308163741,
			PlaceId = 107535308163741,
			Image = "",
			Title = "huzz valley",
			Body = "huss",
			Loader = "https://api.luarmor.net/files/v4/loaders/ea8298f68b44ee6a7be4caf6102afdcb.lua",
		}
	},
}

local vP = game:GetService("Players")
local vL = vP.LocalPlayer

do
	local nG = tonumber(game.GameId) or 0
	local nP = tonumber(game.PlaceId) or 0
	for _, zE in ipairs(l0x.Games) do
		if string.lower(tostring(zE.Title or "")) == "fias" then
			local eG = tonumber(zE.GameId) or 0
			local eP = tonumber(zE.PlaceId) or 0
			if (eG > 0 and nG == eG) or (eP > 0 and nP == eP) then
				if vL then
					vL:Kick("dont inject the loader in fias u idiot")
				end
				return
			end
			break
		end
	end
end

local vQ = game:GetService("MarketplaceService")
local vR = game:GetService("ContentProvider")
local vU = game:GetService("UserInputService")
local vT = game:GetService("TweenService")

local vC = {
	k0 = Color3.fromRGB(24, 28, 30),
	k1 = Color3.fromRGB(28, 34, 36),
	k2 = Color3.fromRGB(60, 165, 165),
	k3 = Color3.fromRGB(60, 120, 120),
	k4 = Color3.fromRGB(50, 100, 100),
	k5 = Color3.fromRGB(32, 42, 44),
	k6 = Color3.fromRGB(45, 75, 75),
	k7 = Color3.fromRGB(20, 32, 34),
	k8 = Color3.fromRGB(240, 240, 240),
	k9 = Color3.fromRGB(170, 190, 190),
	ka = Color3.fromRGB(130, 150, 150),
	kb = Color3.fromRGB(12, 28, 28),
}

local vS = {
	qx = nil,
	nz = {},
	dd = false,
	kb = nil,
	kh = nil,
}

local function qv91()
	return (vL and vL.Name) or "unknown"
end

local function n4c()
	local a1, a2 = pcall(function()
		return game:GetService("HttpService"):GenerateGUID(false)
	end)
	if a1 and typeof(a2) == "string" then
		return a2
	end
	return tostring(math.random(100000, 999999)) .. tostring(os.clock())
end

local function z8p(qx)
	pcall(function()
		if typeof(protectgui) == "function" then
			protectgui(qx)
			return
		end
		if typeof(protect_gui) == "function" then
			protect_gui(qx)
		end
	end)
end

local function h3u()
	local a1, a2 = pcall(function()
		if typeof(gethui) == "function" then
			return gethui()
		end
		if typeof(get_hidden_gui) == "function" then
			return get_hidden_gui()
		end
		if typeof(hidden_ui) == "function" then
			return hidden_ui()
		end
		return nil
	end)
	if a1 and a2 then
		return a2
	end
	return nil
end

local function m2r(qx)
	z8p(qx)

	local a1 = pcall(function()
		local a2 = h3u()
		if a2 then
			qx.Parent = a2
			return
		end
		qx.Parent = game:GetService("CoreGui")
	end)

	if not a1 or not qx.Parent then
		pcall(function()
			qx.Parent = vL:WaitForChild("PlayerGui")
		end)
	end
end

local function k7n(cn)
	if cn then
		table.insert(vS.nz, cn)
	end
	return cn
end

local function d1x()
	if vS.dd then
		return
	end
	vS.dd = true
	for _, cn in ipairs(vS.nz) do
		pcall(function()
			cn:Disconnect()
		end)
	end
	table.clear(vS.nz)
	local qx = vS.qx
	vS.qx = nil
	if qx then
		pcall(function()
			qx:Destroy()
		end)
	end
end

local function w6e(rw)
	if typeof(rw) ~= "string" then
		return nil
	end

	local sx = rw
	sx = sx:gsub("\239\187\191", "")
	sx = sx:gsub("```%w*", " ")
	sx = sx:gsub("```", " ")
	sx = sx:gsub("‘", "'"):gsub("’", "'")
	sx = sx:gsub("“", '"'):gsub("”", '"')

	local function b5y(kk)
		if typeof(kk) ~= "string" then
			return nil
		end
		kk = kk:gsub("%s+", "")
		kk = kk:gsub(";+$", "")
		kk = kk:gsub("^['\"]+", ""):gsub("['\"]+$", "")
		if #kk < 8 or #kk > 128 then
			return nil
		end
		if not kk:match("^[%w_%-]+$") then
			return nil
		end
		return kk
	end

	local low = string.lower(sx)
	local at = low:find("script_key", 1, true)
	if at then
		local rest = sx:sub(at + 10)
		local line = rest:match("^[^\r\n]*") or rest
		local q, inner = line:match("([\"'])(.-)%1")
		if inner then
			local k = b5y(inner)
			if k then
				return k
			end
		end
		local long = line:match("%[%[(.-)%]%]")
		local k2 = b5y(long)
		if k2 then
			return k2
		end
		local code = line:gsub("%-%-.*$", "")
		local bare = code:match("=%s*([%w_%-]+)")
		local k3 = b5y(bare)
		if k3 then
			return k3
		end
	end

	local ft = sx:gsub("%-%-[^\r\n]*", "")
	ft = ft:gsub("[%c%s]+", "")
	ft = ft:gsub("^['\"]+", ""):gsub("['\"]+$", "")
	ft = ft:gsub(";+$", "")
	return b5y(ft)
end

local function g4v()
	local ok, gv = pcall(function()
		if typeof(getgenv) == "function" then
			return getgenv()
		end
		return nil
	end)
	if ok and typeof(gv) == "table" then
		return gv
	end
	return nil
end

local function j0s()
	local gv = g4v()
	local function pull(v)
		if typeof(v) ~= "string" then
			return nil
		end
		return w6e(v)
	end

	local bare
	pcall(function()
		bare = script_key
	end)
	local fromBare = pull(bare)
	if fromBare then
		if gv then
			gv.script_key = fromBare
		end
		return fromBare
	end

	if not gv then
		return nil
	end
	local ok, v = pcall(rawget, gv, "script_key")
	if ok then
		return pull(v)
	end
	return nil
end

local function t9a(kk)
	local gv = g4v()
	if gv then
		gv.script_key = kk
	end
end

local function f2l(zE, kk)
	if vS.dd or typeof(zE) ~= "table" then
		return false
	end
	local ld = zE.Loader
	if typeof(ld) ~= "string" or ld == "" then
		return false
	end
	if typeof(kk) ~= "string" or kk == "" then
		return false
	end
	t9a(kk)
	d1x()
	task.spawn(function()
		local okG, src = pcall(function()
			return game:HttpGet(ld)
		end)
		if not okG or typeof(src) ~= "string" or src == "" then
			warn("[hub] couldnt fetch loader:", tostring(src))
			return
		end
		local fn, err = loadstring(src)
		if typeof(fn) ~= "function" then
			warn("[hub] loader wouldnt compile:", tostring(err))
			return
		end
		local okR, errR = pcall(fn)
		if not okR then
			warn("[hub] loader errored:", tostring(errR))
		end
	end)
	return true
end

local function c8m(zE)
	local rw = ""
	if vS.kb then
		rw = vS.kb.Text
	end
	local kk = w6e(rw) or j0s()
	if not kk then
		if vS.kh then
			vS.kh.Text = "that ain a key loser"
			vS.kh.TextColor3 = Color3.fromRGB(220, 130, 130)
		end
		return
	end
	if vS.kb then
		vS.kb.Text = kk
	end
	if vS.kh then
		vS.kh.Text = ""
	end
	f2l(zE, kk)
end

local function p3i(nn)
	local a1, a2 = pcall(function()
		return vQ:GetProductInfo(nn, Enum.InfoType.Asset)
	end)
	if not a1 or typeof(a2) ~= "table" then
		return nil
	end
	local ad = tonumber(a2.IconImageAssetId) or 0
	if ad > 0 then
		return "rbxassetid://" .. tostring(ad)
	end
	return nil
end

local function r6o(im, id)
	if not im.Parent then
		return false
	end
	im.Image = id
	local st
	local a1 = pcall(function()
		vR:PreloadAsync({ im }, function(_, vv)
			st = vv
		end)
	end)
	if a1 and st ~= nil then
		return st == Enum.AssetFetchStatus.Success
	end
	for _ = 1, 15 do
		local a2, a3 = pcall(function()
			return im.IsLoaded
		end)
		if a2 and a3 == true then
			return true
		end
		task.wait(0.1)
	end
	return false
end

local function u4v(im, zE)
	local ls = {}
	if typeof(zE.Image) == "string" and zE.Image ~= "" then
		table.insert(ls, zE.Image)
	end

	local nn = tonumber(zE.PlaceId) or 0
	if nn > 0 then
		local ss = string.format("%.0f", nn)
		table.insert(ls, "rbxthumb://type=GameIcon&id=" .. ss .. "&w=150&h=150")
		table.insert(ls, "rbxthumb://type=GameIcon&id=" .. ss .. "&w=50&h=50")
		table.insert(ls, "rbxthumb://type=Asset&id=" .. ss .. "&w=150&h=150")
		table.insert(ls, "rbxthumb://type=Asset&id=" .. ss .. "&w=420&h=420")
	end

	task.spawn(function()
		for _, id in ipairs(ls) do
			if not im.Parent then
				return
			end
			if r6o(im, id) then
				return
			end
		end
		if nn > 0 then
			local al = p3i(nn)
			if al and r6o(im, al) then
				return
			end
		end
		if im.Parent then
			im.Image = ""
			local ph = im:FindFirstChild("xq")
			if ph then
				ph.Visible = true
			end
		end
	end)
end

local function e7g(ob, rr)
	local xx = Instance.new("UICorner")
	xx.CornerRadius = UDim.new(0, rr or 8)
	xx.Parent = ob
	return xx
end

local function i1h(ob, co, tr)
	local xx = Instance.new("UIStroke")
	xx.Color = co
	xx.Transparency = tr or 0.35
	xx.Thickness = 1
	xx.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	xx.Parent = ob
	return xx
end

local function o5d(ob, t, b, l, r)
	local xx = Instance.new("UIPadding")
	xx.PaddingTop = UDim.new(0, t or 0)
	xx.PaddingBottom = UDim.new(0, b or 0)
	xx.PaddingLeft = UDim.new(0, l or 0)
	xx.PaddingRight = UDim.new(0, r or 0)
	xx.Parent = ob
	return xx
end

local function a9q(rt, zE, od)
	local fr = Instance.new("Frame")
	fr.Name = "m" .. tostring(od)
	fr.LayoutOrder = od
	fr.Size = UDim2.new(1, 0, 0, 108)
	fr.BackgroundColor3 = vC.k5
	fr.BackgroundTransparency = 0.08
	fr.BorderSizePixel = 0
	fr.Parent = rt
	e7g(fr, 8)
	i1h(fr, vC.k6, 0.4)

	local im = Instance.new("ImageLabel")
	im.Name = "iq"
	im.BackgroundColor3 = vC.k7
	im.BorderSizePixel = 0
	im.Size = UDim2.fromOffset(84, 84)
	im.Position = UDim2.fromOffset(12, 12)
	im.ScaleType = Enum.ScaleType.Crop
	im.Parent = fr
	e7g(im, 6)

	local fb = Instance.new("TextLabel")
	fb.Name = "xq"
	fb.BackgroundTransparency = 1
	fb.Size = UDim2.fromScale(1, 1)
	fb.Font = Enum.Font.GothamBold
	fb.TextSize = 32
	fb.TextColor3 = vC.k2
	fb.Text = string.upper(string.sub(tostring(zE.Title or "?"), 1, 1))
	fb.Visible = false
	fb.Parent = im

	u4v(im, zE)

	local tl = Instance.new("TextLabel")
	tl.BackgroundTransparency = 1
	tl.Position = UDim2.fromOffset(110, 14)
	tl.Size = UDim2.new(1, -210, 0, 22)
	tl.Font = Enum.Font.GothamMedium
	tl.TextSize = 17
	tl.TextXAlignment = Enum.TextXAlignment.Left
	tl.TextColor3 = vC.k8
	tl.TextTruncate = Enum.TextTruncate.AtEnd
	tl.Text = tostring(zE.Title or "untitled")
	tl.Parent = fr

	local bl = Instance.new("TextLabel")
	bl.BackgroundTransparency = 1
	bl.Position = UDim2.fromOffset(110, 40)
	bl.Size = UDim2.new(1, -210, 0, 52)
	bl.Font = Enum.Font.Gotham
	bl.TextSize = 13
	bl.TextXAlignment = Enum.TextXAlignment.Left
	bl.TextYAlignment = Enum.TextYAlignment.Top
	bl.TextWrapped = true
	bl.TextColor3 = vC.k9
	bl.Text = tostring(zE.Body or "")
	bl.Parent = fr

	local bn = Instance.new("TextButton")
	bn.AutoButtonColor = false
	bn.Size = UDim2.fromOffset(78, 34)
	bn.Position = UDim2.new(1, -90, 0.5, -17)
	bn.BackgroundColor3 = vC.k2
	bn.BorderSizePixel = 0
	bn.Font = Enum.Font.GothamBold
	bn.TextSize = 14
	bn.TextColor3 = vC.kb
	bn.Text = "Load"
	bn.Parent = fr
	e7g(bn, 6)

	k7n(bn.MouseEnter:Connect(function()
		vT:Create(bn, TweenInfo.new(0.12), { BackgroundTransparency = 0.12 }):Play()
	end))
	k7n(bn.MouseLeave:Connect(function()
		vT:Create(bn, TweenInfo.new(0.12), { BackgroundTransparency = 0 }):Play()
	end))
	k7n(bn.MouseButton1Click:Connect(function()
		c8m(zE)
	end))
end

local function s2w()
	local qx = Instance.new("ScreenGui")
	qx.Name = n4c()
	qx.ResetOnSpawn = false
	qx.IgnoreGuiInset = true
	qx.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	qx.DisplayOrder = 2147483646
	qx.Enabled = true
	vS.qx = qx
	m2r(qx)

	local wn = Instance.new("Frame")
	wn.Name = "zw"
	wn.AnchorPoint = Vector2.new(0.5, 0.5)
	wn.Position = UDim2.fromScale(0.5, 0.5)
	wn.Size = UDim2.fromOffset(560, 520)
	wn.BackgroundColor3 = vC.k0
	wn.BackgroundTransparency = 0.06
	wn.BorderSizePixel = 0
	wn.ClipsDescendants = true
	wn.Parent = qx
	e7g(wn, 10)
	i1h(wn, vC.k4, 0.35)

	local sc = Instance.new("UIScale")
	sc.Name = "zs"
	sc.Parent = wn

	local function zFit()
		local cam = workspace.CurrentCamera
		local vp = (cam and cam.ViewportSize) or Vector2.new(1280, 720)
		local topY = 0
		local botY = 0
		pcall(function()
			local a, b = game:GetService("GuiService"):GetGuiInset()
			if typeof(a) == "Vector2" then
				topY = a.Y
			end
			if typeof(b) == "Vector2" then
				botY = b.Y
			end
		end)
		local pad = 12
		local availW = math.max(1, vp.X - pad * 2)
		local availH = math.max(1, vp.Y - topY - botY - pad * 2)
		sc.Scale = math.min(availW / 560, availH / 520, 1)
		local midY = topY + (vp.Y - topY - botY) * 0.5
		wn.Position = UDim2.new(0.5, 0, 0, midY)
	end

	zFit()
	task.defer(zFit)
	local cam = workspace.CurrentCamera
	if cam then
		k7n(cam:GetPropertyChangedSignal("ViewportSize"):Connect(zFit))
	end
	k7n(workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		local c2 = workspace.CurrentCamera
		if c2 then
			k7n(c2:GetPropertyChangedSignal("ViewportSize"):Connect(zFit))
		end
		zFit()
	end))

	local br = Instance.new("Frame")
	br.Name = "zt"
	br.Size = UDim2.new(1, 0, 0, 44)
	br.BackgroundColor3 = vC.k1
	br.BackgroundTransparency = 0.1
	br.BorderSizePixel = 0
	br.Parent = wn

	local tt = Instance.new("TextLabel")
	tt.BackgroundTransparency = 1
	tt.Position = UDim2.fromOffset(16, 0)
	tt.Size = UDim2.new(1, -90, 1, 0)
	tt.Font = Enum.Font.GothamMedium
	tt.TextSize = 15
	tt.TextXAlignment = Enum.TextXAlignment.Left
	tt.TextColor3 = vC.k8
	tt.Text = tostring(l0x.WindowName) .. " " .. tostring(l0x.SubTitle)
	tt.Parent = br

	local xb = Instance.new("TextButton")
	xb.AutoButtonColor = false
	xb.Size = UDim2.fromOffset(28, 28)
	xb.Position = UDim2.new(1, -36, 0.5, -14)
	xb.BackgroundColor3 = Color3.fromRGB(50, 60, 62)
	xb.BackgroundTransparency = 0.35
	xb.BorderSizePixel = 0
	xb.Font = Enum.Font.GothamBold
	xb.TextSize = 14
	xb.TextColor3 = vC.k8
	xb.Text = "×"
	xb.Parent = br
	e7g(xb, 6)
	k7n(xb.MouseButton1Click:Connect(d1x))

	local ln = Instance.new("Frame")
	ln.Size = UDim2.new(1, 0, 0, 1)
	ln.Position = UDim2.fromOffset(0, 44)
	ln.BackgroundColor3 = vC.k3
	ln.BackgroundTransparency = 0.45
	ln.BorderSizePixel = 0
	ln.Parent = wn

	local bd = Instance.new("Frame")
	bd.Name = "zb"
	bd.Position = UDim2.fromOffset(0, 45)
	bd.Size = UDim2.new(1, 0, 1, -45)
	bd.BackgroundTransparency = 1
	bd.BorderSizePixel = 0
	bd.Parent = wn
	o5d(bd, 14, 14, 14, 14)

	local hi = Instance.new("TextLabel")
	hi.BackgroundTransparency = 1
	hi.Size = UDim2.new(1, 0, 0, 22)
	hi.Font = Enum.Font.GothamMedium
	hi.TextSize = 16
	hi.TextXAlignment = Enum.TextXAlignment.Left
	hi.TextColor3 = vC.k8
	hi.Text = "hello stinky dirty cheater " .. qv91()
	hi.Parent = bd

	local sb = Instance.new("TextLabel")
	sb.BackgroundTransparency = 1
	sb.Position = UDim2.fromOffset(0, 24)
	sb.Size = UDim2.new(1, 0, 0, 18)
	sb.Font = Enum.Font.Gotham
	sb.TextSize = 13
	sb.TextXAlignment = Enum.TextXAlignment.Left
	sb.TextColor3 = vC.ka
	sb.Text = "choose the script:"
	sb.Parent = bd

	local kl = Instance.new("TextLabel")
	kl.BackgroundTransparency = 1
	kl.Position = UDim2.fromOffset(0, 48)
	kl.Size = UDim2.new(1, 0, 0, 16)
	kl.Font = Enum.Font.GothamMedium
	kl.TextSize = 13
	kl.TextXAlignment = Enum.TextXAlignment.Left
	kl.TextColor3 = vC.k9
	kl.Text = "script key"
	kl.Parent = bd

	local bx = Instance.new("TextBox")
	bx.Name = "zk"
	bx.Position = UDim2.fromOffset(0, 66)
	bx.Size = UDim2.new(1, 0, 0, 52)
	bx.BackgroundColor3 = vC.k5
	bx.BackgroundTransparency = 0.08
	bx.BorderSizePixel = 0
	bx.ClearTextOnFocus = false
	bx.MultiLine = true
	bx.TextWrapped = true
	bx.Font = Enum.Font.Gotham
	bx.TextSize = 13
	bx.TextXAlignment = Enum.TextXAlignment.Left
	bx.TextYAlignment = Enum.TextYAlignment.Top
	bx.TextColor3 = vC.k8
	bx.PlaceholderText = "paste the key, or the whole luarmor script if ur an idiot mobile user"
	bx.PlaceholderColor3 = vC.ka
	bx.Text = j0s() or ""
	bx.Parent = bd
	e7g(bx, 6)
	i1h(bx, vC.k6, 0.4)
	o5d(bx, 8, 8, 10, 10)
	vS.kb = bx

	local kh = Instance.new("TextLabel")
	kh.BackgroundTransparency = 1
	kh.Position = UDim2.fromOffset(0, 120)
	kh.Size = UDim2.new(1, 0, 0, 16)
	kh.Font = Enum.Font.Gotham
	kh.TextSize = 12
	kh.TextXAlignment = Enum.TextXAlignment.Left
	kh.TextColor3 = vC.ka
	kh.Text = ""
	kh.Parent = bd
	vS.kh = kh

	k7n(bx.FocusLost:Connect(function()
		local kk = w6e(bx.Text)
		if kk then
			bx.Text = kk
			kh.Text = ""
		end
	end))

	local ls = Instance.new("ScrollingFrame")
	ls.Name = "zl"
	ls.Position = UDim2.fromOffset(0, 138)
	ls.Size = UDim2.new(1, 0, 1, -138)
	ls.BackgroundTransparency = 1
	ls.BorderSizePixel = 0
	ls.ScrollBarThickness = 3
	ls.ScrollBarImageColor3 = vC.k2
	ls.CanvasSize = UDim2.new(0, 0, 0, 0)
	ls.AutomaticCanvasSize = Enum.AutomaticSize.Y
	ls.ScrollingDirection = Enum.ScrollingDirection.Y
	ls.Parent = bd
	o5d(ls, 0, 4, 0, 6)

	local ly = Instance.new("UIListLayout")
	ly.SortOrder = Enum.SortOrder.LayoutOrder
	ly.Padding = UDim.new(0, 10)
	ly.Parent = ls

	for ii, zE in ipairs(l0x.Games) do
		a9q(ls, zE, ii)
	end

	do
		local dg = false
		local st
		local sp
		k7n(br.InputBegan:Connect(function(ip)
			if ip.UserInputType == Enum.UserInputType.MouseButton1
				or ip.UserInputType == Enum.UserInputType.Touch then
				dg = true
				st = ip.Position
				sp = wn.Position
			end
		end))
		k7n(br.InputEnded:Connect(function(ip)
			if ip.UserInputType == Enum.UserInputType.MouseButton1
				or ip.UserInputType == Enum.UserInputType.Touch then
				dg = false
			end
		end))
		k7n(vU.InputChanged:Connect(function(ip)
			if not dg then
				return
			end
			if ip.UserInputType == Enum.UserInputType.MouseMovement
				or ip.UserInputType == Enum.UserInputType.Touch then
				local df = ip.Position - st
				wn.Position = UDim2.new(
					sp.X.Scale,
					sp.X.Offset + df.X,
					sp.Y.Scale,
					sp.Y.Offset + df.Y
				)
			end
		end))
	end

	k7n(vU.InputBegan:Connect(function(ip, gp)
		if gp or vS.dd then
			return
		end
		if ip.KeyCode == Enum.KeyCode.RightShift then
			qx.Enabled = not qx.Enabled
		end
	end))

	wn.Size = UDim2.fromOffset(520, 480)
	wn.BackgroundTransparency = 1
	vT:Create(wn, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.fromOffset(560, 520),
		BackgroundTransparency = 0.06,
	}):Play()
end

local function y6b()
	local nG = tonumber(game.GameId) or 0
	local nP = tonumber(game.PlaceId) or 0

	for _, zE in ipairs(l0x.Games) do
		local eG = tonumber(zE.GameId) or 0
		if eG > 0 and nG > 0 and eG == nG then
			return zE
		end
	end

	if nP > 0 then
		for _, zE in ipairs(l0x.Games) do
			if tonumber(zE.PlaceId) == nP then
				return zE
			end
		end
	end

	return nil
end

local zH = y6b()
local zK = j0s()
if zH and zK then
	f2l(zH, zK)
else
	s2w()
end
