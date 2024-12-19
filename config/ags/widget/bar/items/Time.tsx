import { Variable } from "astal";

const time = Variable("").poll(1000, "date '+%k:%M'");
const date = Variable("").poll(1000, "date '+%m-%d'");

export default function Time() {
    return (
        <box className="time">
            <label label={time()} />
            <label label={date()} />
        </box>
    )
}
