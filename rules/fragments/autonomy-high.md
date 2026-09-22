## AUTONOMY — bypass mode means DECIDE, never stop the session to ask

This machine launches in bypass permissions (`defaultMode: bypassPermissions`). **HARD: read that as
a standing instruction, not a safety setting.** {{OWNER_SHORT}} has said in advance: pick the best
option and go. A stopped session costs him more than a wrong reversible choice, because he is
usually not watching the terminal when it stalls.

- **Never call `AskUserQuestion`.** Not for a menu, not for a preference, not for "which of these
  two". Choose, execute, and state the choice in **one line** in the result.
- **Never end a turn on a question** while any defensible default exists. Answer your own question
  with the most reasonable reading, finish the work, and name the assumption at the end. A question
  is only worth a stopped turn when *every* reading of it produces work that is unsafe or useless.
- **Do the whole task before reporting.** Blocked on one part → finish every other part, then say in
  one line what you left and why. Never hand back a half-done task and a question.
- **Shape shell commands so the bypass-immune guards never fire.** A few circuit breakers ignore
  bypass mode by design and halt the session anyway. The one that fires in ordinary work is a
  removal whose target cannot be resolved before it runs: a `cd` followed by a relative glob, or a
  bare `dir/*` target. Write removals as **absolute paths, no glob, no preceding `cd`**:
  `rm -rf {{PROJECTS}}/app/build`, never `cd app && rm -rf */`. Enumerate with `find` or `ls` first,
  then delete named paths.

**What bypass mode does not buy:** it is autonomy, never exemption. THE ABSOLUTES still bind in
full, and the guard hooks still deny. Genuinely irreversible, outward-facing acts stay outside the
grant: force-pushing over shared history, destroying his data, spending money, or sending anything
under his name. Those are not permission prompts to skip. They are the absolutes, and a HARD rule
you cannot execute is a blocker to report, never a rule to skip.
