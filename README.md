# cb-tools-universal v3

Command-line helper that writes a selected **Data Structures (C++)** or **Operating Systems (Java)** lab program straight into your working folder - 50 programs total. Made for use with Code::Blocks.

## What's in here

| File | Purpose |
|---|---|
| `codes.txt` | All 50 programs (25 DS in C++, 25 OS in Java) |
| `os.cmd` | The injector - writes the program you pick |
| `setup.cmd` | One-time installer (copies tools to `%LOCALAPPDATA%\cb-tools` and adds it to PATH) |
| `wipe.cmd` | Uninstaller - removes the tool folder and PATH entry |
| `README.txt` | Original readme from the author |

## Install

1. Clone this repo:

   ```
   git clone https://github.com/Lakshay5522/cb-tools.git
   ```

2. Open the cloned folder and run `setup.cmd`.
3. Close and reopen your command prompt.
4. In any folder you want to work in, type:

   ```
   os
   ```

## Usage

`os` opens a menu:

- `1` Data Structures (C++ -> writes `main.cpp`)
- `2` Operating Systems (Java -> writes `<ClassName>.java`)
- `3` Exit

Direct commands also work:

```
os queue      (Data Structures: circular queue)
os stack      (Data Structures: stack)
os inorder    (Data Structures: in-order traversal)
os 1a         (Operating Systems: practical 1 program a)
os os7c       (Operating Systems: priority scheduling)
```

After a program is written, open Code::Blocks and use **Build > Build and Run**.

## Uninstall

Run `wipe.cmd` - it removes the installed tool folder and its PATH entry. It does not touch your project files.

## Download as a single file

Prefer a zip? Grab the release: [cb-tools-universal-v3.zip](https://github.com/Lakshay5522/cb-tools/releases/download/v3/cb-tools-universal-v3.zip)
