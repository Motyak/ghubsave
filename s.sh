#!/bin/bash

# import using relative paths
function import
{
    local PATH=$(dirname $(realpath $0))
    for s in $@; do
        source $PATH/$s
    done
}

# get_repos_name_from_user get_branches_name_from_repo clone_branch
import include/s.sh

USER=$1
OUT_DIR=${2:-.}
MAX_NB_OF_REPOS=${3:-}

BACKUP_NAME="${USER}_$(date +%Y%m%d)"

cd $OUT_DIR &&
mkdir $BACKUP_NAME && cd $_ &&
(
    repos=$(get_repos_name_from_user $USER $MAX_NB_OF_REPOS)
    for repo in $repos; do
        mkdir $repo; cd $_
        branches=$(get_branches_name_from_repo $USER $repo)
        for branch in $branches; do
            $(clone_branch $USER $repo $branch)
            mv $repo $branch
        done
        cd ..
    done
)
tar -czf ../$BACKUP_NAME.tar.gz * &&
cd .. &&
rm -rf $BACKUP_NAME/
