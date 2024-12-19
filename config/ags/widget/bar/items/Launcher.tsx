import GLib from "gi://GLib?version=2.0"
import Gtk from "gi://Gtk?version=3.0";

import { execAsync } from "astal";

export default function Launcher() {
    const clickLauncher = () => {
        execAsync("nwg-drawer")
    }

    const logo = GLib.get_os_info("LOGO");
    return (
        <button onClick={clickLauncher}
            halign={Gtk.Align.START}>
            {logo &&
                <icon icon={logo} css={`font-size: 24px`} />
            }
        </button>
    )
}
