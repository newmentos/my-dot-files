-------------------------------------------------------------------------------
--  Стандартные библиотеки
-------------------------------------------------------------------------------
local gears = require("gears")
local awful = require("awful")
local vicious = require("vicious")
local scratch = require("scratch")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup").widget

-------------------------------------------------------------------------------
--  Устанавливаем системную локаль (русскую)
-------------------------------------------------------------------------------
os.setlocale("ru_RU.UTF-8")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
   naughty.notify({ preset = naughty.config.presets.critical,
		    title = "Oops, there were errors during startup!",
		    text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
   local in_error = false
   awesome.connect_signal("debug::error", function (err)
			     -- Make sure we don't go into an endless error loop
			     if in_error then return end
			     in_error = true

			     naughty.notify({ preset = naughty.config.presets.critical,
					      title = "Oops, an error happened!",
					      text = tostring(err) })
			     in_error = false
   end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-------------------------------------
--- Устанавливаем тему ---
-------------------------------------
beautiful.init(os.getenv("HOME").."/.config/awesome/themes/default/theme.lua")

-- This is used later as the default terminal and editor to run.
----------------------------------------------------------------------
--- Устанавливаем приложения по умолчанию ---
----------------------------------------------------------------------
terminal = "lxterminal" -- Терминал по умолчанию
-- terminal = "domterm" -- Терминал по умолчанию
browser = "brave" -- Браузер по умолчанию
editor = os.getenv("EDITOR") or "emacsclient -c" -- Редактор по умолчанию
-- editor_cmd = terminal .. " -e " .. editor -- Команда запуска консольного редактора
editor_cmd = editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
-----------------------------------------
--- Клавиша-модификатор ---
-----------------------------------------
modkey = "Mod4"

local icon_path = awful.util.getdir("config").."/icons/"

-- Table of layouts to cover with awful.layout.inc, order matters.
------------------------------------------------------------------------------
--- Layouts - способы расположения окон на экране ---
------------------------------------------------------------------------------
awful.layout.layouts = {
   -- 1 Обычное не привязанное поведение
   awful.layout.suit.floating,
   -- 2 Главное окно слева, справа второстепенные (мелкие)
   awful.layout.suit.tile,
   -- 3 Слева второстепенные окна
   awful.layout.suit.tile.left,
   -- 4 Внизу второстепенные окна
   awful.layout.suit.tile.bottom,
   -- 5 Второстепенные окна вверху
   awful.layout.suit.tile.top,
   -- 6
   awful.layout.suit.fair,
   -- 7
   awful.layout.suit.fair.horizontal,
   -- 8
   awful.layout.suit.spiral,
   -- 9
   awful.layout.suit.spiral.dwindle,
   -- 10
   awful.layout.suit.max,
   -- 11
   awful.layout.suit.max.fullscreen,
   -- 12
   awful.layout.suit.magnifier,
   awful.layout.suit.corner.nw,
   awful.layout.suit.corner.ne,
   awful.layout.suit.corner.sw,
   awful.layout.suit.corner.se
}
-- }}}

-- {{{ Helper functions
local function client_menu_toggle_fn()
   local instance = nil

   return function ()
      if instance and instance.wibox.visible then
	 instance:hide()
	 instance = nil
      else
	 instance = awful.menu.clients({ theme = { width = 250 } })
      end
   end
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
------------------------------
--- Главное меню ---
------------------------------

--- Интернет-приложения
internet_menu =
   {
      -- Формат описания пункта меню
      -- {<Назавание пункта меню>, <Команда запуска>, <Иконка>}
      {" Brave", "brave", beautiful.brave_icon},
--      {" Firefox", "firefox", beautiful.firefox_icon},
      {" Chromium", "chromium", beautiful.chromium_icon},
      {" Vivaldi", "vivaldi-stable", beautiful.vivaldi_icon},      
--      {" Pale moon", "palemoon", beautiful.palemoon_icon},
      {" Midori", "midori", beautiful.midori_icon},      
      {" NetSurf", "netsurf", beautiful.netsurf_icon},      
      --      {" Firefox ESR", "firefox-esr", beautiful.firefox_icon},
      {" Falkon", "falkon", beautiful.falkon_icon},
      {" IceCat", "icecat", beautiful.icecat_icon},
      {" Опера", "opera", beautiful.opera_icon},
      --    {" Otter-browser", "otter-browser", beautiful.otter_icon},
      {" Conkeror", "conkeror", beautiful.conkeror_icon},
      {" Nyxt", "next", beautiful.next_icon},
      {" Tor Browser", "tor-browser", beautiful.tor_icon},
      --    {" Slack", "slack", beautiful.slack_icon},
      --    {" Chrome", "google-chrome-stable", beautiful.chrome_icon},
      {" Thunderbird", "thunderbird", beautiful.thunderbird_icon},
      {" Sylpheed", "sylpheed", beautiful.sylpheed_icon},      
      {" Pidgin", "pidgin", beautiful.pidgin_icon},
      {" Skype", "skypeforlinux", beautiful.skype_icon},
      {" Viber", "env LD_LIBRARY_PATH=/opt/viber/lib/ viber", beautiful.viber_icon},
      {" Whatsapp", "whatsapp-nativefier-dark", beautiful.whatsapp_icon},
      {" QuiteRss", "quiterss", beautiful.quiterss_icon},
--      {" Franz", "franz", beautiful.franz_icon},      
--      {" ZoIPer", "/opt/Zoiper5/zoiper", beautiful.zoiper_icon},
      {" Telegram Desktop", "telegram-desktop", beautiful.telegram_icon},
--      {" Discord", "discord", beautiful.discord_icon},    
      {" Transmission", "transmission-gtk", beautiful.transmission_icon},
--      {" Yandex диск", "yandex-disk-indicator", beautiful.yandexdisk_icon},
--      {" Облако mail.ru", "mailru-cloud", beautiful.mailru_cloud_icon},
      {" NextCloud", "nextcloud", beautiful.nextcloud_icon}
   }
--- Стандартные
standartprog_menu =
   {
      {" Nemo", "nemo", beautiful.nemo_icon},
      {" PCmanFM", "pcmanfm", beautiful.pcmanfm_icon},
--      {" SpaceFM", "spacefm", beautiful.spacefm_icon},
      {" Thunar", "thunar", beautiful.thunar_icon},
      {" Nautilus", "nautilus", beautiful.nautilus_icon},
      {" Doublecmd", "doublecmd", beautiful.doublecmd_icon},
      {" Leafpad", "leafpad", beautiful.leafpad_icon},
      {" Evince", "evince", beautiful.evince_icon},
      {" Кальулятор", "galculator", beautiful.galculator_icon},
      {" Календарь", "gnome-calendar", beautiful.gcalendar_icon},
      {" Контакты", "gnome-contacts", beautiful.gcontacts_icon},
      {" Виртуалбокс","virtualbox",beautiful.vbox_icon}
   }
-- Монитринг
monitor_menu =
   {
      {" Gnethogs","gnethogs", beautiful.gnethogs_icon},
--      {" IPtraf","iptraf", beautiful.iptraf_icon},
   }

--- Разработка
develop_menu =
   {
      {" Android Studio", "/opt/android-studio/bin/studio.sh",  beautiful.android_icon},
      --  {" Android Studio", "android-studio", beautiful.astudio_icon},
      {" Ring Notepad", "/home/newmentos/.local/bin/rnote.sh",  beautiful.ring_icon},      
      {" Emacs", "emacsclient -c",  beautiful.emacs_icon},
      {" Orange","orange-canvas", beautiful.orange_icon},
      {" VSCodium", "vscodium", beautiful.vscodium_icon},
      {" Geany", "geany", beautiful.geany_icon},
      {" SQLite Studio", "sqlitestudio",  beautiful.sqlitestudio_icon},
      --  {" R-Studio", "rstudio-bin", beautiful.rstudio_icon},
      --  {" DrRacket", "drracket", beautiful.drracket_icon},
      --  {" Lazarus", "startlazarus", beautiful.lazarus_icon},
      --  {" GitEye", "GitEye",  beautiful.giteye_icon},
      --  {" Git-gui", "git gui",  beautiful.git_icon},
      --  {" Gogland", os.getenv("HOME").."/opt/Gogland/bin/gogland.sh",  beautiful.gogland_icon},
      --  {" PyCharm", os.getenv("HOME").."/opt/pycharm/bin/pycharm.sh",  beautiful.pycharm_icon},
      --  {" Giggle", "giggle",  beautiful.giggle_icon},
      --  {" GitKraken", "gitkraken",  beautiful.gitkraken_icon},
      {" SQLite Manager", "sqliteman",  beautiful.sqliteman_icon},
      -- {" PGadmin 4", "pgadmin4",  beautiful.pgadmin_icon},
      --  {" Kexi", "kexi",  beautiful.kexi_icon},
      {" Qt Creator", "qtcreator.sh", beautiful.qtcreator_icon},
      --  {" QGIS", "qgis", beautiful.qgis_icon},
      --  {" gvSIG", "gvsig-desktop-bin", beautiful.gvsig_icon},
      --  {" GRASS", "grass74", beautiful.grass_icon},
      --  {" Consulo", "/opt/Consulo/consulo.sh",  beautiful.consulo_icon},
      --  {" F4", "/opt/f4/F4",  beautiful.f4_icon},
      --  {" Eclipse", "eclipse",  beautiful.eclipse_icon},
      --  {" DlangIDE", "dlangide",  beautiful.dlangide_icon},
      --  {" Coedit", "coedit",  beautiful.coedit_icon},
      --  {" Aporia", "aporia", beautiful.aporia_icon},
      --  {" MonoDevelop", "monodevelop",  beautiful.monodev_icon},
      --  {" NetBeans IDE 11.1", "netbeans",  beautiful.netbeans_icon},
      --  {" SQLiteBrowser", "sqlitebrowser",  beautiful.sqlitebrowser_icon},
      --  {" Anjuta", "anjuta", beautiful.anjuta_icon},
      --  {" ValaMa", "valama", beautiful.valama_icon},
      --  {" Glade", "glade", beautiful.glade_icon},
      --  {" wxGlade", "wxglade", beautiful.wxglade_icon},
      --  {" Gnome Builder", "gnome-builder", beautiful.gbuilder_icon},
      --  {" LiteIDE", "liteide", beautiful.liteide_icon},
      --  {" Qt Creator", "qtcreator.sh", beautiful.qtcreator_icon},
      --  {" Intellij IDEA", "/opt/idea-IC/bin/idea.sh",  beautiful.idea_icon},
      --  {" gVim", "gvim", beautiful.gvim_icon},
      {" Code::Blocks", "codeblocks",  beautiful.codeblocks_icon},
      --  {" CodeLite", "codelite", beautiful.codelite_icon}
   }
--- Офис
--- function() awful.util.spawn_with_shell("wine 'ololo trololo'") end
office_menu = {
   {" ONLYOffice", 'desktopeditors', beautiful.onlyoffice_icon},
   {" Libre Writer", "libreoffice --writer", beautiful.writer_icon},
   {" Libre Calc", "libreoffice --calc", beautiful.calc_icon},
   {" Libre Base", "libreoffice --base", beautiful.base_icon},
   {" Libre Draw", "libreoffice --draw", beautiful.draw_icon},
--   {" Microsoft Word", 'wine "/home/newmentos/wine32/drive_c/Program Files/Microsoft Office/Office12/WINWORD.EXE"', beautiful.word_icon},
--   {" Microsoft Excel", 'wine "/home/newmentos/wine32/drive_c/Program Files/Microsoft Office/Office12/EXCEL.EXE"',beautiful.excel_icon},
   {" Microsoft Word", 'wine "/home/newmentos/wine32/drive_c/Program Files/Microsoft Office/Office14/WINWORD.EXE"', beautiful.word_icon},
   {" Microsoft Excel", 'wine "/home/newmentos/wine32/drive_c/Program Files/Microsoft Office/Office14/EXCEL.EXE"',beautiful.excel_icon},
   --   {" PDFSam", "pdfsam", beautiful.pdfsam_icon},
   {" Dia", "dia", beautiful.dia_icon},
   {" Calibre", "calibre", beautiful.calibre_icon}
}
--- Сканирование
scan_menu = {
   {" Xsane", "xsane", beautiful.xsane_icon},
   {" Gscan2pdf", "gscan2pdf", beautiful.gscan2pdf_icon}
}

--- Мультимедиа
media_menu = {
   --  {" SMPlayer", "smplayer", beautiful.smplayer_icon}
--   {" Acidrip", "acidrip", beautiful.acidrip_icon},
--   {" Arista", "arista-gtk", beautiful.arista_icon},
   {" Avidemux", "avidemux3_cli", beautiful.avidemux_icon},
--   {" Bombono DVD", "bombono-dvd", beautiful.bombono_icon},
   {" DeVeDe", "devede_ng.py", beautiful.devede_icon},
   {" DVD::RIP", "dvdrip", beautiful.dvdrip_icon},
   {" Gradio", "gradio", beautiful.gradio_icon},   
   {" Handbrake", "ghb", beautiful.handbrake_icon},
--   {" PITIVI", "pitivi", beautiful.pitivi_icon},
   {" Shortwave", "shortwave", beautiful.shortwave_icon},
   {" Soundconverter", "soundconverter", beautiful.soundconverter_icon},
   {" Transmageddon", "transmageddon", beautiful.transmageddon_icon},
   {" Vlc", "vlc", beautiful.vlc_icon},
   {" WinFF", "winff", beautiful.winff_icon},
   {" XfBurn", "xfburn", beautiful.xfburn_icon},
   {" Xine", "xine", beautiful.xine_icon},
   {" Xnoise", "xnoise", beautiful.xnoise_icon},
   {" Xt7-player-mpv", "xt7-player-mpv", beautiful.xt7_icon},
}

mymainmenu = awful.menu({
      -- Таблица пунктов главного меню
      items = {
	 {" Разработка", develop_menu},
	 {" Интернет", internet_menu},
	 {" Office", office_menu},
	 {" Стандартные", standartprog_menu},
	 {" Сканирование",scan_menu},
	 {" Мультимедиа", media_menu},
	 {" Мониторинг сети", monitor_menu},
	 {" "},
	 {" Скриншот", "scrot "..os.getenv("HOME").."/images/screenshots/%Y-%m-%d-%H-%M-%S.png" },
	 {" Справка", terminal .. " -e man awesome" },
	 {" Настройки", editor_cmd .. " " .. awesome.conffile },
	 {" Принтеры", "gksu system-config-printer" },
	 {" Рестарт awesamoe", awesome.restart },
	 {" "},
	 {" Заблокировать экран", "xscreensaver-command -lock", beautiful.lock_icon },
	 {" Перезагрузка", "reboot", beautiful.reboot_icon},
	 {" Спать", "hibernate", beautiful.reboot_icon},
	 {" Выключение", "poweroff", beautiful.poweroff_icon},
	 {" Выход", function() awesome.quit() end, beautiful.logout_icon}
      }
})



------------------------------------------------------------------
--- Лаунчер - та кнопка что на панели слева --- 
------------------------------------------------------------------
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

--{{{ CPU temperature
--local thermalwidget = wibox.widget.textbox()
--local thermalicon = wibox.widget.imagebox()
--thermalicon:set_image(icon_path.."temp.png")
--vicious.register(thermalwidget, vicious.widgets.thermal, "$1°C", 7, {"thermal_zone2", "sys"})
--}}}

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
-- Задаем обработку кнопок мыши для списка тегов
local taglist_buttons = awful.util.table.join(
   -- Отобразить тэг
   awful.button({ }, 1, function(t) t:view_only() end),
   awful.button({ modkey }, 1, function(t)
	 if client.focus then
	    -- Переместить клиент на данный тэг
	    client.focus:move_to_tag(t)
	 end
   end),
   -- Отобразить выбранный тэг вместе с текущим
   awful.button({ }, 3, awful.tag.viewtoggle),
   -- Отобразить текущий клиент в текущем и выбранном тэге
   awful.button({ modkey }, 3, function(t)
	 if client.focus then
	    client.focus:toggle_tag(t)
	 end
   end),
   -- Следующий тэг
   awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
   -- Предыдущий тэг
   awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

-- Декларируем список задач
local tasklist_buttons = awful.util.table.join(--прикрепляем клавиши мыши к панели задач
   awful.button({ }, 1, function (c) --нажатие левой кнопки
	 if c == client.focus then --свернуть/развернуть приложение
	    c.minimized = true
	 else
	    -- Without this, the following
	    -- :isvisible() makes no sense
	    c.minimized = false
	    if not c:isvisible() and c.first_tag then
	       c.first_tag:view_only()
	    end
	    -- This will also un-minimize
	    -- the client, if needed
	    client.focus = c
	    c:raise()
	 end
   end),
   awful.button({ }, 3, client_menu_toggle_fn()),
   awful.button({ }, 4, function ()
	 awful.client.focus.byidx(1)
	 if client.focus then client.focus:raise() end
   end),
   awful.button({ }, 5, function ()
	 awful.client.focus.byidx(-1)
	 if client.focus then client.focus:raise() end
end))

-- {{{ Wallpaper
--------------------------------------
--- Обои рабочего стола ---
--------------------------------------
local function set_wallpaper(s)
   -- Если в теме заданы обои
   if beautiful.wallpaper then
      local wallpaper = beautiful.wallpaper
      -- If wallpaper is a function, call it with the screen
      if type(wallpaper) == "function" then
	 wallpaper = wallpaper(s)
      end
      -- На каждый экран кладем обои (можно в принципе на каждый экран свои)
      gears.wallpaper.maximized(wallpaper, s, true)
   end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
      -- Wallpaper
      set_wallpaper(s)

      -- Each screen has its own tag table.
      -- awful.tag({ "1-main", "2-www", "4-develop", "5-work", "5-skype", "7-IM", "7-wine", "8-media" }, s, awful.layout.layouts[1])
      awful.tag({ "1-main", "2-www", "3-dev", "4-work","5-IM", "6-media", "7-vbox" }, s, {
	    awful.layout.layouts[2], awful.layout.layouts[3],
	    awful.layout.layouts[1], awful.layout.layouts[2], awful.layout.layouts[6], awful.layout.layouts[2],
	    awful.layout.layouts[1]
											 }
      )

      -------------------------------------------------------------------------------
      --  Создаем для каждого экрана панель задач
      -------------------------------------------------------------------------------
      -- Create a promptbox for each screen
      -- Командная строка - виджет реализующий командную строку на панели задач
      s.mypromptbox = awful.widget.prompt()
      -- Create an imagebox widget which will contains an icon indicating which layout we're using.
      -- We need one layoutbox per screen.
      -- Кнопка переключения макетов расположения окон
      s.mylayoutbox = awful.widget.layoutbox(s)
      -- декларируем для неё назначения кнопок мыши
      s.mylayoutbox:buttons(awful.util.table.join(
			       -- Переключить на макет вперед
			       awful.button({ }, 1, function () awful.layout.inc( 1) end),
			       -- Переключить на макет назад
			       awful.button({ }, 3, function () awful.layout.inc(-1) end),
			       -- То же самое для боковых кнопок
			       awful.button({ }, 4, function () awful.layout.inc( 1) end),
			       awful.button({ }, 5, function () awful.layout.inc(-1) end)))
      -- Create a taglist widget
      s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, taglist_buttons)

      -- Create a tasklist widget
      s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, tasklist_buttons)

      -- Create the wibox
      s.mywibox = awful.wibar({ position = "top", screen = s })

      -- Add widgets to the wibox
      s.mywibox:setup {
	 layout = wibox.layout.align.horizontal,
	 { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
            s.mypromptbox,
	 },
	 s.mytasklist, -- Middle widget
	 { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
--            thermalwidget,
            mykeyboardlayout,
            wibox.widget.systray(),
            mytextclock,
            s.mylayoutbox,
	 },
      }
end)
-- }}}

-- {{{ Mouse bindings
-------------------------------------------------------------------------------
--  Назначения мыши
-------------------------------------------------------------------------------
root.buttons(awful.util.table.join(
		-- Правая кнопка - вызов меню
		awful.button({ }, 3, function () mymainmenu:toggle() end),
		-- Боковые кнопки - переключение тэгов по порядку
		awful.button({ }, 4, awful.tag.viewnext),
		awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
-------------------------------------------------------------------------------
--  Назначения клавиатуры
-------------------------------------------------------------------------------
-- Глобальные назначения клавиш
globalkeys = awful.util.table.join(
   -- Переключение рабочих столов
   awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
      {description="показать справку", group="awesome"}),
   awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
      {description = "предыдущее", group = "tag"}),
   awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
      {description = "следующее", group = "tag"}),
   awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
      {description = "назад", group = "tag"}),
   awful.key({ modkey,           }, "Escape", awful.tag.history.restore),
   -- Переключение фокуса клиентских окон
   awful.key({ modkey,           }, "j",
      function ()
	 awful.client.focus.byidx( 1)
      end,
      {description = "фокус на следующее окно", group = "client"}
   ),
   awful.key({ modkey,           }, "k",
      function ()
	 awful.client.focus.byidx(-1)
      end,
      {description = "фокус на предыдущее окно", group = "client"}
   ),
   -- Вызвать меню
--   awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
--      {description = "главное меню", group = "awesome"}),
   awful.key({ "Control"   }, "Escape", function () mymainmenu:show() end,
      {description = "главное меню", group = "awesome"}),

   -- Layout manipulation
   -- Манипуляция областями экрана (перестановка клиентов)
   awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
      {description = "поменять со следующим окном", group = "client"}),
   awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
      {description = "поменять с предыдущим окном", group = "client"}),
   awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
      {description = "focus the next screen", group = "screen"}),
   awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
      {description = "focus the previous screen", group = "screen"}),
   awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
      {description = "jump to urgent client", group = "client"}),
   awful.key({ modkey,           }, "Tab",
      function ()
	 awful.client.focus.history.previous()
	 if client.focus then
	    client.focus:raise()
	 end
      end,
      {description = "назад", group = "client"}),

   -- Standard program
   -- Запуск стандартных программ
   -- Заблокировать экран
   awful.key({ modkey, "Control" }, "b", function () awful.util.spawn("xscreensaver-command -lock") end),
   -- Терминал
   awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
      {description = "открыть терминал", group = "launcher"}),
   -- Запуск Emacs
   awful.key({ modkey,           }, "e", function () awful.util.spawn("emacsclient -c") end,
      {description = "запуск Emacs", group = "launcher"}),
   -- Запуск firefox
   awful.key({ modkey, "Shift" }, "w", function () awful.util.spawn("firefox") end,
      {description = "запуск Firefox", group = "launcher"}),
   
   -- Перезапуск awesome
   awful.key({ modkey, "Control" }, "r", awesome.restart,
      {description = "рестарт awesome", group = "awesome"}),
   awful.key({ modkey, "Shift"   }, "q", awesome.quit,
      {description = "выход из awesome", group = "awesome"}),

   awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
      {description = "increase master width factor", group = "layout"}),
   awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
      {description = "decrease master width factor", group = "layout"}),
   awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
      {description = "increase the number of master clients", group = "layout"}),
   awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
      {description = "decrease the number of master clients", group = "layout"}),
   awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
      {description = "increase the number of columns", group = "layout"}),
   awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
      {description = "decrease the number of columns", group = "layout"}),
   awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
      {description = "select next", group = "layout"}),
   awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
      {description = "select previous", group = "layout"}),

   awful.key({ modkey, "Control" }, "n",
      function ()
	 local c = awful.client.restore()
	 -- Focus restored client
	 if c then
	    client.focus = c
	    c:raise()
	 end
      end,
      {description = "restore minimized", group = "client"}),

   --скриншоты будут создаваться в формате "год-месяц-день-час-минута-секунда.png"
   --скриншот всего экрана
   awful.key({}, "Print", function() awful.util.spawn("scrot "..os.getenv("HOME").."/images/screenshots/%Y-%m-%d-%H-%M-%S.png") end ),
   -- скриншот активного окна
   awful.key({"Shift"}, "Print", function() awful.util.spawn("scrot -u '"..os.getenv("HOME").."/images/screenshots/window_%Y-%m-%d-%H-%M-S.png'") end ),
   
   -- Prompt
   -- Командная строка
   awful.key({ modkey },            "r",     function () awful.screen.focused().mypromptbox:run() end,
      {description = "командная строка", group = "launcher"}),
   --[[
      awful.key({ modkey }, "x",
      function ()
      awful.prompt.run {
      prompt       = "Запуск кода на Lua: ",
      textbox      = awful.screen.focused().mypromptbox.widget,
      exe_callback = awful.util.eval,
      history_path = awful.util.get_cache_dir() .. "/history_eval"
      }
      end,
      {description = "запуск кода на lua", group = "awesome"}),
   ]]--
   -- Menubar
   awful.key({ modkey }, "p", function() menubar.show() end,
      {description = "показать панель меню", group = "launcher"})
)
-- Клиентские назначения клавиш
clientkeys = awful.util.table.join(
   -- Развернуть на весь экран
   awful.key({ modkey,           }, "f",
      function (c)
	 c.fullscreen = not c.fullscreen
	 c:raise()
      end,
      {description = "toggle fullscreen", group = "client"}),
   -- Закрыть окно
   awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end,
      {description = "close", group = "client"}),
   -- Перевести окно  в плавающий режим
   awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
      {description = "toggle floating", group = "client"}),
   -- Сделать данной клиентское окно главным
   awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
      {description = "move to master", group = "client"}),
   -- Переместить окно на другой экран
   awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
      {description = "move to screen", group = "client"}),
   -- Поместить окно поверх всех
   awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end,
      {description = "toggle keep on top", group = "client"}),
   -- Минимизировать окно
   awful.key({ modkey,           }, "n",
      function (c)
	 -- The client currently has the input focus, so it cannot be
	 -- minimized, since minimized clients can't have the focus.
	 c.minimized = true
      end ,
      {description = "minimize", group = "client"}),
   -- Максимизировать окно
   awful.key({ modkey,           }, "m",
      function (c)
	 c.maximized = not c.maximized
	 c:raise()
      end ,
      {description = "maximize", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
-------------------------------------------------------------------------------
--  Переключение тэгов и операции с клиентами и тэгами на каждом из экранов
-------------------------------------------------------------------------------
for i = 1, 9 do
   globalkeys = awful.util.table.join(globalkeys,
				      -- View tag only.
				      -- modkey + <номер тэга>
				      -- Переключиться в выбранный тэг
				      awful.key({ modkey }, "#" .. i + 9,
					 function ()
					    local screen = awful.screen.focused()
					    local tag = screen.tags[i]
					    if tag then
					       tag:view_only()
					    end
					 end,
					 {description = "view tag #"..i, group = "tag"}),
				      -- Toggle tag display.
				      -- modkey + Ctrl + <номер тэга>
				      -- Совместить выбранный тэг с текущим
				      awful.key({ modkey, "Control" }, "#" .. i + 9,
					 function ()
					    local screen = awful.screen.focused()
					    local tag = screen.tags[i]
					    if tag then
					       awful.tag.viewtoggle(tag)
					    end
					 end,
					 {description = "toggle tag #" .. i, group = "tag"}),
				      -- Move client to tag.
				      -- modkey + <номер тэга>
				      -- Переместить клиент в фокусе на выьранный тэг
				      awful.key({ modkey, "Shift" }, "#" .. i + 9,
					 function ()
					    if client.focus then
					       local tag = client.focus.screen.tags[i]
					       if tag then
						  client.focus:move_to_tag(tag)
					       end
					    end
					 end,
					 {description = "move focused client to tag #"..i, group = "tag"}),
				      -- Toggle tag on focused client.
				      -- modkey + <номер тэга>
				      -- Переместить клиент в фокусе на выбранный тэг, оставив его и в текущем тэге
				      awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
					 function ()
					    if client.focus then
					       local tag = client.focus.screen.tags[i]
					       if tag then
						  client.focus:toggle_tag(tag)
					       end
					    end
					 end,
					 {description = "toggle focused client on tag #" .. i, group = "tag"})
   )
end

-------------------------------------------------------------------------------
--  Назначение кнопок мыши для каждого клиента
-------------------------------------------------------------------------------
clientbuttons = awful.util.table.join(
   awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
   awful.button({ modkey }, 1, awful.mouse.client.move),
   awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
-- Задать глобальные клавиши
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
-------------------------------------------------------------------------------
--  Правила приложений
-------------------------------------------------------------------------------
awful.rules.rules = {
   -- All clients will match this rule.
   -- Главная роль для всех приложений
   { rule = { },
     -- задается толщина рамки окна
     properties = { border_width = beautiful.border_width,
		    -- цвет рамки окна не в фокусе
		    border_color = beautiful.border_normal,
		    focus = awful.client.focus.filter,
		    raise = true,
		    -- горячие клавиши
		    keys = clientkeys,
		    -- кнопки мыши
		    buttons = clientbuttons,
		    screen = awful.screen.preferred,
		    placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
   },

   -- Floating clients.
   { rule_any = {
        instance = {
	   "DTA",  -- Firefox addon DownThemAll.
	   "copyq",  -- Includes session name in class.
        },
        class = {
	   "Arandr",
	   "Gpick",
	   "Kruler",
	   "MessageWin",  -- kalarm.
	   "Sxiv",
	   "Wpa_gui",
	   "pinentry",
	   "veromix",
	   "xtightvncviewer"},

        name = {
	   "Event Tester",  -- xev.
        },
        role = {
	   "AlarmWindow",  -- Thunderbird's calendar.
	   "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
   }, properties = { floating = true }},

   -- Add titlebars to normal clients and dialogs
   { rule_any = {type = { "normal", "dialog" }
		}, properties = { titlebars_enabled = true }
   },

   -- Set Firefox to always map on the tag named "2" on screen 1.
   -- { rule = { class = "Firefox" },
   --   properties = { screen = 1, tag = "2" } },
   { rule = { class = "Galculator"},
     properties = { floating = true } },
   { rule = { class = "gnome-calendar"},
     properties = { floating = false } },
   { rule = { class = "gnome-contacts"},
     properties = { floating = true } },
   { rule = { class = "calibre"},
     properties = { floating = true } },
   -- запускать только на 1 тэге
   { rule = { class = "Thunar"},
     properties = { tag = "1-main", floating = false } },
   { rule = { class = "Spacefm"},
     properties = { tag = "1-main", floating = false } },
   { rule = { class = "Doublecmd"},
     properties = { tag = "1-main", floating = true } },
   -- запускать только на 2 тэге
   { rule = { class = "Opera"},
     properties = { tag = "2-www", floating = false } },
   { rule = { class = "Conkeror"},
     properties = { tag = "2-www", floating = false } },
   { rule = { class = "Falkon"},
     properties = { tag = "2-www", floating = false } },
   { rule = { class = "Vivaldi-stable"},
     properties = { tag = "2-www", floating = false } },   
   { rule = { class = "Tor Browser"},
     properties = { tag = "2-www", floating = true } },
   { rule = { class = "firefox"},
     properties = { tag = "2-www", floating = true } },
   { rule = { class = "Brave-browser"},
     properties = { tag = "2-www", floating = true } },
   { rule = { class = "Icecat"},
     properties = { tag = "2-www", floating = true } },
   { rule = { class = "Sylpheed"},
     properties = { tag = "2-www", floating = true } },
   { rule = { class = "NetSurf"},
     properties = { tag = "2-www", floating = true } },
   { rule = { class = "Next"},
     properties = { tag = "2-www", floating = false } },
   { rule = { class = "Thunderbird"},
     properties = { tag = "2-www", floating = true } },      
   { rule = { class = "Otter"},
     properties = { tag = "2-www", floating = true } },
   { rule = { class = "Transmission-gtk"},
     properties = { tag = "2-www", floating = false } },
   { rule = { class = "Chromium"},
     properties = { tag = "2-www", floating = false } },
   { rule = { class = "Pale moon"},
     properties = { tag = "2-www", floating = false } },      
   { rule = { class = "Midori"},
     properties = { tag = "2-www", floating = false } },      
   { rule = { class = "Gnethogs"},
     properties = { tag = "2-www", floating = false } },      
    -- запускать только на 3 тэге
   { rule = { class = "Geany"},
     properties = { tag = "3-dev", floating = false } },
   --    { rule = { class = "Giggle"},
   --      properties = { tag = "4-develop", floating = true } },
   { rule = { class = "Git-gui"},
     properties = { tag = "3-dev", floating = true, maximized_vertical = true, maximized_horizontal = true } },
   { rule = { class = "GitKraken"},
     properties = { tag = "3-dev", floating = true, maximized_vertical = true, maximized_horizontal = true } },
   --    { rule = { class = "Coedit"},
   --      properties = { tag = "4-develop", floating = true } },
   { rule = { class = "Emacs"},
     properties = { tag = "3-dev", floating = false, maximized_vertical = true, maximized_horizontal = true } },
   { rule = { class = "sqlitestudio"},
     properties = { tag = "3-dev", floating = false, maximized_vertical = true, maximized_horizontal = true } },
   { rule = { class = "sqliteman"},
     properties = { tag = "3-dev", floating = false, maximized_vertical = true, maximized_horizontal = true } },
   { rule = { class = "consulo"},
     properties = { tag = "3-dev", floating = false, maximized_vertical = true, maximized_horizontal = true } },
   { rule = { class = "QtCreator"},
     properties = { tag = "3-dev", floating = false, maximized_vertical = true, maximized_horizontal = true } },
   { rule = { class = "kexi"},
     properties = { tag = "3-dev", floating = false, maximized_vertical = true, maximized_horizontal = true } },
   { rule = { class = "ring"},
     properties = { tag = "3-dev", floating = false, maximized_vertical = true, maximized_horizontal = true } },   
   --    { rule = { class = "MonoDevelop"},
   --      properties = { tag = "3-dev", floating = true } },
   --    { rule = { class = "dlangide"},
   --      properties = { tag = "3-dev", floating = true } },
   { rule = { class = "Eclipse"},
     properties = { tag = "3-dev", floating = true } },
   { rule = { class = "NetBeans IDE 8.2"},
     properties = { tag = "3-dev", floating = true } },
   { rule = { class = "jetbrains-idea-ce"},
     properties = { tag = "3-dev", floating = true } },
   --    { rule = { class = "QtCreator"},
   --      properties = { tag = "3-dev", floating = true } },
   { rule = { class = "jetbrains-gogland"},
     properties = { tag = "3-dev", floating = true } },
   { rule = { class = "jetbrains-studio"},
     properties = { tag = "3-dev", floating = true } },
   { rule = { class = "RStudio"},
     properties = { tag = "3-dev", floating = true } },   
   --    { rule = { class = "Gnome-builder"},
   --      properties = { tag = "3-dev", floating = true } },
   { rule = { class = "liteide"},
     properties = { tag = "3-dev", floating = true } },
   { rule = { class = "codelite"},
     properties = { tag = "3-dev", floating = true } },      
   { rule = { class = "Glade"},
     properties = { tag = "3-dev", floating = true } },
   { rule = { class = "Anjuta"},
     properties = { tag = "3-dev", floating = true } },
   { rule = { class = "Valama"},
     properties = { tag = "3-dev", floating = true } },
   { rule = { class = "Code"},
     properties = { tag = "3-dev", floating = true } },
   { rule = { class = "VSCodium"},
     properties = { tag = "3-dev", floating = true } },
   { rule = { class = "DB Browser for SQLite"},
     properties = { tag = "3-dev", floating = true } },
   { rule = { class = "Wxglade.py"},
     properties = { tag = "3-dev", floating = true } },
   --    { rule = { class = "jetbrains-pycharm"},
   --      properties = { tag = "3-dev", floating = true } },
   { rule = { class = "Codeblocks"},
     properties = { tag = "3-dev", floating = true } },
   { rule = { class = "SWT"},
     properties = { tag = "3-dev", floating = false, maximized_vertical = true, maximized_horizontal = true } },
   { rule = { class = "F4"},
     properties = { tag = "3-dev", floating = false, maximized_vertical = true, maximized_horizontal = true } },
   { rule = { class = "DrRacket"},
     properties = { tag = "3-dev", floating = false, maximized_vertical = true, maximized_horizontal = true } },      
   { rule = { class = "Lazarus"},
     properties = { tag = "3-dev", floating = true } },
   -- запускать только на 4 тэге
   { rule = { class = "Wine" },
     properties = { tag = "4-work", floating = true, maximized_vertical = false, maximized_horizontal = false  } },
   { rule = { class = "winword.exe" },
     properties = { tag = "4-work", floating = true, maximized_vertical = false, maximized_horizontal = false  } },
   { rule = { class = "excel.exe" },
     properties = { tag = "4-work", floating = true, maximized_vertical = false, maximized_horizontal = false  } },
   { rule = { class = "evince"},
     properties = { tag = "4-work", floating = false, maximized_vertical = true, maximized_horizontal = true } },
   { rule = { class = "DesktopEditors"},
     properties = { tag = "4-work", floating = false, maximized_vertical = true, maximized_horizontal = true } },
   { rule = { class = "libreoffice"},
     properties = { tag = "4-work", floating = true } },
   { rule = { class = "libreoffice-draw"},
     properties = { tag = "4-work", floating = false } },
   { rule = { class = "Xsane"},
     properties = { tag = "4-work", floating = true } },
   { rule = { class = "Leafpad"},
     properties = { tag = "4-work", floating = true } },
   { rule = { class = "QGIS3"},
     properties = { tag = "4-work", floating = true } },
   { rule = { class = "Gnome-calendar"},
     properties = { floating = false } },
   { rule = { class = "Dia"},
     properties = { tag = "4-work", floating = true, maximized_vertical = true, maximized_horizontal = true } },
   { rule = { class = "Orange Canvas"},
     properties = { tag = "4-work", floating = true, maximized_vertical = true, maximized_horizontal = true } },
   -- Skype запускать только на 5 тэге
   { rule = { class = "Skype" },
     properties = { tag = "5-IM", floating = false } },
   { rule = { class = "skypeforlinux" },
     properties = { tag = "5-IM", floating = false } },
   { rule = { class = "Viber"},
     properties = { tag = "5-IM", floating = false } },
   { rule = { class = "icq"},
     properties = { tag = "5-IM", floating = false } },
   { rule = { class = "whatsapp-desktop"},
     properties = { tag = "5-IM", floating = false } },
   { rule = { class = "WhatsApp"},
     properties = { tag = "5-IM", floating = false } },
   { rule = { class = "whatsapp-nativefier-d52542"},
     properties = { tag = "5-IM", floating = false } },
   { rule = { class = "Franz"},
     properties = { tag = "5-IM", floating = false } },
   { rule = { class = "Pidgin"},
     properties = { tag = "5-IM", floating = false } },
   { rule = { class = "Zoiper"},
     properties = { tag = "5-IM", floating = false } },
   { rule = { class = "TelegramDesktop"},
     properties = { tag = "5-IM", floating = false } },
   { rule = { class = "Slack"},
     properties = { tag = "5-IM", floating = false } },
   { rule = { class = "discord"},
     properties = { tag = "5-IM", floating = false } },
   { rule = { class = "QuiteRss"},
     properties = { tag = "5-IM", floating = false } },
   -- запускать только на 6 тэге          
   { rule = { class = "smplayer" },
     properties = { tag = "6-media", floating = true } },
   { rule = { class = "Gradio" },
     properties = { tag = "6-media", floating = true } },
   { rule = { class = "mpv" },
     properties = { tag = "6-media", floating = false } },
   { rule = { class = "Xnoise" },
     properties = { tag = "6-media", floating = true } },
   { rule = { class = "xine" },
     properties = { tag = "6-media", floating = true } },
   { rule = { class = "MPlayer" },
     properties = { tag = "6-media", floating = true } },
   { rule = { class = "Vlc" },
     properties = { tag = "6-media", floating = true } },
   { rule = { class = "Bombono-dvd" },
     properties = { tag = "6-media", floating = false } },
   { rule = { class = "Ghb" },
     properties = { tag = "6-media", floating = false } },
   { rule = { class = "soundconverter" },
     properties = { tag = "6-media", floating = false } },
   { rule = { class = "xt7-player-mpv" },
     properties = { tag = "6-media", floating = false } },
   { rule = { class = "Shortwave" },
     properties = { tag = "6-media", floating = true } },
   -- VirtualBox запускать только на 7 тэге
   { rule = { class = "VirtualBox"},
     properties = { tag = "7-vbox", floating = true } },
   { rule = { class = "virtualbox"},
     properties = { tag = "7-vbox", floating = true } },
   -- "Коньки": без рамки и плавать
   { rule = { class = "Conky"},
     properties = { border_width = 0, floating = true } }
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
			 -- Set the windows at the slave,
			 -- i.e. put it at the end of others instead of setting it master.
			 -- if not awesome.startup then awful.client.setslave(c) end

			 if awesome.startup and
			    not c.size_hints.user_position
			 and not c.size_hints.program_position then
			    -- Prevent clients from being unreachable after screen count changes.
			    awful.placement.no_offscreen(c)
			 end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
			 -- buttons for the titlebar
			 local buttons = awful.util.table.join(
			    awful.button({ }, 1, function()
				  client.focus = c
				  c:raise()
				  awful.mouse.client.move(c)
			    end),
			    awful.button({ }, 3, function()
				  client.focus = c
				  c:raise()
				  awful.mouse.client.resize(c)
			    end)
			 )

			 awful.titlebar(c) : setup {
			    { -- Left
			       awful.titlebar.widget.iconwidget(c),
			       buttons = buttons,
			       layout  = wibox.layout.fixed.horizontal
			    },
			    { -- Middle
			       { -- Title
				  align  = "center",
				  widget = awful.titlebar.widget.titlewidget(c)
			       },
			       buttons = buttons,
			       layout  = wibox.layout.flex.horizontal
			    },
			    { -- Right
			       awful.titlebar.widget.floatingbutton (c),
			       awful.titlebar.widget.maximizedbutton(c),
			       awful.titlebar.widget.stickybutton   (c),
			       awful.titlebar.widget.ontopbutton    (c),
			       awful.titlebar.widget.closebutton    (c),
			       layout = wibox.layout.fixed.horizontal()
			    },
			    layout = wibox.layout.align.horizontal
						   }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
			 if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
			 and awful.client.focus.filter(c) then
			    client.focus = c
			 end
end)

client.connect_signal(
   "focus",
   function(c)
      c.border_color = beautiful.border_focus
      c.opacity = 1
   end
)
client.connect_signal(
   "unfocus",
   function(c)
      c.border_color = beautiful.border_normal
      c.opacity = 0.7
   end
)

-- }}}

awful.util.spawn_with_shell("xscreensaver -no-splash")
--[[
   -- Виджет переключения клавиатуры
   kbdwidget = wibox.widget.textbox(" Eng ")
   kbdwidget.border_width = 1
   kbdwidget.border_color = beautiful.fg_normal
   kbdwidget:set_text(" Eng ")
   kbdstrings = {[0] = " Eng ", 
   [1] = " Рус ",
   [3] = " Укр "}
   dbus.request_name("session", "ru.gentoo.kbdd")
   dbus.add_match("session", "interface='ru.gentoo.kbdd',member='layoutChanged'")
   dbus.connect_signal("ru.gentoo.kbdd", function(...)
   local data = {...}
   local layout = data[2]
   kbdwidget:set_markup(kbdstrings[layout])
   end
   )
--]]
-- run_once function
function run_once(prg)
   awful.util.spawn_with_shell("pgrep -u $USER -x " .. prg .. " || (" .. prg .. ")")
end

