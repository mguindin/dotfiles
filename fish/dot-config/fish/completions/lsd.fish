complete -c lsd -n "__fish_use_subcommand" -l color -d 'When to use terminal colours' -r -f -a "always auto never"
complete -c lsd -n "__fish_use_subcommand" -l icon -d 'When to print the icons' -r -f -a "always auto never"
complete -c lsd -n "__fish_use_subcommand" -l icon-theme -d 'Whether to use fancy or unicode icons' -r -f -a "fancy unicode"
complete -c lsd -n "__fish_use_subcommand" -l depth -d 'Stop recursing into directories after reaching specified depth'
complete -c lsd -n "__fish_use_subcommand" -l date -d 'How to display date' -r -f -a "date relative"
complete -c lsd -n "__fish_use_subcommand" -l group-dirs -d 'Sort the directories then the files' -r -f -a "none first last"
complete -c lsd -n "__fish_use_subcommand" -s a -l all -d 'Do not ignore entries starting with .'
complete -c lsd -n "__fish_use_subcommand" -s F -l classify -d 'Append indicator (one of */=>@|) at the end of the file names'
complete -c lsd -n "__fish_use_subcommand" -s l -l long -d 'Display extended file metadata as a table'
complete -c lsd -n "__fish_use_subcommand" -s 1 -l oneline -d 'Display one entry per line'
complete -c lsd -n "__fish_use_subcommand" -s R -l recursive -d 'Recurse into directories'
complete -c lsd -n "__fish_use_subcommand" -s h -l human-readable -d 'For ls compatibility purposes ONLY, currently set by default'
complete -c lsd -n "__fish_use_subcommand" -l tree -d 'Recurse into directories and present the result as a tree'
complete -c lsd -n "__fish_use_subcommand" -s t -l timesort -d 'Sort by time modified'
complete -c lsd -n "__fish_use_subcommand" -s r -l reverse -d 'Reverse the order of the sort'
complete -c lsd -n "__fish_use_subcommand" -l classic -d 'Enable classic mode (no colors or icons)'
complete -c lsd -n "__fish_use_subcommand" -l help -d 'Prints help information'
complete -c lsd -n "__fish_use_subcommand" -s V -l version -d 'Prints version information'
