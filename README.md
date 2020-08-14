# Dotfiles

Zaszi's collection of personal dotfiles and various userland configuration files.

## Usage

This repository contains my dotfiles, which I deploy to my machines using [Ansible](https://www.ansible.com/). The color scheme I use for most configurations is [Gruvbox (Dark mode)](https://github.com/morhetz/gruvbox). I use these dotfiles predominantly on [Arch Linux](https://www.archlinux.org/), a rolling-release distribution. As such, I only support the latest upstream releases of the respective software.

Whether you fork this repository, utilize snippets of my configuration or merely browse for ideas is up to you. See below for features, screenshots and further documentation.

## Features

* [Alacritty](#Alacritty)
* [Bash](#Bash)

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
* **Dependencies:** All dependencies are optional, but at least [Starship](https://starship.rs/) and its dependencies, and [bash-completion](https://github.com/scop/bash-completion) are recommended.

Bash is the default shell for the majority of distributions and environments. As such, there is significant value in sticking to POSIX as much as possible so my workflow is applicable to most environments where daily work takes me. In a similar vein, you won't find many aliases in here, either. Most reasons for using `zsh` or `fish` (such as a nice prompt) disappear with the use of `starship`. Dependencies on commands are checked so nothing should fail if certain files are missing.

## Contribution

Found a problem or have a suggestion? Feel free to open an issue.

## License

Dotfiles is licensed under the [MIT license](https://github.com/zaszi/rust-template/blob/master/LICENSE.md).
