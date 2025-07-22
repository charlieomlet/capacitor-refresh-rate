import { RefreshRate } from 'refresh-rate';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    RefreshRate.echo({ value: inputValue })
}
