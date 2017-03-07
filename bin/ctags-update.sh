#!/bin/bash
if [ -f ".gitignore" ]; then
  if [ -f ".srclist" ]; then
    ctags -R --exclude=@.ctagsignore -L .srclist -f  tags \
        --kinds-PHP=dcfit     # d - constant definitions c - classes f -  functions i - interfaces t - traits
	# --output-format=e-ctags
	# e-ctags to cosider \, but is not working https://github.com/universal-ctags/ctags/issues/815
  else
    ctags -R --exclude=@.ctagsignore -f tags \
        --kinds-PHP=dcfit     # d - constant definitions c - classes f -  functions i - interfaces t - traits
	# --output-format=e-ctags
	# e-ctags to cosider \, but is not working https://github.com/universal-ctags/ctags/issues/815
  fi
else
  HERE=$PWD
  cd ..
  if [ "$PWD" = "$HERE" ]; then
    echo "Got to /, have not found your project root, abort!"
    exit 1
  fi
  exec "$0"
fi
# EOF
