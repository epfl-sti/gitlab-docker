#!/bin/sh

set -x
case "$0" in
    /*) binpath="$0" ;;
    *)  binpath="$PWD/$0" ;;
esac

topdir="$(realpath "$(dirname "$binpath")"/..)"

dockerstem="$(basename "$topdir" | sed 's/[-_ ]//')"
