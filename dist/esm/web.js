import { WebPlugin } from '@capacitor/core';
export class RefreshRateWeb extends WebPlugin {
    async setRefreshRate(options) {
        console.log('Setting refresh rate on web is not supported:', options === null || options === void 0 ? void 0 : options.hz);
    }
    async resetRefreshRate() {
        console.log('Resetting refresh rate on web is not supported');
    }
}
//# sourceMappingURL=web.js.map