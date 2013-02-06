#!/bin/sh

(ssh {$IRC} -o PermitLocalCommand=no  \
  ": > .irssi/fnotify ; tail -f .irssi/fnotify " |  \
while read heading message; do                      \
    if [ "{$OS}" == "darwin" ]; then      \
      terminal-notifier -title "IRC" -message "${heading}: ${message}";     \
    fi      \
done)
