import AstalTray from "gi://AstalTray?version=0.1";
import { bind, Variable } from "astal";
import { App, Gdk } from "astal/gtk3";
import { spacing } from "../../../lib/variables";

const tray = AstalTray.get_default();

export default function Tray() {

    const items = Variable.derive([bind(tray, "items")], (items) => ({ items: items }))

    return (
        <box className="tray" spacing={spacing / 2}>
            {items().as(items => items.items.map(item => (
                <TrayItem item={item} />
            )))}
        </box>
    )

}

type BarTrayItemProps = {
    item: AstalTray.TrayItem;
};

const TrayItem = ({ item }: BarTrayItemProps) => {
    if (item.iconThemePath) App.add_icons(item.iconThemePath);

    const menu = item.create_menu();

    return (
        <button
            className="bar__tray-item"
            tooltipMarkup={bind(item, "tooltipMarkup")}
            onDestroy={() => menu?.destroy()}
            onClickRelease={(self, event) => {
                if (event.button !== 3) return;
                menu?.popup_at_widget(
                    self,
                    Gdk.Gravity.SOUTH,
                    Gdk.Gravity.NORTH,
                    null,
                );
            }}
        >
            <icon gIcon={bind(item, "gicon")} />
        </button>
    );
};
