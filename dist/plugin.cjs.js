'use strict';

var core = require('@capacitor/core');

const RefreshRate = core.registerPlugin('RefreshRate', {
    web: () => Promise.resolve().then(function () { return web; }).then((m) => new m.RefreshRateWeb()),
});

class RefreshRateWeb extends core.WebPlugin {
    async setRefreshRate(options) {
        console.log('Setting refresh rate on web is not supported:', options === null || options === void 0 ? void 0 : options.hz);
    }
    async resetRefreshRate() {
        console.log('Resetting refresh rate on web is not supported');
    }
}

var web = /*#__PURE__*/Object.freeze({
    __proto__: null,
    RefreshRateWeb: RefreshRateWeb
});

exports.RefreshRate = RefreshRate;
//# sourceMappingURL=plugin.cjs.js.map
