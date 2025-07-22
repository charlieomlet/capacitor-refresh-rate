export interface RefreshRatePlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
