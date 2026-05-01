set -U fish_greeting (set_color -o brblack; echo "Welcome to Lynx. Go faire du sale.")

fish_vi_key_bindings insert
function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end

set fish_color_command blue
set --global hydro_symbol_start (set_color -o blue; echo "lynx")
set --global hydro_color_start blue
set --global hydro_color_duration red
set --global hydro_color_pwd magenta
set --global hydro_color_git green
