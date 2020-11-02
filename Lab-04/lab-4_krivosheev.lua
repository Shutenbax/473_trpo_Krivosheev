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
	sale = tonumber(ui.txt_sale.text)
	px = pixbuf.new_from_file(ui.Fruit_txt.text)

	i = ui.mdl_items:append()
	ui.mdl_items[i] = {[1] = name, [2] = value, [3] = px, [4]=sale}
end

rdr_txt = gtk.CellRendererText {}
rdr_pix = gtk.CellRendererPixbuf {}

c1 = gtk.TreeViewColumn { title = 'Name', {rdr_txt, { text = 1 }}}
c2 = gtk.TreeViewColumn { title = 'Value', {rdr_txt, { text = 2 }}}
c3 = gtk.TreeViewColumn { title = 'Image', {rdr_pix, { pixbuf = 3 }}}
c4 = gtk.TreeViewColumn { title = 'Sale', {rdr_txt, { text = 4 }}}

ui.lst_items:append_column(c1)
ui.lst_items:append_column(c2)
ui.lst_items:append_column(c3)
ui.lst_items:append_column(c4)

function ui.Instal:on_clicked(...)
if ui.mdl_items:append()>0
then
	file = io.open("lab-04.txt","r+")
	for y=0, 1, 1 do
	io.write(ui.mdl_items[y])
	end
	io.close(file)
end
end

ui.wnd.title = 'lab'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
