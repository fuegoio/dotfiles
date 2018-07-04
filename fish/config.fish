abbr gs="git status"
abbr gcm="git commit -m"
abbr ga="git add"
abbr gp="git push"
abbr gm="git merge"

abbr dk="docker"
abbr dco="docker-compose"

alias screens="/home/fuego/.core/screens.sh"
alias vpnon="sudo wg-quick up wg0"
alias vpnoff="sudo wg-quick down wg0"

set -x EDITOR vim
set -gx ANDROID_HOME $HOME/Android/Sdk
set -gx npm_config_prefix $HOME/.node_modules
set -U fish_user_paths $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $HOME/.node_modules/bin

set red (set_color -o red)
set blue (set_color -o blue)
set purple (set_color -o magenta)
set green (set_color -o cyan)
set yellow (set_color -o yellow)
set normal (set_color normal)

set -U fish_greeting "$blue $normal Welcome to Argo. Go faire du sale."

fish_vi_key_bindings insert
function fish_user_key_bindings
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end

function fish_mode_prompt
  echo ''
end

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _is_git_not_pushed
  echo (command git log origin/master..HEAD ^/dev/null)
end

set fish_color_command blue

function fish_prompt
  set -l last_status $status
  set -l host $blue(hostname)
  set -l arrow ""

  # Notify if a command took more than 10 sec
  if [ "$CMD_DURATION" -gt 10000 ]
	echo The last command took (math "$CMD_DURATION/1000") seconds.
  end

  echo -n -s $host ' ' $normal $arrow ' '
end

function fish_right_prompt
  set -l cwd $purple (prompt_pwd)

  if [ (_git_branch_name) ]
    set git_branch "$blue  " (_git_branch_name)
    if [ (_is_git_not_pushed) ]
      set git_not_pushed "$green  "
    end
    if [ (_is_git_dirty) ]
      set git_dirty "$red  "
    end
  end

  echo -n -s $cwd $git_not_pushed $git_dirty $git_branch $normal
end
