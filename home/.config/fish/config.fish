set -x LANG ja_JP.UTF-8
set -x EDITOR vim
set -x PATH $HOME/bin /usr/local/bin $PATH

set HOST_FISH ~/.config/fish/(hostname).fish
if test -f $HOST_FISH
   . $HOST_FISH
else
   echo Creating host fish: $HOST_FISH
   touch $HOST_FISH
end

set PLATFORM_FISH ~/.config/fish/(uname -s).fish
if test -f $PLATFORM_FISH
   . $PLATFORM_FISH
else
   echo Creating platform fish: $PLATFORM_FISH
   touch $PLATFORM_FISH
end

if [ -z "$AUTO_TMUX" -a -z "$TMUX" ]
  tmux has-session ^/dev/null; and tmux list-session | grep -q '^LOCAL'
  if [ $status -eq 0 ]
    tmux attach -t LOCAL
  else
    tmux new -s LOCAL
  end
end

