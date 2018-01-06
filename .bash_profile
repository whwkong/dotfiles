# .bash_profile should be kept super simple and just load
# .bashrc, .profile
echo ".bash_profile"

[[ -s ~/.bashrc ]] && source ~/.bashrc
[[ -s ~/.profile ]] && source ~/.profile


# ruby 2.4.2
export PATH=$(brew --prefix)/opt/openssl/bin:$PATH
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include
export PKG_CONFIG_PATH=$(brew --prefix)/opt/openssl/lib/pkgconfig

export PASSWORD_STORE_DIR="/Users/williamkong/vmfarms/dev/vmpass"
alias vmpass="pass"
export VAULT_ADDR="https://vault.vmfarms.net"
export VAULT_TOKEN="$(vmpass VMFarms/vault-stage.on-1.vmcluster.com/ops-token)"

if which rbenv > /dev/null; then eval "$(end)"; fi
