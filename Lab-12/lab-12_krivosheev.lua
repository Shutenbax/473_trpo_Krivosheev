
redis = require 'redis'
lgi = require 'lgi'

gtk = lgi.Gtk
glib = lgi.GLib

bld = gtk.Builder()
bld:add_from_file('lab-12_krivosheev.glade')

ui = bld.objects
ui.wnd.title='lab-12_krivosheev'

x = 0
y = 0
btn = 0
sr = 0
sg = 0
sb = 0

function ui.canvas:on_button_press_event(evt)
	--print('press')
	btn = 1
	ui.canvas:queue_draw()
	update_keys()
end

function ui.canvas:on_button_release_event(evt)
	--print('release')
	btn = 0
	ui.canvas:queue_draw()
	update_keys()
end


function ui.canvas:on_motion_notify_event(evt)
	--print(evt.x, evt.y)
	x = evt.x
	y = evt.y
	ui.canvas:queue_draw()
	update_keys()
end


function ui.scl_r:on_value_changed()
	sr = ui.scl_r:get_value()
	ui.canvas:queue_draw()
	update_keys()
end


function ui.scl_g:on_value_changed()
	sg = ui.scl_g:get_value()
	ui.canvas:queue_draw()
	update_keys()
end


function ui.scl_b:on_value_changed()
	sb = ui.scl_b:get_value()
	ui.canvas:queue_draw()
	update_keys()
end


function ui.canvas:on_draw(cr)
	cr:set_source_rgb(1, 1, 1, 1)
	cr:paint()

	local cid = cli:lrange('clients', 0, -1)
	for i = 1, #cid do
		cx = tonumber(cli:get(cid[i] .. '-xkrivosheev'))
		cy = tonumber(cli:get(cid[i] .. '-ykrivosheev'))
		cbtn = tonumber(cli:get(cid[i] .. '-btnkrivosheev'))
		csr = tonumber(cli:get(cid[i] .. '-srkrivosheev'))
		csg = tonumber(cli:get(cid[i] .. '-sgkrivosheev'))
		csb = tonumber(cli:get(cid[i] .. '-sbkrivosheev'))

		cr:set_source_rgb(csr, csg, csb, 1)
		if  btn == 0 then
			cr:rectangle(cx - 5, cy - 5, 10, 10)
		else
			cr:rectangle(cx - 10, cy - 10, 20, 20)
		end
		cr:fill()

		cr:move_to(cx, cy - 10)
		cr:show_text(cid[i])
	end
end


function ui.wnd:on_destroy()
	gtk.main_quit()
end


ui.wnd:show_all()

cli = redis.connect('redis.fxnode.ru', 6379)

math.randomseed(os.time())
id = ''
for i = 1, 8 do
	local j = math.random(1, 16)
	id = id .. string.sub('0123456789abcdef', j, j)
end
print('client id', id)

function update_keys()
	cli:set(id .. '-tskrivosheev', os.time())
	cli:set(id .. '-xkrivosheev', x)
	cli:set(id .. '-ykrivosheev', y)
	cli:set(id .. '-btnkrivosheev', btn)
	cli:set(id .. '-srkrivosheev', sr)
	cli:set(id .. '-sgkrivosheev', sg)
	cli:set(id .. '-sbkrivosheev', sb)

	glib.timeout_add(glib.PRIORITY_DEFAULT, 1000, update_keys);
end

function update_view()
	ui.canvas:queue_draw()
	glib.timeout_add(glib.PRIORITY_DEFAULT, 25, update_view);
end

glib.timeout_add(glib.PRIORITY_DEFAULT, 25, update_view);

update_keys()
cli:lpush('clients', id)

gtk.main()
	
