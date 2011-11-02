for config_file (~/.zsh/*.zsh) source $config_file

source ~/.zsh/os.zsh

if [[ -f ~/.zsh/special/zshrc ]]; then
  source ~/.zsh/special/zshrc
fi

if [[ -f ~/.zsh.local ]]; then
  source ~/.zsh.local
fi

true
