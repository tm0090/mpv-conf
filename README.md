# mpv-config

My personal [mpv](https://mpv.io/) configuration, including `uosc` and `thumbfast`.

---

## Install (Linux / macOS)

Paste this in your terminal:

```sh
curl -fsSL https://raw.githubusercontent.com/tm0090/mpv-conf/main/install.sh | sh
```

This will copy the config files into `~/.config/mpv/`.  
If an existing config is found, you will be prompted to install into a subfolder instead so you can inspect and move files manually.

### Requirements

- Linux or macOS
- `curl`
- `unzip`
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
