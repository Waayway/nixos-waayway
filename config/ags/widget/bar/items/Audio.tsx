import Wp from "gi://AstalWp";

import { bind, Variable } from "astal";
import Astal from "gi://Astal?version=3.0";

const audio = Wp.get_default()?.audio;

export default function Audio() {
    if (audio === null || audio === undefined) return <></>;

    const audio_data = Variable.derive([bind(audio.default_speaker, "volume"), bind(audio.default_speaker, "icon")], (volume, icon) => ({ volume: Math.round(volume * 100), icon: icon }))

    return (
        <box className="audio">
            {audio_data().as(d => <label label={d.volume.toString() + "%"} />)}
            {audio_data().as(d => <icon icon={Astal.Icon.lookup_icon(d.icon) ? d.icon : "audio-headphones"} />)}
        </box>
    )
}
