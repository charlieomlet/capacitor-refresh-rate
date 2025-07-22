import { WebPlugin } from '@capacitor/core';

import type { RefreshRatePlugin } from './definitions';

export class RefreshRateWeb extends WebPlugin implements RefreshRatePlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
