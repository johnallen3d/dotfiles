if not set -q EDITOR
  set -x EDITOR nvim
  set -x VISUAL nvim
  set -x GIT_EDITOR nvim

  # disable homebrew github api https://github.com/Homebrew/brew/issues/93
  set -x HOMEBREW_NO_GITHUB_API 1

  set -x NIB_CRYPT_BUCKET_NAME tk-secrets

  set -x MUSIC_DIR ~/Music/iTunes/iTunes Music/Music/
end
