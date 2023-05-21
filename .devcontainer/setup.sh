## update and install some things we should probably have
apt-get update
apt-get install -y \
  curl \
  git \
  gnupg2 \
  jq \
  sudo \
  zsh \
  vim \
  build-essential \
  openssl \
  qemu \
  gcc-arm-none-eabi \
  binutils-arm-none-eabi \
  gdb-arm-none-eabi \
  openocd 

## Install rustup and common components
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
rustup target add thumbv6m-none-eabi thumbv7m-none-eabi thumbv7em-none-eabi thumbv7em-none-eabihf
# curl https://sh.rustup.rs -sSf | sh -s -- -y 
# rustup install nightly
# rustup component add rustfmt
# rustup component add rustfmt --toolchain nightly
# rustup component add clippy 
# rustup component add clippy --toolchain nightly

cargo install cargo-expand
cargo install cargo-edit

# Install vs code extensions
code --install-extension rust-lang.rust-analyzer
code --install-extension marus25.cortex-debug

## setup and install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -R /root/.oh-my-zsh /home/$USERNAME
cp /root/.zshrc /home/$USERNAME
sed -i -e "s/\/root\/.oh-my-zsh/\/home\/$USERNAME\/.oh-my-zsh/g" /home/$USERNAME/.zshrc
chown -R $USER_UID:$USER_GID /home/$USERNAME/.oh-my-zsh /home/$USERNAME/.zshrc