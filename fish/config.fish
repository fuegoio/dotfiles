abbr go="git checkout"
abbr gs="git status"
abbr gcm="git commit -m"
abbr ga="git add"
abbr gp="git push"
abbr gm="git merge"

abbr dk="docker"
abbr dco="docker-compose"

alias screens="/home/fuego/.core/screens.sh"
alias vpnon="sudo systemctl start wg-quick@wg0"
alias vpnoff="sudo systemctl stop wg-quick@wg0"

set -x EDITOR vim
set -x ANDROID_HOME "/home/fuego/Android/Sdk"
set -gx PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools $PATH

set -U fish_greeting "Welcome to argo. Go faire du sale."

function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

set fish_color_command blue

function fish_prompt
  set -l last_status $status
  set -l red (set_color -o red)
  set -l blue (set_color -o blue)
  set -l purple (set_color -o yellow)
  set -l normal (set_color normal)

  set -l host $purple(hostname)
  set -l cwd $blue(basename (prompt_pwd))
  set -l arrow ""

  if [ (_git_branch_name) ]
    if test (_git_branch_name) = 'master'
      set -l git_branch (_git_branch_name)
      set git_info "$normal ($purple $git_branch$normal)"
    else if test (_git_branch_name) = 'dev'
      set -l git_branch (_git_branch_name)
      set git_info "$normal ($red $git_branch$normal)"
    else
      set -l git_branch (_git_branch_name)
      set git_info "$normal ($blue $git_branch$normal)"
    end

    if [ (_is_git_dirty) ]
      set -l dirty "$red "
      set git_info "$git_info$dirty"
    end
  end

  # Notify if a command took more than 10 sec
  if [ "$CMD_DURATION" -gt 10000 ]
	echo The last command took (math "$CMD_DURATION/1000") seconds.
  end

  echo -n -s $host ' ' $cwd $git_info $normal ' ' $arrow ' '
end
