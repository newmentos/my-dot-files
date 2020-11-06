---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "sans 12"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = 1
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "/usr/share/awesome/themes/default/taglist/squarefw.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/default/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = os.getenv("HOME").."/.config/awesome/themes/default/submenu.png"
-- theme.menu_height = 15
theme.menu_height = 25
-- theme.menu_width  = 100
theme.menu_width  = 200

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"

-------------------------------------------------------------------------------
--  Обои
-------------------------------------------------------------------------------
-- theme.wallpaper = "/usr/share/awesome/themes/default/background.png"
-- theme.wallpaper = os.getenv("HOME").."/.config/awesome/wallpaper/nature/01188_elevation_1920x1080.jpg"
-- theme.wallpaper = os.getenv("HOME").."/.config/awesome/wallpaper/nature/Ladoga_Lake_2000×1333.jpg"
-- theme.wallpaper = os.getenv("HOME").."/.config/awesome/wallpaper/RxlwP.png"
theme.wallpaper = os.getenv("HOME").."/.config/awesome/wallpaper/0213.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = "/usr/share/awesome/themes/default/layouts/fairhw.png"
theme.layout_fairv = "/usr/share/awesome/themes/default/layouts/fairvw.png"
theme.layout_floating  = "/usr/share/awesome/themes/default/layouts/floatingw.png"
theme.layout_magnifier = "/usr/share/awesome/themes/default/layouts/magnifierw.png"
theme.layout_max = "/usr/share/awesome/themes/default/layouts/maxw.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/default/layouts/fullscreenw.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/default/layouts/tilebottomw.png"
theme.layout_tileleft   = "/usr/share/awesome/themes/default/layouts/tileleftw.png"
theme.layout_tile = "/usr/share/awesome/themes/default/layouts/tilew.png"
theme.layout_tiletop = "/usr/share/awesome/themes/default/layouts/tiletopw.png"
theme.layout_spiral  = "/usr/share/awesome/themes/default/layouts/spiralw.png"
theme.layout_dwindle = "/usr/share/awesome/themes/default/layouts/dwindlew.png"

theme.awesome_icon = "/usr/share/awesome/icons/awesome64.png"
-- theme.archlinux_icon = os.getenv("HOME").."/.local/share/icons/icons/arch.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
-- theme.icon_theme = nil
-- theme.icon_theme = /usr/share/icons/Faenza-Dark

-- Иконки приложений
theme.acidrip_icon       = "/usr/share/pixmaps/acidrip.png"
theme.arista_icon        = "/usr/share/arista/ui/icon.svg"
theme.brave_icon         = "/usr/share/pixmaps/brave.png"
theme.winff_icon         = "/usr/share/icons/hicolor/16x16/apps/winff.png"
theme.transmageddon_icon = "/usr/share/icons/hicolor/16x16/apps/transmageddon.png"
theme.drracket_icon      = "/usr/share/icons/hicolor/16x16/apps/drracket.png"
theme.giteye_icon        = "/opt/giteye/icon.xpm"
theme.f4_icon            = "/opt/f4/icon.xpm"
theme.consulo_icon       = "/opt/Consulo/consulo.png"
theme.ring_icon          = os.getenv("HOME").."/src/ring/applications/rnote/image/notepad.png"
theme.android_icon       = "/opt/android-studio/bin/studio.png"
theme.emacs_icon         = "/usr/share/icons/Faenza/apps/16/emacs.png"
theme.orange_icon        = "/usr/share/icons/Faenza-Dark/extras/lastfm/icons/user_orange22.png"
theme.opera_icon         = "/usr/share/icons/Faenza/apps/16/opera-browser.png"
theme.conkeror_icon      = os.getenv("HOME").."/.icons/conkeror_logo.png"
theme.firefox_icon       = "/usr/share/icons/Faenza/apps/16/firefox.png"
theme.falkon_icon        = "/usr/share/icons/hicolor/16x16/apps/falkon.png"
theme.next_icon          = "/usr/share/icons/hicolor/16x16/apps/next.png"
theme.quiterss_icon      = "/usr/share/icons/hicolor/16x16/apps/quiterss.png"
theme.icecat_icon        = "/usr/lib/icecat/browser/chrome/icons/default/default16.png"
theme.midori_icon        = "/usr/share/icons/hicolor/16x16/apps/org.midori_browser.Midori.png"
theme.thunderbird_icon   = "/usr/share/icons/Faenza/apps/16/mozilla-thunderbird.png"
theme.sylpheed_icon      = "/usr/share/pixmaps/sylpheed.png"
theme.tor_icon           = "/usr/share/pixmaps/tor-browser.png"
theme.netsurf_icon       = "/usr/share/netsurf/netsurf.png"
theme.gnethogs_icon      = "/usr/share/icons/hicolor/16x16/apps/gnethogs.png"
theme.vscode_icon        = "/usr/share/icons/visual-studio-code.png"
theme.vscodium_icon      = "/usr/share/pixmaps/vscodium.png"
theme.anjuta_icon        = "/usr/share/icons/Faenza/apps/16/anjuta.png"
theme.aporia_icon        = "/usr/share/icons/hicolor/32x32/apps/aporia.png"
theme.netbeans_icon      = "/usr/share/icons/Faenza/apps/16/netbeans.png"
theme.eclipse_icon       = "/usr/share/icons/Faenza/apps/16/eclipse.png"
theme.dlangide_icon      = "/usr/share/pixmaps/dlangui-logo1.png"
theme.coedit_icon        = "/usr/share/icons/coedit.png"
theme.codeblocks_icon    = "/usr/share/icons/hicolor/64x64/apps/codeblocks.png"
theme.monodev_icon       = "/usr/share/icons/hicolor/16x16/apps/monodevelop.png"
theme.pdfsam_icon        = "/usr/share/pixmaps/pdfsam.png"
theme.soundconverter_icon = "/usr/share/icons/hicolor/48x48/apps/soundconverter.png"
theme.idea_icon          = "/opt/idea-IC/bin/idea.png"
theme.qtcreator_icon     = "/usr/share/icons/hicolor/16x16/apps/QtProject-qtcreator.png"
theme.qgis_icon          = "/usr/share/qgis/images/icons/qgis-icon-16x16.png"
theme.gvsig_icon         = "/usr/share/icons/hicolor/16x16/apps/gvsig-desktop.png"
theme.grass_icon         = "/usr/share/icons/hicolor/16x16/apps/grass.png"
theme.pycharm_icon       = os.getenv("HOME").."/opt/pycharm/bin/pycharm.png"
theme.gogland_icon       = "~/opt/Gogland/bin/gogland.png"
theme.vbox_icon          = "/usr/share/icons/Faenza/apps/16/virtualbox.png"
theme.doublecmd_icon     = "/usr/share/pixmaps/doublecmd.png"
theme.thunar_icon        = "/usr/share/icons/Faenza/apps/16/thunar.png"
theme.nautilus_icon      = "/usr/share/icons/hicolor/scalable/apps/org.gnome.Nautilus.svg"
theme.pcmanfm_icon       = os.getenv("HOME").."/.icons/pcmanfm_15.875968992248px_1078344_easyicon.net.png"
theme.spacefm_icon       = "/usr/share/icons/hicolor/48x48/apps/spacefm.png"
theme.nemo_icon          = "/usr/share/icons/hicolor/16x16/apps/nemo.png"
theme.xsane_icon         = os.getenv("HOME").."/.local/share/icons/hicolor/128x128/apps/xsane_128px_32643_easyicon.net.png"
theme.gscan2pdf_icon         ="/usr/share/app-info/icons/archlinux-arch-community/64x64/gscan2pdf_gscan2pdf.png"
theme.pidgin_icon        = "/usr/share/icons/Faenza/apps/16/pidgin.png"
theme.chrome_icon        = "/usr/share/icons/Faenza/apps/16/google-chrome.png"
theme.vivaldi_icon       = "/usr/share/icons/hicolor/16x16/apps/vivaldi.png"
theme.chromium_icon      = "/usr/share/icons/hicolor/16x16/apps/chromium.png"
theme.palemoon_icon      = "/usr/lib/palemoon/browser/chrome/icons/default/default16.png"
theme.skype_icon         = "/usr/share/icons/Faenza/apps/16/skype.png"
theme.mailru_cloud_icon  = "/usr/share/pixmaps/mail.ru-cloud.png"
theme.viber_icon         = "/usr/share/icons/hicolor/16x16/apps/viber.png"
theme.whatsapp_icon      = "/usr/share/icons/hicolor/16x16/apps/WhatsApp-icon.png"
theme.franz_icon         = "/usr/share/icons/hicolor/16x16/apps/franz.png"
theme.zoiper_icon        = "/usr/share/pixmaps/zoiper-24.png"
theme.telegram_icon      = "/usr/share/icons/hicolor/16x16/apps/telegram.png"
theme.discord_icon       = "/usr/share/pixmaps/discord.png"
theme.geany_icon         = "/usr/share/icons/Faenza/apps/16/geany.png"
theme.gbuilder_icon      = "/usr/share/icons/hicolor/16x16/apps/org.gnome.Builder.png"
theme.gvim_icon          = "/usr/share/icons/Faenza/apps/16/gvim.png"
theme.smplayer_icon      = "/usr/share/icons/Faenza/apps/16/smplayer.png"
theme.writer_icon        = "/usr/share/icons/Faenza/apps/16/libreoffice-writer.png"
theme.calc_icon          = "/usr/share/icons/Faenza/apps/16/libreoffice-calc.png"
theme.base_icon          = "/usr/share/icons/hicolor/16x16/apps/libreoffice-base.png"
theme.draw_icon          = "/usr/share/icons/Faenza/apps/16/libreoffice-draw.png"
theme.onlyoffice_icon    = "/usr/share/icons/hicolor/16x16/apps/onlyoffice-desktopeditors.png"
theme.gcalendar_icon     = "/usr/share/icons/Faenza/apps/16/gnome-calendar.png"
theme.gcontacts_icon     = "/usr/share/icons/Faenza/apps/16/gnome-contacts.png"
theme.galculator_icon    = "/usr/share/icons/Faenza/apps/16/galculator.png"
theme.glade_icon         = "/usr/share/icons/Faenza/apps/16/glade.png"
theme.wxglade_icon       = "/usr/share/pixmaps/wxglade.png"
theme.rstudio_icon       = "/usr/share/icons/hicolor/16x16/apps/rstudio.png"
theme.lazarus_icon       = "/usr/lib/lazarus/images/icons/lazarus16x16.png"
theme.excel_icon         = "/usr/share/icons/Faenza/mimetypes/16/application-vnd.ms-excel.png"
theme.word_icon          = "/usr/share/icons/Faenza/mimetypes/16/application-msword.png"
theme.dia_icon           = "/usr/share/icons/hicolor/16x16/apps/dia.png"
theme.doublecmd_icon     = "/usr/share/pixmaps/doublecmd.png"
theme.liteide_icon       = "/usr/share/pixmaps/liteide.png"
theme.codelite_icon      = "/usr/share/icons/hicolor/32x32/apps/codelite.png"
theme.vbox_icon          = "/usr/share/icons/Faenza/apps/16/virtualbox.png"
theme.valama_icon        = "/usr/share/pixmaps/valama.png"
theme.leafpad_icon       = "/usr/share/icons/Faenza/apps/16/leafpad.png"
theme.evince_icon        = "/usr/share/icons/Faenza/apps/16/evince.png"
theme.sqlitebrowser_icon = "/usr/share/icons/hicolor/16x16/apps/sqlitebrowser.png"
theme.sqlitestudio_icon  = "/usr/share/pixmaps/sqlitestudio.svg"
theme.sqliteman_icon     = "/usr/share/icons/hicolor/32x32/apps/sqliteman.png"
theme.pgadmin_icon       = "/usr/share/icons/hicolor/16x16/apps/pgAdmin4.png"
theme.kexi_icon          = "/usr/share/kexi/icons/hicolor/16x16/actions/web_browser.png"
theme.transmission_icon  = "/usr/share/pixmaps/transmission.png"
theme.slack_icon         = "/usr/share/pixmaps/slack.png"
theme.xnoise_icon        = "/usr/share/icons/hicolor/32x32/apps/xnoise.png"
theme.xine_icon          = "/usr/share/icons/hicolor/16x16/apps/xine.png"
theme.xt7_icon           = "/usr/share/pixmaps/xt7-player-mpv.png"
theme.shortwave_icon     = "/usr/share/icons/hicolor/scalable/apps/de.haeckerfelix.Shortwave.svg"
theme.devede_icon        = "/usr/share/devedeng/devedeng.png"
theme.dvdrip_icon        = "/usr/share/perl5/vendor_perl/Video/DVDRip/icon.xpm"
theme.gradio_icon        = "/usr/share/icons/hicolor/16x16/apps/de.haeckerfelix.gradio.png"
theme.xfburn_icon        = "/usr/share/icons/hicolor/16x16/stock/media/stock_xfburn.png"
theme.vlc_icon           = "/usr/share/icons/hicolor/16x16/apps/vlc.png"
theme.avidemux_icon      = "/usr/share/icons/hicolor/128x128/apps/org.avidemux.Avidemux.png"
theme.pitivi_icon        = "/usr/share/icons/hicolor/22x22/apps/org.pitivi.Pitivi.png"
theme.handbrake_icon     = "/usr/share/icons/hicolor/scalable/apps/hb-icon.svg"
theme.bombono_icon       = "/usr/share/icons/hicolor/16x16/apps/bombono-dvd.png"
-- theme.giggle_icon        = "/usr/share/icons/hicolor/48x48/apps/giggle.png"
theme.gitkraken_icon     = "/usr/share/pixmaps/gitkraken.png"
theme.git_icon           = "/usr/share/gitweb/static/git-favicon.png"
theme.calibre_icon       = "/usr/local/share/icons/hicolor/48x48/apps/calibre-gui.png"
theme.otter_icon         = "/usr/share/icons/hicolor/16x16/apps/otter-browser.png"
theme.yandexdisk_icon    = "/usr/share/yd-tools/icons/yd-128_g.png"
theme.nextcloud_icon     = "/usr/share/icons/hicolor/16x16/apps/Nextcloud.png"
theme.astudio_icon       = "/opt/android-studio/bin/studio.png"

-- Иконки элементов меню
theme.poweroff_icon         = os.getenv("HOME").."/.local/share/icons/shutdown.png"
theme.logout_icon           = os.getenv("HOME").."/.local/share/icons/logout.png"
theme.reboot_icon           = os.getenv("HOME").."/.local/share/icons/reboot.png"
theme.hibernate_icon        = os.getenv("HOME").."/.local/share/icons/hibernate.png"
theme.lock_icon             = os.getenv("HOME").."/.local/share/icons/lock.png"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
