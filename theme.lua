-- Append `&` inside the commands to execute them asynchronously in the background
os.execute("gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark' &")
os.execute("papirus-folders -C teal -t Papirus-Dark -u &")