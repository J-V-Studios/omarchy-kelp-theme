-- ──────────────────────────────────────────────
-- Kelp theme — Hyprland Lua config (0.55+)
-- Replaces the old themes/kelp/hyprland.conf
-- ──────────────────────────────────────────────

local activeBorderColor = "rgb(89dea4)"
local activeBorderColor2 = "rgb(bced89)"
local current_dir = debug.getinfo(1).source:match("@?(.*/)") or "./"

hl.config({
	general = {
		col = {
			active_border = {
				colors = { activeBorderColor, activeBorderColor2 },
				angle = 135,
			},
			-- inactive_border left as-is; add here if you want to set it too
		},
		border_size = 6,
		gaps_in = 3,
		gaps_out = 12,
	},
	group = {
		col = {
			border_active = activeBorderColor,
		},
	},
	decoration = {
		rounding = 16,
		screen_shader = current_dir .. "water.frag"
	},

	debug = {
		damage_tracking = 0,
	},
	animations = {
		enabled = true,
	},
})

-- Bezier curves
hl.curve("spring", { type = "bezier", points = { { 0.55, 1.2 }, { 0.45, 1.0 } } })
hl.curve("smooth", { type = "bezier", points = { { 0.3, 0 }, { 0.25, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.2, 0 }, { 0.1, 1.0 } } })

-- Window animations
hl.animation({ leaf = "windows", enabled = true, speed = 1.5, bezier = "spring" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 1.2, bezier = "quick" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.0, bezier = "quick" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 1.6, bezier = "spring" })

-- Fade animations
hl.animation({ leaf = "fade", enabled = true, speed = 1.3, bezier = "smooth" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.1, bezier = "smooth" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 0.9, bezier = "quick" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 1.1, bezier = "smooth" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 1.2, bezier = "quick" })

-- Layer animations
hl.animation({ leaf = "layers", enabled = true, speed = 1.5, bezier = "spring" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 1.2, bezier = "quick" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.1, bezier = "quick" })

-- Workspace animations
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.5, bezier = "spring" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 1.3, bezier = "smooth" })

-- Border animations
hl.animation({ leaf = "border", enabled = true, speed = 2.0, bezier = "spring" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 2.2, bezier = "smooth" })
dofile(os.getenv("HOME") .. "/.config/omarchy/themes/kelp/theme.lua")

