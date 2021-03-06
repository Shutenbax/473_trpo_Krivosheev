#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
cairo = lgi.cairo

gtk.init()
local wnd = gtk.Window
{
	title = 'Krivosheev',
	on_delete_event = gtk.main_quit,
	gtk.Box
	{
		border_width = 4,
		spacing = 4,
		rientation = 'VERTICAL',
		gtk.DrawinArea
		{
			expand = true,
			id = 'canvas',
			width = 256,
			height = 256
		},
		gtk.Box
		{
			orientation = 'HORIZONTAL',
			spacing = 4,
			gtk.Button
			{
				id = 'button1',
				label = 'a'
			},
			gtk.Button
			{
				id = 'button2',
				label = 'b'
			}
		}
	}
}

local cnv = wnd.child.canvas
local btn1 = wnd.child.button1
local btn2 = wnd.child.button2


bld = gtk.Builder()
--bld:add_from_file('lab-7_krivosheev.glade')

--ui = bld.objects

function ui.canvas:on_draw(cr)
	cr:set_source_rgb(1, 1, 1)
	cr:paint()

	for x = 1, 10 do
		for y = 1, 10 do
			cr:set_source_rgb(x / 10, y / 10, 0.75)
			cr:rectangle(x * 15, y * 15, 10, 10)
			cr:fill()
		end
	end

	return true
end

function ui.wnd:on_destroy(...)
	gtk.main_quit()
end

ui.wnd:show_all()

gtk.main()
