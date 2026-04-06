# mpv-config

My personal [mpv](https://mpv.io/) configuration, including `uosc` and `thumbfast`.

---

## Install

Paste this in your terminal:

```sh
curl -fsSL https://raw.githubusercontent.com/tm0090/mpv-conf/main/install.sh | sh
```

This will copy the config files into `~/.config/mpv/`.  
**Existing files will not be overwritten.**

### Requirements

- `git`
- `mpv`

---

## What's Included

| File / Folder | Description |
|---|---|
| `mpv.conf` | Main mpv settings |
| `input.conf` | Custom keybindings |
| `fonts.conf` | Font configuration |
| `uosc/` | Modern UI for mpv |
| `scripts/` | Lua scripts |
| `script-opts/` | Script options |
| `fonts/` | Bundled fonts |

---

## Third-party Scripts

- [uosc](https://github.com/tomasklaen/uosc) — LGPL-2.1
- [thumbfast](https://github.com/po5/thumbfast) — MPL-2.0

---

## Update

Run the install command again to copy any new files added to the repo — existing files won't be touched.

Or if you cloned the repo directly into `~/.config/mpv`:

```sh
cd ~/.config/mpv && git pull
```
