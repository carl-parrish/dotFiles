# rustup.fish - source cargo env if present

set cargo_env "$HOME/.cargo/env.fish"
if test -f $cargo_env
    source $cargo_env
end
