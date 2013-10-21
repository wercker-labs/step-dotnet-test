

mkdir -p /cygdrive/c/report

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

if [ -n "$WERCKER_DOTNET_TEST_FILES" ]; then
  for FILENAME in $WERCKER_DOTNET_TEST_FILES
  do
    echo "/cygdrive/c/Program\ Files/Gallio/bin/Gallio.Echo.exe \"$FILENAME\""
    /cygdrive/c/Program\ Files/Gallio/bin/Gallio.Echo.exe "$FILENAME"
  done
else
  echo "Searching for files to test."

  for FILENAME in `find . | grep -i "bin/.*test.*dll$" | sed 's/^\.\///'`
  do
    echo "/cygdrive/c/Program\ Files/Gallio/bin/Gallio.Echo.exe \"$FILENAME\" /nl /rt:xml-inline /rnf:testreport /rd:$WERCKER_REPORT_ARTIFACTS_DIR"
    /cygdrive/c/Program\ Files/Gallio/bin/Gallio.Echo.exe "$FILENAME" /nl /rt:xml-inline /rnf:testreport /rd:c:\\report
  done
fi


 rsync -vaz /cygdrive/c/report $WERCKER_REPORT_ARTIFACTS_DIR
ls $WERCKER_REPORT_ARTIFACTS_DIR
IFS=$SAVEIFS

