return {
	options = {
		mode = "buffers", -- set to "tabs" to only show tabpages instead
		style_preset = 2,
		themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
		indicator = {
			style = "none",
		},
		buffer_close_icon = "󰅖",
		modified_icon = "● ",
		close_icon = " ",
		left_trunc_marker = " ",
		right_trunc_marker = " ",
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_update_on_event = true, -- use nvim's diagnostic handler
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and "" or ""
			return " " .. icon .. count
		end,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
		persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
		move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
		separator_style = "slant",
		always_show_bufferline = true,
	},
}
