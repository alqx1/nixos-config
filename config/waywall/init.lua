-- cool sens: 0.02291165

local waywall = require("waywall")
local helpers = require("waywall.helpers")

local resolutions = {
    thin = helpers.toggle_res(320, 900),
    eye  = helpers.toggle_res(320, 16384, 0.1),
    wide = helpers.toggle_res(1920, 320),
    pre  = helpers.toggle_res(320, 16384, 1),
}

-- Eye magnifier
helpers.res_mirror(
    {
        src = { x = 130, y = 7902, w = 60, h = 580 },
        dst = { x = 0, y = 315, w = 800, h = 450 },
    },
    320, 16384
)
helpers.res_image(
    "/home/alex/.config/waywall/assets/overlay.png",
    {
        dst = { x = 0, y = 315, w = 800, h = 450 },
    },
    320, 16384
)

-- Tall pie
helpers.res_mirror(
    {
        src = { x = 0, y = 15980, w = 320, h = 260 },
        dst = { x = 800, y = 586, w = 320, h = 260 },
    },
    320, 16384
)

-- O LEVEL
helpers.res_mirror(
    {
        src       = { x = 173, y = 619, w = 113, h = 35 },
        dst       = { x = 860, y = 100, w = 200, h = 70 },
        color_key = {
            input  = "#dddddd",
            output = "#ff0000",
        },
    },
    1920, 1080
)

-- F3 Client Chunk Cache
helpers.res_mirror(
    {
        src       = { x = 101, y = 55, w = 27, h = 9 },
        dst       = { x = 880, y = 484, w = 108, h = 36 },
        color_key = {
            input  = "#dddddd",
            output = "#00ff00",
        },
    },
    320, 900
)

-- F3 Entity Count
helpers.res_mirror(
    {
        src       = { x = 0, y = 36, w = 49, h = 9 },
        dst       = { x = 880, y = 520, w = 196, h = 36 },
        color_key = {
            input  = "#dddddd",
            output = "#00ff00",
        },
    },
    320, 900
)

-- Tall pie numbers
helpers.res_mirror(
    {
        src = { x = 227, y = 16163, w = 84, h = 42 },
        dst = { x = 1120, y = 650, w = 504, h = 252 },
        shader = "pie_chart",
    },
    320, 16384
)

-- Thin pie numbers
helpers.res_mirror(
    {
        src = { x = 227, y = 679, w = 84, h = 42 },
        dst = { x = 1120, y = 650, w = 504, h = 252 },
        shader = "pie_chart",
    },
    320, 900
)

local read_file = function(name)
    local file = io.open("/home/alex/.config/waywall/" .. name, "r")
    local data = file:read("*a")
    file:close()

    return data
end

local config = {
    actions = {
        ["Ctrl-m5"] = resolutions.eye,
        ["Ctrl-m4"] = resolutions.thin,
        ["Ctrl-z"] = resolutions.wide,
        ["Ctrl-x"] = resolutions.pre,

        ["Ctrl-Shift-k"] = function() waywall.exec("ninb") end,
        ["k"] = function() helpers.toggle_floating() end,
    },
    input = {
        layout = "us",

        repeat_rate = 30,
        repeat_delay = 200,

        sensitivity = 5.0,
        confine_pointer = false,

        remaps = {
            ["T"] = "0",
            ["CapsLock"] = "LeftCtrl",
        },
    },
    theme = {
        background = "#303030ff",
        -- cursor_theme = "arrow",
        -- cursor_icon = "arrow",
    },
    shaders = {
        ["pie_chart"] = {
            vertex = read_file("assets/pie_chart.vert"),
            fragment = read_file("assets/pie_chart.frag"),
        },
    },
    experimental = {
        tearing = false,
    },

    ninjabrain = {
        enabled = true,
    },
}

return config
