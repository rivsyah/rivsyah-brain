## MACHINE NOTES — macOS

- One shell: **zsh** by default; write scripts for bash and invoke them with `bash script.sh`.
- Install packages with Homebrew. Never edit a brew-managed default in place — override it in
  `~/.zshrc` or under `~/.config/`.
- Paths are case-insensitive by default. Never rely on case alone to tell two files apart, and be
  careful renaming a file to a different case: git sees a rename the filesystem does not.
- `git push` uses the macOS keychain helper. Push with the token inline and no helper, so the token
  never lands in `.git/config`.
- Long-running dev servers: background them (`&` then `disown`) or use a second terminal. Never
  block inside a tool call waiting for a server that does not exit.
- Scheduled work uses `launchd`, not cron. If you add one, name the dependency in the project card
  and give anything time-critical an off-machine watchdog.
