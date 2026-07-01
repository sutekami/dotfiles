function launchOrFocus(keyBindTable, alphabetKey, appName)
	hs.hotkey.bind(keyBindTable, alphabetKey, function()
		local app = hs.application.get(appName)

		if not app then
			-- 起動していなければ起動
			hs.application.launchOrFocus(appName)
			return
		end

		if not app:isFrontmost() then
			app:activate(true)
		end
	end)
end

-- Command + Control + T で WezTerm を起動またはフォーカス
launchOrFocus({ "cmd", "ctrl" }, "t", "WezTerm")

-- Command + Control + C で Chrome を起動またはフォーカス
launchOrFocus({ "cmd", "ctrl" }, "c", "Google Chrome")

-- Command + Control + N で Notion を起動またはフォーカス
-- 2026/03/28 Notion はブラウザで開くことにしたため、ショートカットを無効化
-- launchOrFocus({ "cmd", "ctrl" }, "n", "Notion")

-- Command + Control + S で Slack を起動またはフォーカス
launchOrFocus({ "cmd", "ctrl" }, "s", "Slack")

-- Command + Control + E で Visual Studio Code を起動またはフォーカス
-- 2026/06/17 VSCode は一旦 Neovim に置き換えられたのでショートカットを無効化
-- launchOrFocus({ "cmd", "ctrl" }, "e", "Visual Studio Code")

-- Command + Control + L で Linear を起動またはフォーカス
launchOrFocus({ "cmd", "ctrl" }, "p", "Linear")

launchOrFocus({ "cmd", "ctrl" }, "o", "Obsidian")
