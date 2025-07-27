local xenia = {
	[[     ,c.                       .c;]],
	[[    .KMMMK....            ....kMMMK.]],
	[[   .WMMMMMX.....        .....KMMMMMW.]],
	[[   XMMMMMMM0.....       ....OMMMMMMMN]],
	[[  dMMMMMMMMM;.... .... ....,MMMMMMMMMd]],
	[[  WMMMMMMMMMl;oKKKKKKKKK0o;cMMMMMMMMMM]],
	[[ 'MMMMMMMNXK0KKKKKKKKKKKKKK0KXNMMMMMMM;]],
	[[ oMMMMMMM0xoKKKKKKKKKKKKKKKKox0MMMMMMMd]],
	[[ dMMMMMMNdxxxKKKKKKKKKKKKKKxxxdNMMMMMMk]],
	[[ :MMMMX0xxxxxx0KKKKKKK0KK0xxxxxx0XMMMMc]],
	[[  MMMOxxxxxxxxdxkdd0x0ddkxdxxxxxxxOMMM]],
	[[ ;xxkxddxxxxdodxxxxdxdxxxxdodxxxxddxkxx;]],
	[[dxdKMMMWXo'.....'cdxxxdc'.....'lXWMMMXdxd]],
	[[cxdXMMMN,..........dxd'.........'XMMMNdxl]],
	[[ .xxWMMl...''....'.;k:.'....''...lMMWxx.]],
	[[..:kXMMx..'....''..kMk..''....'..xMMXkc..]],
	[[ dMMMMMMd.....'...xMMMx...''....dMMMMMMx]],
	[[    kMMMMWOoc:co0kolllok0oc:co0WMMMMO]],
	[[         .MMMMMMMWl...lNMMMMMMM.]],
	[[            KMMMMMMXlKMMMMMMX]],
	[[               .MMMMMMMMM.]],
}

return {
	"goolord/alpha-nvim",
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = xenia
		dashboard.section.buttons.val = {
			dashboard.button("f", "󰮗 Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("n", " New File", "<cmd>ene <CR>"),
			dashboard.button("r", "󰑟 Recent Files", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("l", "󰪺 Last Session", "<cmd>SessionManager load_last_session<CR>"),
			dashboard.button("s", " Load Session", "<cmd>SessionManager load_session<CR>"),
			dashboard.button("c", " Configuration", "<cmd>e $MYVIMRC <CR>"),
			dashboard.button("q", " Quit", "<cmd>q <CR>"),
		}
		require("alpha").setup(dashboard.config)
	end,
}
