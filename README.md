A noctalia plugin...

# wf-recorder Indicator!

This repository contains the code for a custom noctalia plugin that shows an indicator while wf-recorder is running.

## Table of contents:
| Categories    | What's shown?|
| ------------- |:-------------:|
| [What is it?](#dowhat) | What does the plugin do? |
| [Installation](#install) | How do I use this plugin? |
| [Used Packages](#pkgs) | All packages used in this repo! |

<a name="dowhat">

## What is it?
This is a plugin written for Noctalia. It displays a simple recording indicator while wf-recorder is active. \
This is also an extension of my [dotfiles](https://github.com/Tranquil-M/dots), and works perfectly in my project.

<a name="install">

## Installation

Installation is simple, and will only need to be done once.

1. Clone this repository into your plugins directory. Usually `~/.config/noctalia/plugins`.
2. Update your `plugins.json` to include the plugin.
   
     ```json
     "wf-recorder-indicator": {
          "enabled": true,
          "sourceUrl": "https://github.com/Tranquil-M/wf-recorder-indicator"
      }
     ```
3. Restart noctalia

     ```bash
     pkill -9 qs; qs -c noctalia-shell
     ```

4. Enable the plugin and add it to your bar.

<a name="pkgs">
  
# Packages

* [Noctalia](https://noctalia.dev/)

---
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/I2I61Z3QJH)
