#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-5_krivosheev.glade')

ui = bld.objects

function ui.buttonNew:on_clicked(...)
	ui.wnd2:show_all()
	dio:run()
end

function ui.buttonHide:on_clicked(...)
	ui.wnd2:hide()
end

dio = gtk.MessageDialog
{
	message_type = gtk.MessageType.INFO,
	buttons = gtk.ButtonsType.OK,
	text = "Warning",
	secondary_text = "wnd2 open"
}

ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
