function torch-sync
  set ADDRESS $argv[1]
  rsync -avzh ~/development/torch/torch-song pi@$ADDRESS:/home/pi/torch --delete --exclude 'env'
end

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
