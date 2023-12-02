# to add brew installed packages
append-to-path /usr/local/bin
append-to-path /usr/sbin
append-to-path $HOME/bin
# /opt/homebrew only exists for M1 devices
if test -d /opt/homebrew/bin
  append-to-path /opt/homebrew/bin
end
# /opt/homebrew only exists for M1 devices
if test -d /opt/homebrew/sbin
  append-to-path /opt/homebrew/sbin
end
# only if pnpm is installed
if test -d $HOME/Library/pnpm
  append-to-path $HOME/Library/pnpm/global
end

setup-rust
append-to-path $CARGO_HOME/bin

if test -d "$HOME/apache-maven-3.6.3"
  append-to-path $HOME/apache-maven-3.6.3/bin
end

# to add awscli to PATH if installed
set -l aws /usr/local/opt/awscli@1
if test -d $aws
  append-to-path /usr/local/opt/awscli@1/bin
end
