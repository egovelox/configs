# to add brew installed packages
append-to-path /usr/local/bin
append-to-path $HOME/bin

setup-rust
append-to-path $CARGO_HOME/bin

# to add awscli to PATH if installed
set -l aws /usr/local/opt/awscli@1
if test -d $aws
  append-to-path /usr/local/opt/awscli@1/bin
end
