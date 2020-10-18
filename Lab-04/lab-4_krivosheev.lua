#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
pixbuf = lgi.GdkPixbuf.Pixbuf

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-4_krivosheev.glade')

ui = bld.objects

function ui.But_Add:on_clicked(...)
	name = ui.txt_name.text
	value = tonumber(ui.txt_value.text)

	px = pixbuf.new_from_file(ui.fileref[ui.Combo])

	i = ui.mdl_items:append()
	ui.mdl_items[i] = {[1] = name, [2] = value, [3] = px}
end

rdr_txt = gtk.CellRendererText {}
rdr_pix = gtk.CellRendererPixbuf {}

c1 = gtk.TreeViewColumn { title = 'Name', {rdr_txt, { text = 1 }}}
c2 = gtk.TreeViewColumn { title = 'Value', {rdr_txt, { text = 2 }}}
c3 = gtk.TreeViewColumn { title = 'Image', {rdr_pix, { pixbuf = 3 }}}

ui.lst_items:append_column(c1)
ui.lst_items:append_column(c2)
ui.lst_items:append_column(c3)

ui.wnd.title = 'lab'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()