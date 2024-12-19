import AstalHyprland from "gi://AstalHyprland?version=0.1";
import { Variable, bind } from "astal";

const hyprland = AstalHyprland.get_default();

export default function HyprlandWorkspaces() {
    const workspaces = Variable.derive([bind(hyprland, "workspaces"), bind(hyprland, "focusedWorkspace")], (workspaces, focused) => ({ workspaces: workspaces, focus: focused }));

    return (
        <box className="workspaces">
            {workspaces().as(data => data.workspaces.sort((a, b) => a.id > b.id ? 1 : -1).map(ws => <Workspace workspace={ws} focused={data.focus} />))}
        </box>
    )
}


export function nameToLabel(workspace: AstalHyprland.Workspace) {
    switch (workspace.name) {
        case "101":
            return <icon icon="audio-x-generic-symbolic" />;
        case "102":
            return <icon icon="discord-tray" />;

        default:
            if (Number(workspace.name) > 100) {
                const num = Number(workspace.name) - 100;
                return "F" + num;
            }
            return workspace.name
    }
}

export interface WorkspaceProps {
    workspace: AstalHyprland.Workspace
    focused: AstalHyprland.Workspace
}

export function Workspace({ workspace, focused }: WorkspaceProps) {
    const onClick = () => {
        hyprland.dispatch("workspace", workspace.id.toString());
    }
    return (
        <button onClick={onClick} className={workspace.id == focused.id ? "active" : ""}>
            {nameToLabel(workspace)}
        </button>
    )
}
