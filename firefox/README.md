# Firefox

I like firefox, within here are not necessarily "dotfiles", but configurations
for extensions I use like [Tree-Style Tab](https://addons.mozilla.org/en-US/firefox/addon/tree-style-tab/) and [Vimium](https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/)

## Tree-Style Tab
See [here](https://github.com/piroor/treestyletab/wiki/Code-snippets-for-custom-style-rules) for customization options
To remove the tab bar on top, I add a `chrome/` dir to the Firefox Profile
that's being used and put userChrome.css in there.

On macOS, Profiles are at

```sh
cd ~/Library/Application\ Support/Firefox/Profiles/<profile_name>/
```
