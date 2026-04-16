#!/bin/bash

DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)

TIMESTAMP=$(date '+%Y%m%d%H%M%S')

LIST_FILE="$DOTFILES_DIR/dotfiles.list"

if [[ ! -f "$LIST_FILE" ]]; then
  echo "Error: $LIST_FILE not found."
  exit 1
fi

function deploy_dotfile() {
  local relative_path="$1"
  local src_path="$DOTFILES_DIR/dotfiles/$relative_path"
  local dest_path="$HOME/$relative_path"
  local dest_dir
  dest_dir=$(dirname "$dest_path")

  # リンク先の親ディレクトリを作成
  if [[ ! -d "$dest_dir" ]]; then
    mkdir -p "$dest_dir"
  fi

  # 既存のファイル、リンクがあればバックアップ
  if [[ -e "$dest_path" || -L "$dest_path" ]]; then
    if [[ "$(readlink "$dest_path")" == "$src_path" ]]; then
      echo "Already linked: $relative_path"
      return
    fi
    mv "$dest_path" "${dest_path}_${TIMESTAMP}"
    echo "Backup created: ${relative_path}_${TIMESTAMP}"
  fi

  # シンボリックリンク作成
  ln -fs "$src_path" "$dest_path"
  echo "Deployed: $relative_path"
}

# リストファイルを読み込んで実行
while IFS= read -r line || [[ -n "$line" ]]; do
  [[ -z "$line" || "$line" =~ ^# ]] && continue

  deploy_dotfile "$line"
done <"$LIST_FILE"

echo "All done!"
