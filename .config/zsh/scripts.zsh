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
  ssh_remote=$(git remote -v | head -n 1 | awk -F " " '{print $2}')
  url_without_ext="${ssh_remote%.git}"
  repo_path="${url_without_ext#*:}"

  echo "https://github.com/$repo_path"
}

function web_repo() {
  remote_url=$(g_remote_url)

  if [ -z "$remote_url" ]; then
    return 1
  fi

  firefox $remote_url
}

function open_pr() {
  topic_branch=$(git branch --show-current)
  origin_remote_url=$(g_remote_url)

  if [[ -z $origin_remote_url ]] then
    echo "no origin remote exists in this repository"
    return 1
  fi

  pull_url="$origin_remote_url/pull/new/$topic_branch"
  firefox $pull_url
}

function scratch() {
  tmux split-window -h "nvim ~/Documents/todo/scratch.md"
}

function todo() {
  ~/.local/bin/notes
}

function hours() {
  filename="$(date +%Y)_$(date +%m).md"
  project_name="$(basename $PWD)"
  tmux split-window -h "nvim ~/Documents/todo/projects/$project_name/hours/$filename"
}

function proj() {
  ~/.local/bin/project
}
