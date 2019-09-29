### tmux terminfo

Can use tmux-256color.terminfo to provide italics in tmux in terminals that
support it

Install using tic

- Linux:
  ```sh
  /usr/bin/tic -o ~/.terminfo/ tmux-256color.terminfo
  ```

- macOS
  ```sh
  tic -o ~/.terminfo tmux-256color.terminfo
  ```
