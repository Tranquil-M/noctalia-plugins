A lot of plugins...

# Tranquil's Custom Noctalia Plugins!

This repository contains the code for custom noctalia plugins that I wrote to improve my dotfiles!

## Table of contents:
| Categories    | What's shown?|
| ------------- |:-------------:|
| [What is it?](#dowhat) | What exactly is this? |
| [Installation](#install) | How do I use this repository in my configuration? |
| [Registry Automation](#regauto) | How is the registry updated? |
| [Available Plugins](#availplug) | All usable plugins! |
| [Used Packages](#pkgs) | All packages used in this repo! |

<a name="dowhat">

## What is it?
This repository is a collection of plugins built for [noctalia](https://noctalia.dev/).
This is also an extension of my [dotfiles](https://github.com/Tranquil-M/dots), and works perfectly in my project.

<a name="install">

## Installation

Installation is simple, and will only need to be done once.

1. Open your settings panel and go to plugins.
2. Add `https://github.com/Tranquil-M/noctalia-plugins` as a source.
4. Enable the plugin and add it to your bar.

<a name="regauto">

## Registry Automation

The plugin registry is automatically maintained using GitHub Actions:

- **Automatic Updates**: Registry updates when manifest.json files are modified
- **PR Validation**: Pull requests show if registry will be updated

See [`.github/workflows/README.md`][githubworkflowsreadmemd] for technical details.

<a name="availplug">

## Available Plugins

Check [`registry.json`][registryjson] for the complete list of available plugins.

<a name="pkgs">
  
# Packages

* [Noctalia](https://noctalia.dev/)

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/I2I61Z3QJH)

[githubworkflowsreadmemd]: .github/workflows/README.md
[registryjson]: registry.json
