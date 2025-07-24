import { WebPlugin } from '@capacitor/core';
import type { RefreshRatePlugin } from './definitions';
export declare class RefreshRateWeb extends WebPlugin implements RefreshRatePlugin {
    setRefreshRate(options: {
        hz: number;
    }): Promise<void>;
    resetRefreshRate(): Promise<void>;
}
