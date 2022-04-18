GITHUB_URL=https://github.com
GITHUB_API_URL=https://api.github.com

function get_repos_name_from_user
{
    local user=$1
    local max_nb_of_repos=${2:-59} # 60 requests/hour limit, 1 request to list repos

    local json_res=$(curl -sS \
        "$GITHUB_API_URL/users/$user/repos?sort=updated&per_page=$max_nb_of_repos"
    )

    echo "$json_res" | jq -r '.[] | .name'
}

function get_branches_name_from_repo
{
    local user=$1
    local repo=$2

    local json_res=$(curl -sS "$GITHUB_API_URL/repos/$user/$repo/branches")

    echo "$json_res" | jq -r '.[] | .name'
}

function clone_branch
{
    local user=$1
    local repo=$2
    local branch=$3
    local dest_folder=${4:-}

    echo "git clone -b $branch $GITHUB_URL/$user/$repo.git $folder"
}
