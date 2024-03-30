# builds co-author git commit with fuzzy search for author
function co_author() {
  commit_msg=$1
  author_info=$(git log --format="%aN <%aE>" | sort -u | fzf)

  git commit -m $commit_msg -m "Co-authored-by: $author_info"
}

function snap_clean() {
  sudo snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
      snap remove "$snapname" --revision=$revision
    done
}

function tclone() {
  repo_ssh_url=$1
  workspace=$2

  declare -A workspace_paths=(
    [work]=~/Dev/work/
    [top]=~/Dev/top_contrib/
    [agency]=~/Dev/agency-of-learning/
    [scratch]=~/Dev/test-space/
  )

  project_name=$(echo "$repo_ssh_url" | awk -F'[/.]' '{print $3}')
  destination_path="${workspace_paths[$workspace]}${project_name}"
  git clone $repo_ssh_url $destination_path

  source ~/.local/bin/tmux-sessionizer $destination_path
}

# kills process for given port number
function kill_port() {
  port_num=$1
  lsof -ti :$port_num | xargs kill -9
}

function g_remote_url() {
  remote=$1
  if [ "$remote" = "og" ]; then
    ssh_remote=$(git remote -v | head -n 1 | awk -F " " '{print $2}')
  elif [ "$remote" = "up" ]; then
    ssh_remote=$(git remote -v | grep upstream | grep -v -e fetch | awk -F " " '{print $2}')
  else
    echo "Must pass in a remote name" >&2
    return 1
  fi

  url_without_ext="${ssh_remote%.git}"
  repo_path="${url_without_ext#*:}"

  if [ -z $repo_path ]; then
    echo ""
  else
    echo "https://github.com/$repo_path"
  fi
}

function web_repo() {
  remote_url=$(g_remote_url $1)

  if [ -z "$remote_url" ]; then
    return 1
  fi

  firefox $remote_url
}

function open_pr() {
  compare_branch=$(git branch --show-current)
  upstream_url=$(g_remote_url up)
  base_branch=${1:-"main"}

  if [ -z $upstream_url ]; then
    pull_url="$(g_remote_url og)/compare/$base_branch...$compare_branch"
  else
    compare_origin="JoshDevHub:$(basename $PWD)"
    pull_url="$upstream_url/compare/$base_branch...$compare_origin:$compare_branch"
  fi

  firefox $pull_url
}

function scratch() {
  tmux split-window -h "nvim ~/Documents/todo/scratch.md"
}

function todo() {
  formatted_date="$(date +%Y)_$(date +%m)_$(date +%d)"
  tmux split-window -h "nvim ~/Documents/todo/dailies/$formatted_date.md"
}

function hours() {
  filename="$(date +%Y)_$(date +%m).md"
  project_name="$(basename $PWD)"
  tmux split-window -h "nvim ~/Documents/todo/projects/$project_name/hours/$filename"
}

function proj() {
  project="$(basename $PWD)"
  git_branch=$(git branch --show-current)
  if [[ "$git_branch" == main || "$git_branch" == master ]]; then
    filename=NOTES.md
  else
    filename="$git_branch.md"
  fi

  tmux split-window -h "nvim ~/Documents/todo/projects/$project/$filename"
}

function mdlint() {
  target_file=$1
  opts=${@:2}
  if [[ $(basename "$target_file") == project* ]]; then
    content_type="project"
  else
    content_type="lesson"
  fi

  config_file="${content_type}.markdownlint-cli2.jsonc"
  markdownlint-cli2 --config "$config_file" "$target_file" "$opts"
}
