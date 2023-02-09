#!/bin/sh -l

THEME=${1}
RESUME=${2}
OUTPUT=${3}
FORMAT="${4:-html}"

if [[ -d $THEME ]]; then
    echo "$THEME is a directory";
    if [[ -f "$THEME/package.json" ]]; then
      BASE_DIR=$(dirname -- "$( readlink -f -- "$0"; )");
      echo "Installing theme dependencies";
      cd $THEME;
      npm install;
      cd $BASE_DIR;
    fi
elif [[ -f $THEME ]]; then
    echo "$THEME is a file";
else
    THEME_PACKAGE=jsonresume-theme-${THEME};
    echo "Installing theme: ${THEME}";

    # NOTE: this needs to be installed locally, not globally
    npm install ${THEME_PACKAGE};
fi

resume export --resume ${RESUME} --theme ${THEME} --format "${FORMAT}" ${OUTPUT}
