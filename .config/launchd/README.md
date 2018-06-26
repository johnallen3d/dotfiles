# Custom LaunchAgents

These plists have been altered from their original `brew` sources to support an alternative configuration location (`~/.config`).

```sh
for plist in ~/.config/launchd/*.plist; do
  agent=$(basename $plist)

  ln -s $plist ~/Library/LaunchAgents/$agent
done
```
