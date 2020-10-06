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
if type(tonumber(uint.TextDrop.text))=='number' and tonumber(uint.TextDrop.text)=>0 and tonumber(uint.TextDrop.text)<16
	then
	v=tonumber(uint.TextDrop.text)
end
while v>0 
then
if v%2==1
		then
		ALockCheck.active=true;
		v-=1;
else
if (v/8)%2==0
then

	end
end 

function uint.TextDrop:on_changed(...)
update_alt()
end

uint.wnd.title = 'lab3Krivoy'
uint.wnd.on_destroy = gtk.main_quit
uint.wnd:show_all()

gtk.main()



