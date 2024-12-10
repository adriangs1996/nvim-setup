local colors = {
	-- black = "#0b0d0f",
	black = "#1e1f22",
	white = "#f8f8f2",
	red = "#F38BA8",
	green = "#A6E3A1",
	-- green = "#afcb85",
	magenta = "#CBA6F7",
	blue = "#74C7EC",
	yellow = "#F9E2AF",
	-- gray = "#0b0d0f",
	gray = "#1e1f22",
	darkgray = "#2e2e2e",
	lightgray = "#504945",
	inactivegray = "#7c6f64",
}
return {
	normal = {
		a = { bg = colors.green, fg = colors.black, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.white },
		c = { bg = colors.black, fg = colors.green },
	},
	insert = {
		a = { bg = colors.magenta, fg = colors.black, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.white },
		c = { bg = colors.black, fg = colors.green },
	},
	visual = {
		a = { bg = colors.blue, fg = colors.black, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.white },
		c = { bg = colors.black, fg = colors.green },
	},
	replace = {
		a = { bg = colors.red, fg = colors.black, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.white },
		c = { bg = colors.black, fg = colors.green },
	},
	command = {
		a = { bg = colors.green, fg = colors.black, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.white },
		c = { bg = colors.black, fg = colors.green },
	},
	inactive = {
		a = { bg = colors.darkgray, fg = colors.gray, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.white },
		c = { bg = colors.black, fg = colors.green },
	},
}
