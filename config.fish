function fif -a FLAGS REGEX WHERE -d "Calls grep [$arg0] $arg1 [$arg2='.']"
  if test -z $REGEX
    return 1
  end
  if test -z $WHERE
    set WHERE "."
  end
  if test -z $FLAGS
    set FLAGS ""
  end
  echo "grep -rn -s --color=auto $FLAGS $REGEX $WHERE"
  grep -rn -s --color=auto $FLAGS $REGEX $WHERE
end

function ssh-new
  if test -n $TMUX
    tmux select-pane -P 'bg=#331C1F'
  end
  ssh $argv
  echo "done"
  tmux select-pane -P 'bg=#022B36'
end

set -gx PATH /opt/local/bin /opt/local/sbin ~/miniconda2/bin $PATH
set -gx MANPATH /opt/local/share/man $MANPATH
set -gx DISPLAY :0.0
