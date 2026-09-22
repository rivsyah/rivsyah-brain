## MACHINE NOTES — Linux

- One shell: **bash**. POSIX paths, no drive letters, no CRLF concerns.
- Install packages with the distribution's own manager, and never edit a package-managed default in
  place — override it in `~/.bashrc` or under `~/.config/`.
- `git push` works without a credential helper. Push with the token inline so it never lands in
  `.git/config`.
- Long-running dev servers: background them (`&` then `disown`) or use a second terminal. Never
  block inside a tool call waiting for a server that does not exit.
- Services, timers and scheduled jobs may run here. Two obligations if you add one: name the
  dependency in the project card ("runs on this machine"), and give anything time-critical an
  off-machine watchdog, so a dead box is noticed by something other than {{OWNER_SHORT}}.
