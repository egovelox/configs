function setup-rust --description 'Setup rust dev environment'
  if test -d $HOME/DEV/rust
    echo "[OK] Existing directory $HOME/DEV/rust"
    set -l RUST_DIR $HOME/DEV/rust
		set -gx RUSTUP_HOME $RUST_DIR/.rustup
		set -gx CARGO_HOME $RUST_DIR/.cargo
  else
    echo "[WARN] Missing directory $HOME/DEV/rust"
    echo "[WARN] Will not setup rust : RUSTUP_HOME and CARGO_HOME will not be set."
  end

end
