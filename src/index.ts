import { registerPlugin } from '@capacitor/core';

import type { RefreshRatePlugin } from './definitions';

const RefreshRate = registerPlugin<RefreshRatePlugin>('RefreshRate', {
  web: () => import('./web').then((m) => new m.RefreshRateWeb()),
});

export * from './definitions';
export { RefreshRate };
