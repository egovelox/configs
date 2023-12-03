# to add brew installed packages
# on Linux
if test -d /home/linuxbrew/.linuxbrew/bin
  append-to-path /home/linuxbrew/.linuxbrew/bin
end
if test -d /home/linuxbrew/.linuxbrew/sbin
  append-to-path /home/linuxbrew/.linuxbrew/sbin
end

# on MacOs Intel
if test -d /usr/local/bin
  append-to-path /usr/local/bin
end
if test -d /usr/sbin
  append-to-path /usr/sbin
end

# on MacOs M1/M2
if test -d /opt/homebrew/bin
  append-to-path /opt/homebrew/bin
end
if test -d /opt/homebrew/sbin
  append-to-path /opt/homebrew/sbin
end

if test -d $HOME/bin
  append-to-path $HOME/bin
end

# only if pnpm is installed
if test -d $HOME/Library/pnpm
  append-to-path $HOME/Library/pnpm/global

  set -gx PNPM_HOME "/Users/maxime.richard/Library/pnpm"
  if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
  end
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
