#!/bin/sh -l

THEME=${1}
RESUME=${2}
OUTPUT=${3}
FORMAT="${4:-html}"

THEME_PACKAGE=jsonresume-theme-${THEME}
echo "Installing theme: ${THEME}"

# NOTE: this needs to be installed locally, not globally
npm install ${THEME_PACKAGE}

resume export --resume ${RESUME} --theme ${THEME} --format ${FORMAT} ${OUTPUT}
