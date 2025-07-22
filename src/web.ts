import { WebPlugin } from '@capacitor/core';

import type { RefreshRatePlugin } from './definitions';

export class RefreshRateWeb extends WebPlugin implements RefreshRatePlugin {
  async setRefreshRate(options: { hz: number }): Promise<void> {
    console.log('Setting refresh rate on web is not supported:', options?.hz);
  }
  async resetRefreshRate(): Promise<void> {
    console.log('Resetting refresh rate on web is not supported');
  }
}
