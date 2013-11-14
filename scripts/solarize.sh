git clone https://github.com/sigurdga/gnome-terminal-colors-solarized;
cd gnome-terminal-colors-solarized; ./solarize; ./set_dark.sh;
cd ..; rm -rf gnome-terminal-solarized;

git clone git://github.com/seebi/dircolors-solarized.git
cp dircolors-solarized/dircolors.ansi-dark ~/.dircolors;
rm -rf dircolors-solarized

source ~/.bashrc
