#!/usr/bin/lua5.3

red = require 'redis'
cli = red.connect('redis.fxnode.ru', 6379)

lgi = require 'lgi'

glib = lgi.GLib
gtk = lgi.Gtk

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-8_krivosheev.glade')

ui = bld.objects
ui.wnd.title = 'lab-8_krivosheev-cli'

x = 0
y = 0

function ui.canvas:on_draw(cr)
	cr:set_source_rgb(1, 1, 1)
	cr:paint()

	cr:set_source_rgb(0, 0.5, 1, 1)
	cr:rectangle(x, y, 10, 10)
	cr:fill()

	return true
end

function ui.wnd:on_destroy(...)
	gtk.main_quit()
end

function on_timer()
	x = cli:get('krivosheevx')
	y = cli:get('krivosheevy')

	ui.canvas:queue_draw()
	glib.timeout_add(glib.PRIORITY_DEFAULT, 10, on_timer)
end

ui.wnd:show_all()

on_timer()

gtk.main()
