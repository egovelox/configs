function setup-rust --description 'Setup rust dev environment'
  if test -d $HOME/DEV/rust

    set -l RUST_DIR $HOME/DEV/rust
		set -gx RUSTUP_HOME $RUST_DIR/.rustup
		set -gx CARGO_HOME $RUST_DIR/.cargo

  else

		set -gx RUSTUP_HOME $HOME/rust/.rustup
		set -gx CARGO_HOME $HOME/rust/.cargo

  end

end
