local gpu_adapters = require('utils.gpu_adapter')
-- local backdrops = require('utils.backdrops')
local colors = require('colors.custom')
local wezterm = require('wezterm')


wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})

	-- 设置初始位置
	window:gui_window():set_position(120, 100)

	-- 默认窗口最大化
	-- window:gui_window():maximize()
end)

return {
   max_fps = 120,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',
   webgpu_preferred_adapter = gpu_adapters:pick_best(),
   -- webgpu_preferred_adapter = gpu_adapters:pick_manual('Dx12', 'IntegratedGpu'),

   -- cursor
   animation_fps = 120,
   cursor_blink_ease_in = 'EaseOut',
   cursor_blink_ease_out = 'EaseOut',
   default_cursor_style = 'BlinkingBlock',
   cursor_blink_rate = 650,

   -- color scheme
   -- colors = colors,
   color_scheme = 'Catppuccin Mocha',

   -- background
   -- background = backdrops:create_opts(),
   window_background_opacity = 1, -- 背景不透明度

   -- scrollbar
   enable_scroll_bar = false,

   -- tab bar
   enable_tab_bar = true,
   hide_tab_bar_if_only_one_tab = false,
   use_fancy_tab_bar = false,
   tab_max_width = 25,
   show_tab_index_in_tab_bar = false,
   switch_to_last_active_tab_when_closing_tab = true,

   -- window
   window_padding = {
      left = 12,
      right = 12,
      top = 15,
      bottom = 10,
   },
   initial_rows = 38,
   initial_cols = 145,
   adjust_window_size_when_changing_font_size = false,
   window_decorations = "RESIZE",
   window_close_confirmation = 'NeverPrompt',
   window_frame = {
      active_titlebar_bg = '#090909',
      -- font = fonts.font,
      -- font_size = fonts.font_size,
   },
   -- inactive_pane_hsb = {
   --    saturation = 0.9,
   --    brightness = 0.65,
   -- },
   inactive_pane_hsb = {
      saturation = 1,
      brightness = 1,
   },
}
