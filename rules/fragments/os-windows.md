## MACHINE NOTES — Windows

- Two shells exist here: **PowerShell** and **Git Bash**. Pick one per task and say which. The brain
  scripts are bash: run them from Git Bash.
- Paths use drive letters and backslashes. In a bash script a Windows path is written `/c/...`, which
  is not how the cards spell it — always write the card's path as `C:\...` and say it is this machine.
- Line endings: keep `core.autocrlf=input` on the brain repo, so a checkout does not rewrite every
  file the moment a second machine appears.
- Git credential manager can hang a push while it waits for a window nobody sees. Push with the
  token inline and `-c credential.helper=` so nothing prompts.
- Long-running dev servers: start them in a separate terminal. Never block inside a tool call
  waiting for a server that does not exit.
- Scheduled work uses Task Scheduler. If you add one, name the dependency in the project card and
  give anything time-critical an off-machine watchdog.
