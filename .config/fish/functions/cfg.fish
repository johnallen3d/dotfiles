function cfg
  # home folder abbr -a for git, see here for more details
  # https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
  git --git-dir=/Users/johna/.cfg/ --work-tree=/Users/johna $argv
end
