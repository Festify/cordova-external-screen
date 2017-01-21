require('es6-promise/auto');
const Emitter = require('eventemitter3');

class EventEmitter extends Emitter {
    constructor() {
        super();

        this.hasBeenRegistered = false;
    }

    registerEvents() {
        return new Promise((res, rej) => {
            const resolve = v => setTimeout(() => res(v));
            const reject = e => setTimeout(() => rej(e));

            if (!this.hasBeenRegistered) {
                cordova.exec(event => {
                    if (!this.hasBeenRegistered) {
                        this.hasBeenRegistered = true;
                        resolve(this);
                    } else {
                        setTimeout(() => this.emit(event.name, ...(event.args || [])));
                    }
                }, err => reject(err), 'ExternalScreen', 'registerEventsListener', []);
            } else {
                reject(new Error("Already registered."));
            }
        });
    }
}

module.exports = EventEmitter;
