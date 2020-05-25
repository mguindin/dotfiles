'''A config module for the Kitty Theme Changer Tool.'''
from pathlib import Path
theme_dir = Path('~/kitty-themes').expanduser()
conf_dir = Path('~/.config/kitty').expanduser()
theme_link = conf_dir.joinpath('theme.conf')
light_theme_link = conf_dir.joinpath('light-theme.conf')
dark_theme_link = conf_dir.joinpath('dark-theme.conf')
socket = 'unix:/tmp/mykitty'
