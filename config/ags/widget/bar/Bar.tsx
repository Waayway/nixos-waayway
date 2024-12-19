import { App, Astal, Gdk, Gtk } from "astal/gtk3"
import Launcher from "./items/Launcher"
import HyprlandWorkspaces from "./items/Workspaces"
import Time from "./items/Time"
import Audio from "./items/Audio"
import Battery from "./items/Battery"
import Tray from "./items/Tray"
import { spacing } from "../../lib/variables"


export default function Bar(gdkmonitor: Gdk.Monitor) {
    return <window
        vexpand={true}
        className="Bar"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={Astal.WindowAnchor.TOP
            | Astal.WindowAnchor.LEFT
            | Astal.WindowAnchor.RIGHT}
        application={App}>
        <centerbox>
            <box halign={Gtk.Align.START} spacing={spacing}>
                <Launcher />
                <HyprlandWorkspaces />
            </box>
            <box spacing={spacing}>
                <Time />
            </box>
            <box halign={Gtk.Align.END} spacing={spacing}>
                <Audio />
                <Battery />
                <Tray />
            </box>
        </centerbox>
    </window>
}
