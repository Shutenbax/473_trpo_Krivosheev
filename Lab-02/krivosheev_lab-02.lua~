lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()
build=gtk.Builder()
build:add_from_file('Krivosheev_lab-02.glade')

uint=build.objects

uint.win.title = 'krivosheev_lab-02'
uint.win.on_destroy = gtk.main_quit
uint.win:show_all()

memory=0

function uint.AddButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
	b=tonumber(uint.SecondNumber.text)
	if type(tonumber(uint.FirstNumber.text))=='number' and type(tonumber(uint.SecondNumber.text))=='number'
	then
	uint.Result.label=a+b
	else
	uint.Result.label='error'
	end
end

function uint.SubtractButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
	b=tonumber(uint.SecondNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number' and type(tonumber(uint.SecondNumber.text))=='number'
	then
	uint.Result.label=a-b
else
	uint.Result.label='error'
	end
end

function uint.MultiplyButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
	b=tonumber(uint.SecondNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number' and type(tonumber(uint.SecondNumber.text))=='number'
	then
	uint.Result.label=a*b
else
	uint.Result.label='error'
	end
end

function uint.DivideButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
	b=tonumber(uint.SecondNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number' and type(tonumber(uint.SecondNumber.text))=='number'
	then
if tonumber(uint.SecondNumber.text)==0
then
	uint.Result.label='error'
else
uint.Result.label=a/b
end
else
	uint.Result.label='error'
	end
end

function uint.SinButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number'
	then
	uint.Result.label=math.sin(a)
else
	uint.Result.label='error'
	end
end

function uint.CosButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number'
	then
	uint.Result.label=math.cos(a)
else
	uint.Result.label='error'
	end
end

function uint.TgButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number'
	then
	uint.Result.label=math.tan(a)
else
	uint.Result.label='error'
	end
end

function uint.CtgButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number'
	then
	uint.Result.label=math.cos(a)/math.sin(a)
else
	uint.Result.label='error'
	end
end

function uint.AsinButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number'
	then
	uint.Result.label=math.asin(a)
else
	uint.Result.label='error'
	end
end

function uint.AcosButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number'
	then
	uint.Result.label=math.acos(a)
else
	uint.Result.label='error'
	end
end

function uint.AtanButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number'
	then
	uint.Result.label=math.atan(a)
else
	uint.Result.label='error'
	end
end

function uint.ActgButton:on_clicked(...)
	a=tonumber(uint.FirstNumber.text)
if type(tonumber(uint.FirstNumber.text))=='number'
	then
	uint.Result.label=math.atan2(a)
else
	uint.Result.label='error'
	end
end

function uint.CopyButton:on_clicked(...)
	a=tonumber(uint.Result.label)
if type(tonumber(uint.Result.label))=='number'
	then
	memory=tonumber(uint.Result.label)
uint.MemoryBox.label=memory
else

	end
end

function uint.PasteButton:on_clicked(...)
	uint.FirstNumber.text=memory
uint.MemoryBox.label=memory
end

function uint.MemoryPlusButton:on_clicked(...)
	a=tonumber(uint.Result.label)
if type(tonumber(uint.Result.label))=='number'
	then
uint.Result.label=a+memory
else

	end
end

function uint.MemoryMinusButton:on_clicked(...)
	a=tonumber(uint.Result.label)
if type(tonumber(uint.Result.label))=='number'
	then
uint.Result.label=a-memory
else

	end
end

gtk.main()
