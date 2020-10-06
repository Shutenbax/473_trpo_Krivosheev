lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()
build=gtk.Builder()
build:add_from_file('Krivosheev.glade')

uint=build.objects

uint.window.title = 'krivosheev_lab-01'
uint.window.on_destroy = gtk.main_quit
uint.window:show_all()

gtk.main()
