-- setup configuration
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- LEADER の設定
config.leader = {
	key = "p",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}

config.keys = {
	-- workspace を選択する
	{
		key = "s",
		mods = "LEADER|CTRL",
		action = act.ShowLauncherArgs({ flags = "WORKSPACES", title = "Select workspace" }),
	},
	-- 現在フォーカスしている workspace の名前を変更する
	{
		key = "r",
		mods = "LEADER|CTRL",
		action = act.PromptInputLine({
			description = "(wezterm) Set workspace title: ",
			action = wezterm.action_callback(function(win, pane, line)
				if line then
					wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
				end
			end),
		}),
	},
	-- 名前をつけて workspace を作成する
	{
		key = "c",
		mods = "LEADER|CTRL",
		action = act.PromptInputLine({
			description = "(wezterm) Create new workspace:",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
	{ key = "n", mods = "LEADER|CTRL", action = act.SwitchWorkspaceRelative(1) },
	{ key = "p", mods = "LEADER|CTRL", action = act.SwitchWorkspaceRelative(-1) },
	-- Cmd + K で完全クリア（iTerm互換）
	{
		key = "k",
		mods = "CMD",
		action = act.Multiple({
			act.ClearScrollback("ScrollbackAndViewport"),
			act.SendKey({ key = "L", mods = "CTRL" }), -- 再描画（iTermっぽくする）
			act.ScrollToBottom, -- 画面の一番下にスクロール
		}),
	},
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{
		key = "j",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "l",
		mods = "LEADER|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
}

-- 起動時ウィンドウサイズの設定（初期設定が小さすぎる）
config.initial_cols = 164
config.initial_rows = 50

-- 設定ファイルをいじると自動でホットリロードが走る
config.automatically_reload_config = true

-- カラースキーマ設定
config.color_scheme = "Tokyo Night"

-- フォントファミリーの変更
config.font = wezterm.font_with_fallback({
	{ family = "Hack Nerd Font" },
	{ family = "Hiragino Sans" },
})

-- フォントサイズの設定
config.font_size = 14.0

-- 日本語入力設定（?）
config.use_ime = true

-- 透明度 0=透明 1=不透明
config.window_background_opacity = 0.75

-- ぼかし
config.macos_window_background_blur = 20

-- タブが一つの場合のみ、タブバーの非表示
-- config.hide_tab_bar_if_only_one_tab = true

-- タイトルバーの削除
config.window_decorations = "RESIZE"

-- タブバーを透明にする
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

-- タブバーを背景と同色にする
config.window_background_gradient = {
	colors = { "#000000" },
}

-- プラスボタンの削除
config.show_new_tab_button_in_tab_bar = false

-- 現在アクティブなタブに色をつける
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#5c6d74"
	local foreground = "#ffffff"

	if tab.is_active then
		background = "#ae8b2d"
		foreground = "#ffffff"
	end

	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
	}
end)

-- 非アクティブなペインに関しては暗めに設定する🍍
config.inactive_pane_hsb = {
	saturation = 0.75,
	brightness = 0.6,
}

-- 境界線の色を強調する
config.colors = {
	split = "#a0a0a0",
}

config.force_reverse_video_cursor = true

config.cursor_blink_rate = 500

wezterm.on("update-right-status", function(window, pane)
	local workspace = wezterm.mux.get_active_workspace()

	window:set_right_status(wezterm.format({
		{ Background = { Color = "#3c3c3c" } },
		{ Foreground = { Color = "#ffffff" } },
		{ Text = " 󱂬 " .. workspace .. " " },
	}))
end)

return config
