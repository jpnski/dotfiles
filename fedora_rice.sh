#! /bin/bash
set -euo pipefail

# Intended for base fedora F43 sway spin installations
#
# Configures bashrc, bash_aliases, swayfx/swaylock/waybar, rofi
# foot, nvim, tmux, opencode
#
# Nord-ish theme in tmux, nvim, and GTK applications
#
# SwayFX from COPR repo
# NeoVim v0.12.0 from source
# Foot v1.27 from source

# Auto-switch to alacritty so foot can be uninstalled and built
if [ -z "${SWITCHED_TO_ALACRITTY:-}" ]; then
    echo "Fedora Rice: Switching to alacritty for safe foot replacement..."
    command -v alacritty &>/dev/null || sudo dnf -y install alacritty
    export SWITCHED_TO_ALACRITTY=1
    exec alacritty -e bash -c "export SWITCHED_TO_ALACRITTY=1; exec bash '$(readlink -f "$0")'"
fi

# Inconsolata Nerd Font
cd ~/Downloads && mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Inconsolata.zip
unzip Inconsolata.zip -d ~/.local/share/fonts/
fc-cache -fv ~/.local/share/fonts/

# Nord GTK
mkdir -p ~/.themes/Nordic ~/.config/gtk-3.0
wget https://github.com/EliverLara/Nordic/releases/download/v2.2.0/Nordic-bluish-accent-standard-buttons-v40.tar.xz
tar -xf Nordic-bluish-accent-standard-buttons-v40.tar.xz \
    -C ~/.themes/Nordic \
    --strip-components=1
cat > ~/.config/gtk-3.0/settings.ini << 'EOF'
[Settings]
gtk-theme-name=Nordic
EOF

# devel directory
mkdir -p ~/devel && cd ~/devel

# git
sudo dnf -y install git-core --setopt=install_weak_deps=False
git clone https://github.com/jpnski/dotfiles ~/devel/dotfiles

# bashrc/bash aliases
cp ~/devel/dotfiles/common/.bashrc ~/.bashrc
cp ~/devel/dotfiles/common/.bash_aliases ~/.bash_aliases

# sway
sudo dnf -y copr enable mochaa/swayfx
sudo dnf -y swap sway swayfx --allowerasing
mkdir -p ~/.config/sway/
cp ~/devel/dotfiles/fedora_sway/sway/config ~/.config/sway/config

# swaylock
mkdir -p ~/.config/swaylock
cp ~/devel/dotfiles/fedora_sway/swaylock/config ~/.config/swaylock/config

# waybar
mkdir -p ~/.config/waybar
cp ~/devel/dotfiles/fedora_sway/waybar/* ~/.config/waybar/

# rofi
mkdir -p ~/.config/rofi
cp ~/devel/dotfiles/fedora_sway/rofi/config.rasi ~/.config/rofi/config.rasi

# foot (build from source for opencode compat
if rpm -q foot &>/dev/null; then
    echo "Removing packaged foot before source build..."
    sudo dnf -y remove foot
fi
sudo dnf -y install meson ninja-build gcc pkgconf-pkg-config \
    wayland-devel wayland-protocols-devel pixman-devel \
    fontconfig-devel freetype-devel libxkbcommon-devel \
    fcft-devel tllist-devel ncurses-devel libnotify \
    xdg-utils scdoc
git clone https://codeberg.org/dnkl/foot ~/devel/foot
cd ~/devel/foot
mkdir -p bld/release && cd bld/release
export CFLAGS="$CFLAGS -O3"
meson --buildtype=release --prefix=/usr -Db_lto=true ../..
ninja
ninja test
ninja install
mkdir -p ~/.config/foot/
cp ~/devel/dotfiles/common/foot/foot.ini ~/.config/foot/foot.ini

# nvim
sudo dnf -y install ninja-build cmake gcc make gettext curl glibc-gconv-extra
git clone https://github.com/neovim/neovim ~/devel/neovim
cd ~/devel/neovim
git checkout v0.12.0
make CMAKE_BUILD_TYPE=Release
sudo make install
cp -r ~/devel/dotfiles/common/nvim ~/.config/

# tmux
sudo dnf -y install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir -p ~/.config/tmux
cp ~/devel/dotfiles/common/tmux/tmux.conf ~/.config/tmux/tmux.conf
tmux new-session -d -s fedora_rice_tpm || true
tmux source-file ~/.config/tmux/tmux.conf || true
~/.tmux/plugins/tpm/bin/install_plugins || true
sleep 3
tmux kill-session -t fedora_rice_tpm || true

# swaycap
sudo dnf -y install grim wl-copy slurp wf-recorder python3-gobject python3-cairo
git clone https://github.com/jpnski/swaycap ~/devel/swaycap
cd ~/devel/swaycap && pip install . --user
mkdir -p ~/.local/share/applications
cat > ~/.local/share/applications/swaycap.desktop << 'EOF'
[Desktop Entry]
Type=Application
Name=SwayCap
Comment=Screen capture tool for Sway/Wayland
Exec=swaycap gui
Icon=camera-photo
Terminal=false
Categories=Utility;Graphics;
EOF

# opencode
curl -fsSL https://opencode.ai/install | bash
mkdir -p ~/.config/opencode/plugins
cp -r ~/devel/dotfiles/common/opencode/* ~/.config/opencode/
sed -i "s|{user}|$USER|g" \
    ~/.config/opencode/opencode.json \
    ~/.config/opencode/tui.json

cd ~
echo "run: $ source ~/.bashrc; source ~/.bash_aliases
tmux new-session nvim
