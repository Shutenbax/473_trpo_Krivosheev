#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
cairo = lgi.cairo

gtk.init()

local wnd = gtk.Window
{
	title = 'lab-7_krivosheev_noglade',
	default_width = 256,
	default_height = 256,
	on_delete_event = gtk.main_quit,
	gtk.Box
	{
		border_width = 4,
		spacing = 4,
		orientation = 'VERTICAL',
		gtk.DrawingArea
		{
			expand = true,
			id = 'area',
			width = 256,
			height = 256
		},
		gtk.Box
		{
			orientation = 'HORIZONTAL',
			spacing = 4,
			gtk.Button
			{
				id = 'butonA',
				label = 'A'
			},

			gtk.Button
			{
				id = 'butonB',
				label = 'B'
			}
		}
	}
}

local areaa = wnd.child.area
local butA = wnd.child.butonA
local butB = wnd.child.butonB

r = 0
g = 0
b = 0

function areaa:on_draw(er)
	er:set_source_rgb(0, 0, 0)
	er:paint()

	for x = 1, 10 do
		for y = 1, 10 do
			er:set_source_rgb(x/10 * r, y/10 * g, 0.75 * b)
			er:rectangle(x*15, y*15, 10, 10)
			er:fill()
		end
	end
	
	return true
end

function butA:on_clicked(...)
	r = 1
	g = 1
	b = 1

	areaa:queue_draw()
end

function butB:on_clicked(...)
	r = 0.9
	g = 0.6
	b = 0.3
	areaa:queue_draw()
end

function wnd:on_destroy(...)
	gtk.main_quit()
end

wnd:show_all()
gtk.main()
	
