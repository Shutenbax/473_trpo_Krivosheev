lgi = require 'lgi'
gdk= lgi.Gdk
gtk = lgi.Gtk
gtk.init()

build=gtk.Builder()
build:add_from_file('lab-3_krivosheev.glade')

prov = gtk.CssProvider()
prov:load_from_path('style.css')

ctx=gtk.StyleContext()
scr=gdk.Screen.get_default()
ctx.add_provider_for_screen(scr, prov, gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

uint=build.objects

opt={uint.ARadio, uint.BRadio, uint.CRadio, uint.DRadio, uint.ERadio, uint.FRadio, uint.GRadio, uint.HRadio}

function update()
x=0
y=0
z=0
if uint.XCheck.active==true then x=1 end
if uint.YCheck.active==true then y=1 end
if uint.ZCheck.active==true then z=1 end

v=x+y*2+z*4
opt[v+1].active=true

uint.ResultGen.label=v
end

function uint.XCheck:on_clicked(...)
update()
end

function uint.YCheck:on_clicked(...)
update()
end

function uint.ZCheck:on_clicked(...)
update()
end

function update_alt()
if type(tonumber(uint.TextDrop.text))=='number'
then
if tonumber(uint.TextDrop.text)>=0 and tonumber(uint.TextDrop.text)<16
	then
	w=tonumber(uint.TextDrop.text)


if w>=8
then
	uint.DLockCheck.active=true
		w=w-8
end
if w>=4
	then
	uint.CLockCheck.active=true
		w=w-4
end
if w>=2
	then
	uint.BLockCheck.active=true
		w=w-2
	end
if w%2==1
		then
		uint.ALockCheck.active=true
		w=w-1
end
end 
end
end

function uint.TextDrop:on_changed(...)
uint.ALockCheck.active=false
uint.BLockCheck.active=false
uint.CLockCheck.active=false
uint.DLockCheck.active=false
update_alt()
end

uint.wnd.title = 'lab_3_Krivosheev'
uint.wnd.on_destroy = gtk.main_quit
uint.wnd:show_all()

gtk.main()



