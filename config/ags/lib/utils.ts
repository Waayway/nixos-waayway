import GLib from "gi://GLib?version=2.0"

import icons, { substitutes } from "./icons";
import Astal from "gi://Astal?version=3.0";

/**
  * @returns substitute icon || name || fallback icon
  */
export function icon(name: string | null, fallback = icons.missing) {
    if (!name)
        return fallback || ""

    if (GLib.file_test(name, GLib.FileTest.EXISTS))
        return name

    const icon = (substitutes[name] || name)
    if (Astal.Icon.lookup_icon(icon))
        return icon

    print(`no icon substitute "${icon}" for "${name}", fallback: "${fallback}"`)
    return fallback
}
