{...}: {
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
local config = {}

local tab_max_width = 30
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = tab_max_width
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.switch_to_last_active_tab_when_closing_tab = true

wezterm.on('format-tab-title', function(tab, tabs)
  local i = tab.tab_index
  local title = format_tab_title(tab, i + 1, tab_max_width)

  -- tokyonight colors
  local bar_bg = '#292e42'
  local inactive_bg = '#585b70'
  local active_bg =  '#1e1e2e'
  local bg = inactive_bg
  local fg = '#cdd6f4'
  if tab.is_active then
    bg = active_bg
  end

  local active_idx = active_tab_idx(tabs)
  local end_sep_color = bar_bg
  if i == (active_idx - 1) then
    end_sep_color = active_bg
  end

  return {
    { Background = { Color = bar_bg } },
    { Foreground = { Color = bg } },
    { Text = "▐" },
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = title },
    { Text = has_unseen_output and '  ' or "" },
    { Background = { Color = bar_bg } },
    { Foreground = { Color =  bg } },
    { Text = "▌" },
    { Background = { Color = bar_bg } },
    { Foreground = { Color = bar_bg } },
  }
end)
config.enable_wayland = false

config.font = wezterm.font("JetbrainsMono Nerd Font Mono")
config.font_size = 16

config.color_scheme = "Tokyo Night"
config.colors = {
  tab_bar = {
    background = '#292e42'
  }
}

config.hide_tab_bar_if_only_one_tab = false

config.audible_bell = "Disabled"

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
    '';
  };
}
