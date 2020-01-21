# neuims
An input method switcher.

![](./screenshot.gif)


## Table of Contents
- [Requirement](#requirement)
- [Installation](#installation)
- [Usage](#usage)


## Requirement
- Windows 10
- Neovim
- [pynvim](https://pypi.org/project/pynvim/) 0.4.0
- [pywin32](https://pypi.org/project/pywin32/) 227


## Installation
### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'Neur1n/neuims'
```

If one does not want to always enable this plugin, using the on-demand loading
feature of vim-plug is recommended. Details of the command `:IMSToggle` will be
discussed in the following.

```vim
Plug 'Neur1n/neuims', {'on': 'IMSToggle'}
```

## Usage
### Enable
This plugin needs to be manually enabled before being used to switch input
methods. There are two ways to enable:

1. Using the command `:IMSToggle`.
2. Using the predefined key mapping `<leader>it`.

The command `:IMSToggle` is provided specifically for the purpose of working
with the on-demand loading feature of vim-plug. While using on-demand loading
to load this plugin, any functions of which will not be called before the
`:IMSToggle` command is called to enable neuims for the first time. This should
benefits those who work with multiple input methods occasionally.

### Disable
While in enabled status, use `:IMSToggle` or `<leader>it` again.

### Switch
Usually, the switching is automatically controlled by the `InsertEnter` and
`InsertLeave` event. However, one may use the predefined key mapping
`<leader>is` to switch manually.


## FAQ
Basically, these are questions I asked myself.

#### Q: Why another input method switcher?
A: I have not found a proper solution for input method switching for Windows up
to 2020.01.09.

#### Q: Why pynvim and pywin32 dependencies?
A: I wish I could use some CMD or PowerShell commands to finish the job, but
I have not found something working so far.

#### Q: How about the other OSs?
~~A: Support for Ubuntu may be done soon, but I do not have a MacBook.~~

A: Support for IBus is released on 2020.01.16, tested on Ubuntu 16.04. I still
do not have a MacBook.


## TODO
[x] Support Windows 10

[x] Support Linux (IBus)

[x] Provide a status notification for statusline. (Please check commit
[ff8c961](https://github.com/Neur1n/dotfiles/commit/ff8c96179cf8ec98379e6c508d8029a104512f50)
of my [configuration](https://github.com/Neur1n/dotfiles).)
