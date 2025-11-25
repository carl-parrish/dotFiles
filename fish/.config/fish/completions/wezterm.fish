 ███            █████████  ██████████ ██████   ██████ █████ ██████   █████ █████
░░░███         ███░░░░░███░░███░░░░░█░░██████ ██████ ░░███ ░░██████ ░░███ ░░███
  ░░░███      ███     ░░░  ░███  █ ░  ░███░█████░███  ░███  ░███░███ ░███  ░███
    ░░░███   ░███          ░██████    ░███░░███ ░███  ░███  ░███░░███░███  ░███
     ███░    ░███    █████ ░███░░█    ░███ ░░░  ░███  ░███  ░███ ░░██████  ░███
   ███░      ░░███  ░░███  ░███ ░   █ ░███      ░███  ░███  ░███  ░░█████  ░███
 ███░         ░░█████████  ██████████ █████     █████ █████ █████  ░░█████ █████
░░░            ░░░░░░░░░  ░░░░░░░░░░ ░░░░░     ░░░░░ ░░░░░ ░░░░░    ░░░░░ ░░░░░

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Gemini 3 is now available.                                                                                                         │
│ Join the waitlist at https://goo.gle/enable-preview-features                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
Tips for getting started:
1. Ask questions, edit files, or run commands.
2. Be specific for the best results.
3. /help for more information.
╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ ✓  ReadManyFiles Will attempt to read and concatenate files using patterns:                                                        │
│                                                                                                                                    │
│ ### ReadManyFiles Result (Target Dir: `/home/cparrish/dotFiles/fish/.config/fish`)                                                 │
│                                                                                                                                    │
│ Successfully read and concatenated content from **1 file(s)**.                                                                     │
│                                                                                                                                    │
│ **Processed Files:**                                                                                                               │
│ - `completions/wezterm.fish`                                                                                                       │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

> @completions/wezterm.fish I'm trying to get this computer (pi) ready to use stow for my config files. First I'm planning on using my
  fish config from my github repo but I noticed that pi has a file not in my repo completions/wezterm.fish need to determin if I
  should keep it and if it is cross platform (MacOS, Linux) so it can be use on my other devices. I do have wezterm installed on my
  other devices as well but apparently never generated a completions file for them.

✦ This wezterm.fish file provides command-line completions for the WezTerm terminal emulator for the fish shell.

  Based on its contents, the file is cross-platform and safe to include in your dotfiles repository. Here's why:

   1. Generation: The completion script itself contains a clue on how it's created. The line complete -c wezterm ... -a
      "shell-completion" -d 'Generate shell completion information' indicates that the wezterm executable can generate its own
      completion files.
   2. Cross-Platform Tool: Since wezterm runs on both Linux and macOS, you can generate this same file on any of your devices by
      running the following command:
   1     wezterm shell-completion --shell fish
      This will output the completions for the version of wezterm installed on that specific machine.

  The completions define the CLI arguments for wezterm, which are consistent across operating systems. You can safely add this file to
  your configuration repository and stow it to your other machines.

































































































































































































































































> /quit

╭────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│                                                                                                                                    │
│  Agent powering down. Goodbye!                                                                                                     │
│                                                                                                                                    │
│  Interaction Summary                                                                                                               │
│  Session ID:                 ec55acb6-9e21-4b43-9e4c-9a7c8890f171                                                                  │
│  Tool Calls:                 0 ( ✓ 0 x 0 )                                                                                         │
│  Success Rate:               0.0%                                                                                                  │
│                                                                                                                                    │
│  Performance                                                                                                                       │
│  Wall Time:                  7m 12s                                                                                                │
│  Agent Active:               16.8s                                                                                                 │
│    » API Time:               16.8s (100.0%)                                                                                        │
│    » Tool Time:              0s (0.0%)                                                                                             │
│                                                                                                                                    │
│                                                                                                                                    │
│  Model Usage                  Reqs   Input Tokens  Output Tokens                                                                   │
│  ───────────────────────────────────────────────────────────────                                                                   │
│  gemini-2.5-flash-lite           1         35,904            174                                                                   │
│  gemini-2.5-pro                  1         41,434            240                                                                   │
│                                                                                                                                    │
│  Savings Highlight: 1,935 (2.5%) of input tokens were served from the cache, reducing costs.                                       │
│                                                                                                                                    │
│  » Tip: For a full token breakdown, run `/stats model`.                                                                            │
│                                                                                                                                    │
╰────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

[I] cparrish@raspberrypi ~/.c/fish> bcat completions/wezterm.fish
complete -c wezterm -n "__fish_use_subcommand" -l config-file -d 'Specify the configuration file to use, overrides the normal configur
complete -c wezterm -n "__fish_use_subcommand" -l config -d 'Override specific configuration values' -r
complete -c wezterm -n "__fish_use_subcommand" -s n -l skip-config -d 'Skip loading wezterm.lua'
complete -c wezterm -n "__fish_use_subcommand" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_use_subcommand" -s V -l version -d 'Print version'
complete -c wezterm -n "__fish_use_subcommand" -f -a "start" -d 'Start the GUI, optionally running an alternative program [aliases: -e
complete -c wezterm -n "__fish_use_subcommand" -f -a "blocking-start" -d 'Start the GUI in blocking mode. You shouldn\'t see this, but
complete -c wezterm -n "__fish_use_subcommand" -f -a "ssh" -d 'Establish an ssh session'
complete -c wezterm -n "__fish_use_subcommand" -f -a "serial" -d 'Open a serial port'
complete -c wezterm -n "__fish_use_subcommand" -f -a "connect" -d 'Connect to wezterm multiplexer'
complete -c wezterm -n "__fish_use_subcommand" -f -a "ls-fonts" -d 'Display information about fonts'
complete -c wezterm -n "__fish_use_subcommand" -f -a "show-keys" -d 'Show key assignments'
complete -c wezterm -n "__fish_use_subcommand" -f -a "cli" -d 'Interact with experimental mux server'
complete -c wezterm -n "__fish_use_subcommand" -f -a "imgcat" -d 'Output an image to the terminal'
complete -c wezterm -n "__fish_use_subcommand" -f -a "set-working-directory" -d 'Advise the terminal of the current working directory
complete -c wezterm -n "__fish_use_subcommand" -f -a "record" -d 'Record a terminal session as an asciicast'
complete -c wezterm -n "__fish_use_subcommand" -f -a "replay" -d 'Replay an asciicast terminal session'
complete -c wezterm -n "__fish_use_subcommand" -f -a "shell-completion" -d 'Generate shell completion information'
complete -c wezterm -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c wezterm -n "__fish_seen_subcommand_from start" -l cwd -d 'Specify the current working directory for the initially spawned
complete -c wezterm -n "__fish_seen_subcommand_from start" -l class -d 'Override the default windowing system class. The default is "o
complete -c wezterm -n "__fish_seen_subcommand_from start" -l workspace -d 'Override the default workspace with the provided name. The
complete -c wezterm -n "__fish_seen_subcommand_from start" -l position -d 'Override the position for the initial window launched by th
complete -c wezterm -n "__fish_seen_subcommand_from start" -l domain -d 'Name of the multiplexer domain section from the configuration
complete -c wezterm -n "__fish_seen_subcommand_from start" -l no-auto-connect -d 'If true, do not connect to domains marked as connect
complete -c wezterm -n "__fish_seen_subcommand_from start" -l always-new-process -d 'If enabled, don\'t try to ask an existing wezterm
complete -c wezterm -n "__fish_seen_subcommand_from start" -l new-tab -d 'When spawning into an existing GUI instance, spawn a new tab
complete -c wezterm -n "__fish_seen_subcommand_from start" -s e -d 'Dummy argument that consumes "-e" and does nothing. This is meant
complete -c wezterm -n "__fish_seen_subcommand_from start" -l attach -d 'When used with --domain, if the domain already has running pa
complete -c wezterm -n "__fish_seen_subcommand_from start" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c wezterm -n "__fish_seen_subcommand_from blocking-start" -l cwd -d 'Specify the current working directory for the initially
complete -c wezterm -n "__fish_seen_subcommand_from blocking-start" -l class -d 'Override the default windowing system class. The defa
complete -c wezterm -n "__fish_seen_subcommand_from blocking-start" -l workspace -d 'Override the default workspace with the provided
complete -c wezterm -n "__fish_seen_subcommand_from blocking-start" -l position -d 'Override the position for the initial window launc
complete -c wezterm -n "__fish_seen_subcommand_from blocking-start" -l domain -d 'Name of the multiplexer domain section from the conf
complete -c wezterm -n "__fish_seen_subcommand_from blocking-start" -l no-auto-connect -d 'If true, do not connect to domains marked a
complete -c wezterm -n "__fish_seen_subcommand_from blocking-start" -l always-new-process -d 'If enabled, don\'t try to ask an existin
complete -c wezterm -n "__fish_seen_subcommand_from blocking-start" -l new-tab -d 'When spawning into an existing GUI instance, spawn
complete -c wezterm -n "__fish_seen_subcommand_from blocking-start" -s e -d 'Dummy argument that consumes "-e" and does nothing. This
complete -c wezterm -n "__fish_seen_subcommand_from blocking-start" -l attach -d 'When used with --domain, if the domain already has r
complete -c wezterm -n "__fish_seen_subcommand_from blocking-start" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c wezterm -n "__fish_seen_subcommand_from ssh" -s o -l ssh-option -d 'Override specific SSH configuration options. `wezterm
complete -c wezterm -n "__fish_seen_subcommand_from ssh" -l class -d 'Override the default windowing system class. The default is "org
complete -c wezterm -n "__fish_seen_subcommand_from ssh" -l position -d 'Override the position for the initial window launched by this
complete -c wezterm -n "__fish_seen_subcommand_from ssh" -s v -d 'Enable verbose ssh protocol tracing. The trace information is printe
complete -c wezterm -n "__fish_seen_subcommand_from ssh" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c wezterm -n "__fish_seen_subcommand_from serial" -l baud -d 'Set the baud rate.  The default is 9600 baud' -r
complete -c wezterm -n "__fish_seen_subcommand_from serial" -l class -d 'Override the default windowing system class. The default is "
complete -c wezterm -n "__fish_seen_subcommand_from serial" -l position -d 'Override the position for the initial window launched by t
complete -c wezterm -n "__fish_seen_subcommand_from serial" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c wezterm -n "__fish_seen_subcommand_from connect" -l class -d 'Override the default windowing system class. The default is
complete -c wezterm -n "__fish_seen_subcommand_from connect" -l workspace -d 'Override the default workspace with the provided name. T
complete -c wezterm -n "__fish_seen_subcommand_from connect" -l position -d 'Override the position for the initial window launched by
complete -c wezterm -n "__fish_seen_subcommand_from connect" -l new-tab -d 'When spawning into an existing GUI instance, spawn a new t
complete -c wezterm -n "__fish_seen_subcommand_from connect" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c wezterm -n "__fish_seen_subcommand_from ls-fonts" -l text -d 'Explain which fonts are used to render the supplied text str
complete -c wezterm -n "__fish_seen_subcommand_from ls-fonts" -l codepoints -d 'Explain which fonts are used to render the specified u
complete -c wezterm -n "__fish_seen_subcommand_from ls-fonts" -l list-system -d 'Whether to list all fonts available to the system'
complete -c wezterm -n "__fish_seen_subcommand_from ls-fonts" -l rasterize-ascii -d 'Show rasterized glyphs for the text in --text or
complete -c wezterm -n "__fish_seen_subcommand_from ls-fonts" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from show-keys" -l key-table -d 'In lua mode, show only the named key table' -r
complete -c wezterm -n "__fish_seen_subcommand_from show-keys" -l lua -d 'Show the keys as lua config statements'
complete -c wezterm -n "__fish_seen_subcommand_from show-keys" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
Outputs the pane-id for the newly created pane on success'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
Outputs the pane-id for the newly created pane on success'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from list" -l format -d 'Controls the output forma
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from list-clients" -l format -d 'Controls the outp
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from list-clients" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from proxy" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from tlscreds" -l pem -d 'Output a PEM file encode
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from tlscreds" -s h -l help -d 'Print help (see mo
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from move-pane-to-new-tab" -l pane-id -d 'Specify
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from move-pane-to-new-tab" -l window-id -d 'Specif
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from move-pane-to-new-tab" -l workspace -d 'If cre
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from move-pane-to-new-tab" -l new-window -d 'Creat
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from move-pane-to-new-tab" -s h -l help -d 'Print
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from split-pane" -l pane-id -d 'Specify the pane t
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from split-pane" -l cells -d 'The number of cells
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from split-pane" -l percent -d 'Specify the number
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from split-pane" -l cwd -d 'Specify the current wo
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from split-pane" -l move-pane-id -d 'Instead of sp
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from split-pane" -l horizontal -d 'Equivalent to `
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from split-pane" -l left -d 'Split horizontally, w
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from split-pane" -l right -d 'Split horizontally,
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from split-pane" -l top -d 'Split vertically, with
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from split-pane" -l bottom -d 'Split vertically, w
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from split-pane" -l top-level -d 'Rather than spli
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from split-pane" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from spawn" -l pane-id -d 'Specify the current pan
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from spawn" -l domain-name -r
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from spawn" -l window-id -d 'Specify the window in
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from spawn" -l cwd -d 'Specify the current working
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from spawn" -l workspace -d 'When creating a new w
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from spawn" -l new-window -d 'Spawn into a new win
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from spawn" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from send-text" -l pane-id -d 'Specify the target
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from send-text" -l no-paste -d 'Send the text dire
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from send-text" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from get-text" -l pane-id -d 'Specify the target p
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from get-text" -l start-line -d 'The starting line
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from get-text" -l end-line -d 'The ending line num
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from get-text" -l escapes -d 'Include escape seque
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from get-text" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from activate-pane-direction" -l pane-id -d 'Speci
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from activate-pane-direction" -s h -l help -d 'Pri
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from get-pane-direction" -l pane-id -d 'Specify th
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from get-pane-direction" -s h -l help -d 'Print he
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from kill-pane" -l pane-id -d 'Specify the target
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from kill-pane" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from activate-pane" -l pane-id -d 'Specify the tar
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from activate-pane" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from adjust-pane-size" -l pane-id -d 'Specify the
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from adjust-pane-size" -l amount -d 'Specify the n
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from adjust-pane-size" -s h -l help -d 'Print help
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from activate-tab" -l tab-id -d 'Specify the targe
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from activate-tab" -l tab-index -d 'Specify the ta
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from activate-tab" -l tab-relative -d 'Specify the
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from activate-tab" -l pane-id -d 'Specify the curr
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from activate-tab" -l no-wrap -d 'When used with t
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from activate-tab" -s h -l help -d 'Print help (se
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from set-tab-title" -l tab-id -d 'Specify the targ
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from set-tab-title" -l pane-id -d 'Specify the cur
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from set-tab-title" -s h -l help -d 'Print help (s
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from set-window-title" -l window-id -d 'Specify th
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from set-window-title" -l pane-id -d 'Specify the
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from set-window-title" -s h -l help -d 'Print help
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from rename-workspace" -l workspace -d 'Specify th
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from rename-workspace" -l pane-id -d 'Specify the
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from rename-workspace" -s h -l help -d 'Print help
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from zoom-pane" -l pane-id -d 'Specify the target
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from zoom-pane" -l zoom -d 'Zooms the pane if it w
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from zoom-pane" -l unzoom -d 'Unzooms the pane if
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from zoom-pane" -l toggle -d 'Toggles the zoom sta
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from zoom-pane" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
Outputs the pane-id for the newly created pane on success'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
Outputs the pane-id for the newly created pane on success'
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from cli; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -l width -d 'Specify the display width; defaults to "auto" which automatic
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -l height -d 'Specify the display height; defaults to "auto" which automat
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -l position -d 'Set the cursor position prior to displaying the image. The
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -l tmux-passthru -d 'How to manage passing the escape through to tmux' -r
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -l max-pixels -d 'Set the maximum number of pixels per image frame. Images
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -l resample-format -d 'Specify the image format to use to encode resampled
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -l resample-filter -d 'Specify the filtering technique used when resizing/
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -l resize -d 'Pre-process the image to resize it to the specified dimensio
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -l no-preserve-aspect-ratio -d 'Do not respect the aspect ratio.  The defa
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -l no-move-cursor -d 'Do not move the cursor after displaying the image. N
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -l hold -d 'Wait for enter/escape/ctrl-c/ctrl-d to be pressed after displa
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -l no-resample -d 'Do not resample images whose frames are larger than the
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -l show-resample-timing -d 'When resampling or resizing, display some diag
complete -c wezterm -n "__fish_seen_subcommand_from imgcat" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c wezterm -n "__fish_seen_subcommand_from set-working-directory" -l tmux-passthru -d 'How to manage passing the escape throu
complete -c wezterm -n "__fish_seen_subcommand_from set-working-directory" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from record" -l cwd -d 'Start in the specified directory, instead of the default_cwd de
complete -c wezterm -n "__fish_seen_subcommand_from record" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from replay" -l explain -d 'Explain what is being sent/received'
complete -c wezterm -n "__fish_seen_subcommand_from replay" -l explain-only -d 'Don\'t replay, just show the explanation'
complete -c wezterm -n "__fish_seen_subcommand_from replay" -l cat -d 'Just emit raw escape sequences all at once, with no timing info
complete -c wezterm -n "__fish_seen_subcommand_from replay" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from shell-completion" -l shell -d 'Which shell to generate for' -r -f -a "{bash '',elv
complete -c wezterm -n "__fish_seen_subcommand_from shell-completion" -s h -l help -d 'Print help'
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from start; and not __fish_seen_subcommand_fr
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from lis
Outputs the pane-id for the newly created pane on success'
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from lis
Outputs the pane-id for the newly created pane on success'
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from lis
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from lisen_subcommand_from activate-tab; and not __fish_seen_subcommand_from set-tab-title; and not __fish_seen_subcommand_from set-window-title; and not __fish_seen_subcommand_from rename-workspace; and not __fish_seen_subcommand_from zoom-pane" -f -a "activate-pane" -d 'Activate (focus) a pane'
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from list-clients; and not __fish_seen_subcommand_from proxy; and not __fish_seen_subcommand_from tlscreds; and not __fish_seen_subcommand_from move-pane-to-new-tab; and not __fish_seen_subcommand_from split-pane; and not __fish_seen_subcommand_from spawn; and not __fish_seen_subcommand_from send-text; and not __fish_seen_subcommand_from get-text; and not __fish_seen_subcommand_from activate-pane-direction; and not __fish_seen_subcommand_from get-pane-direction; and not __fish_seen_subcommand_from kill-pane; and not __fish_seen_subcommand_from activate-pane; and not __fish_seen_subcommand_from adjust-pane-size; and not __fish_seen_subcommand_from activate-tab; and not __fish_seen_subcommand_from set-tab-title; and not __fish_seen_subcommand_from set-window-title; and not __fish_seen_subcommand_from rename-workspace; and not __fish_seen_subcommand_from zoom-pane" -f -a "adjust-pane-size" -d 'Adjust the size of a pane directionally'
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from list-clients; and not __fish_seen_subcommand_from proxy; and not __fish_seen_subcommand_from tlscreds; and not __fish_seen_subcommand_from move-pane-to-new-tab; and not __fish_seen_subcommand_from split-pane; and not __fish_seen_subcommand_from spawn; and not __fish_seen_subcommand_from send-text; and not __fish_seen_subcommand_from get-text; and not __fish_seen_subcommand_from activate-pane-direction; and not __fish_seen_subcommand_from get-pane-direction; and not __fish_seen_subcommand_from kill-pane; and not __fish_seen_subcommand_from activate-pane; and not __fish_seen_subcommand_from adjust-pane-size; and not __fish_seen_subcommand_from activate-tab; and not __fish_seen_subcommand_from set-tab-title; and not __fish_seen_subcommand_from set-window-title; and not __fish_seen_subcommand_from rename-workspace; and not __fish_seen_subcommand_from zoom-pane" -f -a "activate-tab" -d 'Activate a tab'
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from list-clients; and not __fish_seen_subcommand_from proxy; and not __fish_seen_subcommand_from tlscreds; and not __fish_seen_subcommand_from move-pane-to-new-tab; and not __fish_seen_subcommand_from split-pane; and not __fish_seen_subcommand_from spawn; and not __fish_seen_subcommand_from send-text; and not __fish_seen_subcommand_from get-text; and not __fish_seen_subcommand_from activate-pane-direction; and not __fish_seen_subcommand_from get-pane-direction; and not __fish_seen_subcommand_from kill-pane; and not __fish_seen_subcommand_from activate-pane; and not __fish_seen_subcommand_from adjust-pane-size; and not __fish_seen_subcommand_from activate-tab; and not __fish_seen_subcommand_from set-tab-title; and not __fish_seen_subcommand_from set-window-title; and not __fish_seen_subcommand_from rename-workspace; and not __fish_seen_subcommand_from zoom-pane" -f -a "set-tab-title" -d 'Change the title of a tab'
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from list-clients; and not __fish_seen_subcommand_from proxy; and not __fish_seen_subcommand_from tlscreds; and not __fish_seen_subcommand_from move-pane-to-new-tab; and not __fish_seen_subcommand_from split-pane; and not __fish_seen_subcommand_from spawn; and not __fish_seen_subcommand_from send-text; and not __fish_seen_subcommand_from get-text; and not __fish_seen_subcommand_from activate-pane-direction; and not __fish_seen_subcommand_from get-pane-direction; and not __fish_seen_subcommand_from kill-pane; and not __fish_seen_subcommand_from activate-pane; and not __fish_seen_subcommand_from adjust-pane-size; and not __fish_seen_subcommand_from activate-tab; and not __fish_seen_subcommand_from set-tab-title; and not __fish_seen_subcommand_from set-window-title; and not __fish_seen_subcommand_from rename-workspace; and not __fish_seen_subcommand_from zoom-pane" -f -a "set-window-title" -d 'Change the title of a window'
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from list-clients; and not __fish_seen_subcommand_from proxy; and not __fish_seen_subcommand_from tlscreds; and not __fish_seen_subcommand_from move-pane-to-new-tab; and not __fish_seen_subcommand_from split-pane; and not __fish_seen_subcommand_from spawn; and not __fish_seen_subcommand_from send-text; and not __fish_seen_subcommand_from get-text; and not __fish_seen_subcommand_from activate-pane-direction; and not __fish_seen_subcommand_from get-pane-direction; and not __fish_seen_subcommand_from kill-pane; and not __fish_seen_subcommand_from activate-pane; and not __fish_seen_subcommand_from adjust-pane-size; and not __fish_seen_subcommand_from activate-tab; and not __fish_seen_subcommand_from set-tab-title; and not __fish_seen_subcommand_from set-window-title; and not __fish_seen_subcommand_from rename-workspace; and not __fish_seen_subcommand_from zoom-pane" -f -a "rename-workspace" -d 'Rename a workspace'
complete -c wezterm -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cli; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from list-clients; and not __fish_seen_subcommand_from proxy; and not __fish_seen_subcommand_from tlscreds; and not __fish_seen_subcommand_from move-pane-to-new-tab; and not __fish_seen_subcommand_from split-pane; and not __fish_seen_subcommand_from spawn; and not __fish_seen_subcommand_from send-text; and not __fish_seen_subcommand_from get-text; and not __fish_seen_subcommand_from activate-pane-direction; and not __fish_seen_subcommand_from get-pane-direction; and not __fish_seen_subcommand_from kill-pane; and not __fish_seen_subcommand_from activate-pane; and not __fish_seen_subcommand_from adjust-pane-size; and not __fish_seen_subcommand_from activate-tab; and not __fish_seen_subcommand_from set-tab-title; and not __fish_seen_subcommand_from set-window-title; and not __fish_seen_subcommand_from rename-workspace; and not __fish_seen_subcommand_from zoom-pane" -f -a "zoom-pane" -d 'Zoom, unzoom, or toggle zoom state'
