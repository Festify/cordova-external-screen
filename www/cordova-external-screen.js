require("es6-promise/auto");

const EventEmitter = require("./lib/EventEmitter.js");
const exec = require("./lib/execPromise.js");

class ExternalScreen extends EventEmitter {
    hasExternalScreen() {
        return exec("hasExternalScreen");
    }

    loadUrl(url) {
        return exec("loadURL", [url]);
    }
}

exports.createScreenListener = function() {
    return (new ExternalScreen()).registerEvents();
}
