# Open URI in native app

## Motivation

AndroidOS has a convenient feature: installed apps can associate themselves with certain https URIs, and such URIs will be opened directly in these apps, skipping the browser page. Linux seems to lack that feature, and this project intends to compensate for that.

## Installation

```bash
curl https://raw.githubusercontent.com/arty-name/open-uri-in-native-app/main/open-uri-in-native-app.bash > $HOME/.local/bin/open-uri-in-native-app.bash
chmod +x $HOME/.local/bin/open-uri-in-native-app.bash

curl https://raw.githubusercontent.com/arty-name/open-uri-in-native-app/main/open-uri-in-native-app.desktop > $HOME/.local/share/applications/open-uri-in-native-app.desktop
xdg-mime default open-uri-in-native-app.desktop x-scheme-handler/https
```

## Caveats

Unfortunately this cannot alter the behavior of links you see and click in the browser. A browser extension might help with that.

Only Zoom and MSTeams are supported at the moment, please open an issue if you want to add another app.
