# Setup

Clone repo here

`~/config/tmux`

Clone plugin repo

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Create the symlink

```bash
ln -s ~/config/tmux/tmux.conf ~/.tmux.conf
```

Reload after changes
```bash
tmux source-file ~/.tmux.conf
```

prefix +    start every tmux command

# PANES (splits)

prefix + %    split pane vertically (left/right)

prefix + "    split pane horizontally (top/bottom)

prefix + ←    move to left pane


prefix + →    move to right pane


prefix + ↑    move to upper pane


prefix + ↓    move to lower pane


prefix + o    move to next pane


prefix + q    show pane numbers


prefix + x    close current pane


prefix + z    zoom/unzoom pane (fullscreen)


prefix + !    move pane to its own window


# WINDOWS (tabs)

prefix + c    create new window

prefix + n    next window


prefix + p    previous window


prefix + 0-9  jump to window number


prefix + w    list all windows


prefix + ,    rename current window


prefix + &    close current window


# SESSIONS

prefix + d    detach from session

tmux ls     list all sessions


tmux attach attach last session


tmux attach -t <name> attach named session

tmux kill-session close current session

# SCROLL / COPY

prefix + [    enter scroll mode


q           exit scroll mode


# HELP

prefix + ?    show all key bindings
