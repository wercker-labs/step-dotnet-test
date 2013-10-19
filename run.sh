
if [ -n "$WERCKER_DOTNET_TEST_FILES" ]; then
  for FILENAME in $WERCKER_DOTNET_TEST_FILES
  do
    echo "/cygdrive/c/Program\ Files/Gallio/bin/Gallio.Echo.exe \"$FILENAME\""
    /cygdrive/c/Program\ Files/Gallio/bin/Gallio.Echo.exe "$FILENAME"
  done
else
  echo "Searching for files to test."

  for FILENAME in `find . | grep -i bin | grep -i test | grep -i .dll | sed 's/^\.\///'`
  do
    echo "/cygdrive/c/Program\ Files/Gallio/bin/Gallio.Echo.exe \"$FILENAME\""
    /cygdrive/c/Program\ Files/Gallio/bin/Gallio.Echo.exe "$FILENAME"
  done
fi



