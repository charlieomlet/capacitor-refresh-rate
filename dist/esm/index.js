import { registerPlugin } from '@capacitor/core';
const RefreshRate = registerPlugin('RefreshRate', {
    web: () => import('./web').then((m) => new m.RefreshRateWeb()),
});
export * from './definitions';
export { RefreshRate };
//# sourceMappingURL=index.js.map