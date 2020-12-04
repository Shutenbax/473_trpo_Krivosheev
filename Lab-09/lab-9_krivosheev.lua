
local lgi = require 'lgi'

local gtk = lgi.Gtk

local bld = gtk.Builder()
bld:add_from_file('lab-9_krivosheev.glade')

local ui = bld.objects
ui.wnd.title='lab-9_krivosheev'

local x = 0
local y = 0

local btn = false

local sr = 0
local sg = 0
local sb = 0

function ui.canvas:on_button_press_event(evt)
	print('press')
	btn = true
	ui.canvas:queue_draw()
end

function ui.canvas:on_button_release_event(evt)
	print('release')
	btn = false
	ui.canvas:queue_draw()
end


function ui.canvas:on_motion_notify_event(evt)
	print(evt.x, evt.y)
	x = evt.x
	y = evt.y
	ui.canvas:queue_draw()
end


function ui.scl_r:on_value_changed()
	sr = ui.scl_r:get_value()
	ui.canvas:queue_draw()
end


function ui.scl_g:on_value_changed()
	sg = ui.scl_g:get_value()
	ui.canvas:queue_draw()
end


function ui.scl_b:on_value_changed()
	sb = ui.scl_b:get_value()
	ui.canvas:queue_draw()
end


function ui.canvas:on_draw(cr)
	cr:set_source_rgb(1, 1, 1, 1)
	cr:paint()

	cr:set_source_rgb(sr, sg, sb, 1)
	if  btn == false then
		cr:rectangle(x - 5, y - 5, 10, 10)
	else
		cr:rectangle(x - 10, y - 10, 20, 20)
	end
	cr:fill()
end


function ui.wnd:on_destroy()
	gtk.main_quit()
end


ui.wnd:show_all()
gtk.main()
	
