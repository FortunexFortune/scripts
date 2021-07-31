#!/usr/bin/env bash
# This script was taken from ..... and re adapted
set -e
set -x
set -o pipefail

if [ $(git tag | wc -l) -eq 0 ]
then
  CURTAG="v0.0.0"
else
  CURTAG=`git describe --abbrev=0 --tags`;
fi

CURTAG="${CURTAG/v/}"

IFS='.' read -a vers <<< "$CURTAG"

MAJ=${vers[0]}
MIN=${vers[1]}
BUG=${vers[2]}
echo "Current Tag: v$MAJ.$MIN.$BUG"

for cmd in "$@"
do
	case $cmd in
		"--major")
			# $((MAJ+1))
			((MAJ+=1))
			MIN=0
			BUG=0
			echo "Incrementing Major Version#"
			;;
		"--minor")
			((MIN+=1))
			BUG=0
			echo "Incrementing Minor Version#"
			;;
		"--bug")
			((BUG+=1))
			echo "Incrementing Bug Version#"
			;;
	esac
done

NEWTAG="v$MAJ.$MIN.$BUG"
echo "Adding Tag: $NEWTAG";

# Prompt for confirmation before tagging
until [[ ${tagrepo} == "n" ||  ${tagrepo} == "y" ]]
do
   read -p 'Proceed to tag repository? y/n: ' tagrepo
done

# user aborted tag process
if [ ${tagrepo} == "n" ]
then
  echo "aborting tagging process ....... "
  exit 1
fi

# user accepted tag process
git tag -a $NEWTAG -m $NEWTAG