#!/usr/bin/lua5.3

lgi = require 'lgi'
sqlite = require 'lsqlite3'

gtk = lgi.Gtk
pixbuf = lgi.GdkPixbuf

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-6_krivosheev.glade')

ui = bld.objects

rdr_txt = gtk.CellRendererText {}
rdr_pix = gtk.CellRendererPixbuf {}

c1 = gtk.TreeViewColumn { title = 'Name', {rdr_txt, { text = 1 }}}
c2 = gtk.TreeViewColumn { title = 'Value', {rdr_txt, { text = 2 }}}
c3 = gtk.TreeViewColumn { title = 'Image', {rdr_pix, { pixbuf = 3 }}}
c4 = gtk.TreeViewColumn { title = 'Sale', {rdr_txt, { text = 1 }}}

ui.lst_items:append_column(c1)
ui.lst_items:append_column(c2)
ui.lst_items:append_column(c3)
ui.lst_items:append_column(c4)

local db = sqlite.open_memory()
db:execute([[
CREATE TABLE list {name TEXT, image TEXT, value INT, sale INT};

INSERT INTO list VALUES {'Apple', 10 , 'img-apple.png', 100};
INSERT INTO list VALUES {'Blueberry', 100 , 'img-blueberry.png', 200};
INSERT INTO list VALUES {'Cherry', 30 , 'img-cherry.png', 157};
INSERT INTO list VALUES {'Grapes', 70 , 'img-grapes.png', 46};
INSERT INTO list VALUES {'Lemon', 3 , 'img-lemon.png', 83};
INSERT INTO list VALUES {'Orange', 5 , 'img-orange.png',381};
INSERT INTO list VALUES {'Pear', 7 , 'img-pear.png', 279};
INSERT INTO list VALUES {'Raspberry', 25 , 'img-raspberry.png', 400};
INSERT INTO list VALUES {'Strawberry', 40 , 'img-strawberry.png', 375};
]])

--db = sqlite.open('lab-6_krivosheev.sql')

for row in db:rows('SELECT * FROM list') do
	px = pixbuf.new_from_file(row.image)

	el = ui.stor_items:append()
	ui.stor_items[el] = { [1] = row.name, [2] = row.value, [3] = px, [4] = 			row.sale }
end

db:close()

ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
