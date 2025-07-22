# refresh-rate

Alter the refresh rate in Capacitor app

## Install

```bash
npm install refresh-rate
npx cap sync
```

## API

<docgen-index>

* [`setRefreshRate(...)`](#setrefreshrate)
* [`resetRefreshRate()`](#resetrefreshrate)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### setRefreshRate(...)

```typescript
setRefreshRate(options: { hz: number; }) => Promise<void>
```

Sets the refresh rate of the display.

| Param         | Type                         | Description                                    |
| ------------- | ---------------------------- | ---------------------------------------------- |
| **`options`** | <code>{ hz: number; }</code> | - An object containing the refresh rate in Hz. |

--------------------


### resetRefreshRate()

```typescript
resetRefreshRate() => Promise<void>
```

Resets the refresh rate to the default value.

--------------------

</docgen-api>
