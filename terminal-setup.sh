sudo apt install scdoc
sudo apt-get install unzip

pushd ~
rm -rf alactritty
git clone https://github.com/alacritty/alacritty.git
pushd ~/alacritty

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"   
rustup override set stable
rustup update stable

sudo apt install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
cargo build --release

infocmp alacritty

sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

sudo mkdir -p /usr/local/share/man/man1
sudo mkdir -p /usr/local/share/man/man5
scdoc < extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
scdoc < extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
scdoc < extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz > /dev/null
scdoc < extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz > /dev/null

popd

rm -rf ~/.config/alacritty
mkdir -p ~/.config/alacritty && cp alacritty.toml ~/.config/alacritty/
git clone https://github.com/catppuccin/alacritty.git ~/.config/alacritty/catppuccin

rm JetBrainsMono.zip
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip
mkdir JetBrainsMono
unzip JetBrainsMono.zip -d JetBrainsMono
rm JetBrainsMono.zip
sudo cp JetBrainsMono/*.ttf /usr/share/fonts/
rm -rf JetBrainsMono
fc-cache -f -v

sudo apt-get install zoxide -y
sudo apt-get install fish -y
cp -rf fish ~/.config/fish

sudo apt-get install tmux -y

