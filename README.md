# Cordova AirPlay Plugin (Alpha)

An [Apache Cordova](https://cordova.apache.org/) plugin providing the ability to display a website over an AirPlay connection.

## Features

This plugin allows your Cordova app to listen for AirPlay devices, connect to them, and display a website on them when the connection has been established. This way, the AirPlay device acts as a second screen for your cordova application.

## Stability

This plugin is currently in alpha. This means it worked during development but is untested. It will be used in the new [Festify](https://festify.rocks/) for displaying the larger screen on TV. This means it will be production-ready once Festify v2 publicly released. We will fix bugs as soon as we find them.

## Contributing

Pull requests are very welcome! Please use the [gitmoji](https://gitmoji.carloscuesta.me/) style for commit messages.

## Installation

```bash
git clone https://github.com/Festify/cordova-external-screen
cd ./MyCordovaProject
cordova plugin add ../cordova-external-screen
```

An npm-based installation as well as API documentation will be provided at a later stage when the stability has improved.

Note: Make sure your installation path doesn't contain any spaces.

## ChromeCast, LG Connect SDK, etc.

Right now only AirPlay is supported, so this plugin is iOS only. ChromeCast, LG ConnectSDK and other remote devices may be supported in the future.