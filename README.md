# Dotfiles

## Setup nix
Install nix
```sh <(curl -L https://nixos.org/nix/install)```

If using MacOS install nix darwin
```nix run nix-darwin/master#darwin-rebuild -- switch```

Then rebuild switch

## Switch to fish
Edit ```/etc/shells``` with result from ```which fish```

Then change default shells with ```chsh```:
```
chsh -s [shell path]
```

## Other requirements
Install all mise packages
