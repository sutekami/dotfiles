function launchOrFocus(keyBindTable, alphabetKey, appName)
  hs.hotkey.bind(
    keyBindTable, alphabetKey, function()
      local app = hs.application.get(appName)

      if not app then
        -- 起動していなければ起動
        hs.application.launchOrFocus(appName)
        return
      end

      if not app:isFrontmost() then
        app:activate(true)
      end
    end
  )
end

-- Comannd + Control + T で WezTerm を起動またはフォーカス
launchOrFocus({ "cmd", "ctrl" }, "t", "WezTerm")

-- Command + Control + C で Chrome を起動またはフォーカス
launchOrFocus({ "cmd", "ctrl" }, "c", "Google Chrome")

-- Command + Control + C で Chrome を起動またはフォーカス
launchOrFocus({ "cmd", "ctrl" }, "n", "Notion")

-- Command + Control + C で Chrome を起動またはフォーカス
launchOrFocus({ "cmd", "ctrl" }, "s", "Slack")

-- Command + Control + C で Chrome を起動またはフォーカス
launchOrFocus({ "cmd", "ctrl" }, "v", "Visual Studio Code")
