#!/usr/bin/env bash

# git hmr
    # This alias can be used to
    # - list all opened gitlab merge-requests on your project
    # - switch to the merge-request branch
    #
    # Prerequisites :
    # - you need to set in your environment :
    #   HF_GIT_DOT_HERMES_DOT_COM_TOKEN ( for legacy )
    #   HF_GITLAB_DOT_COM_TOKEN ( for milkyway )
    # - you need to install fzf and jq, e.g for macOS :
    #   brew install fzf
    #   brew install jq
h_merge_requests() {
      BASE_URL_LG="https://git.hermes.com";
      BASE_URL_MW="https://gitlab.com";
      GITLAB_API_VERSION="v4";
      GITLAB_API="api/${GITLAB_API_VERSION}/projects";
      REPO_ORIGIN_URL="$(git remote get-url origin)";
      case $REPO_ORIGIN_URL in
        git@git.hermes.com*)
          BASE_URL="${BASE_URL_LG}/${GITLAB_API}";
          REPO_NAME="$(git remote get-url origin | cut -d':' -f2  | sed -e 's|\.git||' | sed -e 's|/|%2F|g')"
          TOKEN="${HF_GIT_DOT_HERMES_DOT_COM_TOKEN}";;
        https://gitlab.com*)
          BASE_URL="${BASE_URL_MW}/${GITLAB_API}/hermesintl%2Fretail%2Ffabernovel%2F";
          REPO_NAME="$(git remote get-url origin | cut -d':' -f2  | sed -e 's|\.git||' | sed -e 's|/|%2F|g')"
          TOKEN="${HF_GITLAB_DOT_COM_TOKEN}";;
      esac;
      curl \
        "${BASE_URL}/${REPO_NAME}/merge_requests?state=opened&order_by=updated_at&per_page=30" \
        --silent -H "Authorization: Bearer ${TOKEN}" \
      | jq -r '.[] | [.source_branch, .web_url, (.updated_at | split(".")[0] ), .author.username, .title ] | @tsv' \
      | column -s"$(printf '\t')" -t \
      | fzf \
        --sync \
        --delimiter='[ ]{1,}' \
        --with-nth 3.. \
        --bind='enter:become(git fetch origin {1} && git switch {1})' \
        --bind='ctrl-o:accept+execute(open {2})' \
        --bind change:first \
        --border-label=" MERGE-REQUESTS: ${REPO_NAME} " \
        --layout=reverse-list \
        --no-info \
        --disabled \
        --bind='change:clear-query' \
        --prompt "Commands: " \
        --header-first \
        --header='🤓 [Enter]   git fetch origin <branch> && git switch <branch>
👀 [Ctrl-o]  open in browser
👋 [C-c]     exit
   [Esc]' \
        --cycle \
        -i \
      > /dev/null;
      }; 

h_merge_requests
