abbr -a -U -- dco docker compose
abbr -a -U -- dk docker
abbr -a -U -- k kubectl
abbr -a -U -- ga 'git add'
abbr -a -U -- gcm 'git commit -m'
abbr -a -U -- gm 'git merge'
abbr -a -U -- gc 'git checkout'
abbr -a -U -- gcb 'git checkout -b'
abbr -a -U -- gp 'git push'
abbr -a -U -- gs 'git status'

alias vpnon="sudo wg-quick up wg0"
alias vpnoff="sudo wg-quick down wg0"
alias dvorak="setxkbmap -variant dvorak -layout us"
alias git-clean="git branch --merged master | grep -v '\* master' | xargs -n 1 git branch -d"
alias vim="nvim"

set -x EDITOR nvim
set -x VISUAL nvim
set -g fish_user_paths $HOME/.core

set red (set_color -o red)
set blue (set_color -o blue)
set purple (set_color -o magenta)
set green (set_color -o cyan)
set yellow (set_color -o yellow)
set pink (set_color -o white)
set normal (set_color normal)

set -U fish_greeting "$blue $normal Welcome to Andromeda. Go faire du sale."

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
  echo (command git symbolic-ref HEAD 2>/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2>/dev/null)
end

function _is_git_not_pushed
  echo (command git log origin/master..HEAD 2>/dev/null)
end

set fish_color_command blue

function fish_prompt
  set -l last_status $status
  set -l host $blue andromeda
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
    set git_branch "$pink  " (_git_branch_name)
    if [ (_is_git_not_pushed) ]
      set git_not_pushed "$green ﱢ "
    end
    if [ (_is_git_dirty) ]
      set git_dirty "$yellow 柳"
    end
  end

  echo -n -s $cwd $git_not_pushed $git_dirty $git_branch $green $normal
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true

source /opt/asdf-vm/asdf.fish
