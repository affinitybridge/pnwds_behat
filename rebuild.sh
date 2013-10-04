#!/bin/bash
BASEDIR=`php -r "echo dirname(realpath('$0'));"`
OLDDIR=`pwd`
cd $BASEDIR

mkdir old_contrib
mkdir old_contrib/modules
for contrib in modules/contrib modules/development libraries translations
do
    mv -f $contrib old_contrib/$contrib
done

# Exclude custom theme from deletion.
mkdir old_contrib/themes
find themes -mindepth 1 -maxdepth 1 -not -name "custom" -exec mv {} old_contrib/themes \;

drush make $1 --working-copy --no-core --contrib-destination=. pnwds_behat.make
git checkout modules
# If the drush make ran without errors, we can continue
RETVAL=$?
if [ $RETVAL -eq 0 ]; then
  rm -rf old_contrib
  echo "backups deleted"
else
    # Things went wrong - back-up from old_contrib
    rsync -a old_contrib/ .
    rm -rf old_contrib
    echo "codebase resetored from backups"
fi


# Go back where we came from.
cd $OLDDIR