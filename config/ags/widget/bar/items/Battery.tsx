import AstalBattery from "gi://AstalBattery?version=0.1";
import { Variable, bind } from "astal";

const battery = AstalBattery.get_default();

export default function Battery() {
    const data = Variable.derive([bind(battery, "percentage")], (percentage) => ({ percentage: percentage }))

    // TODO: Make battery work lol

    return <box className="battery"></box>

    return (
        <box className="battery">
        </box>
    )
}
