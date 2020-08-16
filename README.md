# Dotfiles

Zaszi's collection of personal dotfiles and various userland configuration files.

## Usage

This repository contains my dotfiles, which I deploy to my machines using [Ansible](https://www.ansible.com/). I use these dotfiles predominantly on [Arch Linux](https://www.archlinux.org/), a rolling-release distribution. As such, I only support the latest upstream releases of the respective software.

The color scheme I use for most configurations is [Gruvbox (Dark mode)](https://github.com/morhetz/gruvbox). Included in every entry here is a list of dependencies. These are not dependencies of the software in question but rather the binaries and libraries that my particular configuration expects.

Whether you fork this repository, utilize snippets of my configuration or merely browse for ideas is up to you. See below for features, screenshots and further documentation.

## Features

* [Alacritty](#Alacritty)
* [Bash](#Bash)
* [Sway](#Sway)
* [Tmux](#Tmux)
* [Waybar](#Waybar)

### Alacritty

* **Homepage:** https://github.com/alacritty/alacritty
* **Description:** A cross-platform, GPU-accelerated terminal emulator.
* **Config location:** `~/.config/alacritty`
* **Dependencies:** [Iosevka Nerd Font](https://www.nerdfonts.com/)

Alacritty is fast, lightweight and comes with Wayland support out-of-the-box. My particular setup comes with slight transparency, the `gruvbox` color scheme and the `Iosevka Nerd Font`.

### Bash

* **Homepage:** https://www.gnu.org/software/bash/
* **Description:** The classic, tried-and-true Bourne Again Shell.
* **Config location:** `~/.bashrc` and `~/.bash_profile`
* **Dependencies:** All dependencies are optional: [bash-completion](https://github.com/scop/bash-completion), [bat](https://github.com/sharkdp/bat), [curl](https://curl.haxx.se/), [exa](https://github.com/ogham/exa), [firefox](https://www.mozilla.org/en-US/firefox/new/), [fzf](https://github.com/junegunn/fzf), [git](https://git-scm.com/), [gnupg](https://gnupg.org/), [neovim](https://neovim.io/), [openssh](https://www.openssh.com/), [pkgfile](https://github.com/falconindy/pkgfile), [rustup](https://rustup.rs/), [starship](https://starship.rs/), [yay](https://github.com/Jguer/yay)

Bash is the default shell for the majority of distributions and environments. As such, there is significant value in sticking to POSIX as much as possible so my workflow is applicable to most environments where daily work takes me. In a similar vein, you won't find many aliases in here, either. Most reasons for using `zsh` or `fish` (such as a nice prompt) disappear with the use of `starship`. I do use some modern replacements of existing tooling here, but they are set up in such a way they do not depend on learning new workflows or shortcuts. Dependencies on commands are checked so nothing should fail if certain files are missing.

### Sway

* **Homepage:** https://swaywm.org/
* **Description:** An i3-compatible Wayland compositor.
* **Config location:** `~/.config/sway/config`
* **Dependencies:** [alacritty](https://github.com/alacritty/alacritty), [firefox](https://www.mozilla.org/en-US/firefox/new/), [fzf](https://github.com/junegunn/fzf), [grim](https://github.com/emersion/grim), [light](https://github.com/haikarainen/light), [playerctl](https://github.com/altdesktop/playerctl), [pulseaudio-ctl](https://github.com/graysky2/pulseaudio-ctl), [slurp](https://github.com/emersion/slurp), [waybar](https://github.com/Alexays/Waybar), [swaybg](https://github.com/swaywm/swaybg), [swayidle](https://github.com/swaywm/swayidle), [swaylock](https://github.com/swaywm/swaylock)

I prefer using a tiling window manager. Sway being essentially i3 for Wayland, it's been my daily driver ever since I made the switch to a Wayland setup. The configuration file holds a significant amount of shortcuts and utilizes several external tools, so keep in mind my configuration will most likely not work as a drop-in replacement for you unless you install all of the above dependencies. Note that for the backlight to work without privilege escalation, you will also need to install these [udev rules](https://github.com/haikarainen/light/blob/master/90-backlight.rules) and add your user to the `video` group.

### Tmux

* **Homepage:** https://github.com/tmux/tmux
* **Description:** A terminal multiplexer.
* **Config location:** `~/.tmux.conf`
* **Dependencies:** None

While I dislike overengineered tmux setups, having a terminal multiplexer at my disposal for detaching sessions and window management in SSH sessions is invaluable. I use a minimal configuration, so there's not much going on here beyond some quality-of-life keybindings and saner defaults.

### Waybar

* **Homepage:** https://github.com/Alexays/Waybar
* **Description:** A Highly customizable Wayland bar for Sway and Wlroots based compositors.
* **Config location:** `~/.config/waybar/config` and `~/.config/waybar/style.css`
* **Dependencies:** [sway](https://swaywm.org/), [playerctl](https://github.com/altdesktop/playerctl), [pulseaudio](https://www.freedesktop.org/wiki/Software/PulseAudio/)

This is a lightweight yet higly-customizable status bar that works perfectly with Sway. My configuration comes with the usual suspects that you'd want in a status bar. From left-to-right: workspaces, current music track, window name, RAM usage, CPU usage, volume, network, battery and clock.

## Contribution

Found a problem or have a suggestion? Feel free to open an issue.

## License

Dotfiles is licensed under the [MIT license](https://github.com/zaszi/rust-template/blob/master/LICENSE.md).
