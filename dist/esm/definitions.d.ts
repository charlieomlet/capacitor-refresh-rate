export interface RefreshRatePlugin {
    /**
     * Sets the refresh rate of the display.
     * @param options - An object containing the refresh rate in Hz.
    */
    setRefreshRate(options: {
        hz: number;
    }): Promise<void>;
    /**
     * Resets the refresh rate to the default value.
     */
    resetRefreshRate(): Promise<void>;
}
