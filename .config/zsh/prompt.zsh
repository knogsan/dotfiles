# prompt
left_prompt() {
  local newline=$'\n'
  local dir="%F{11}%~%f"
  local next="%F{47}❯%f "
  local vcs_info="(%F{207}%{${vcs_info_msg_0_}%f)"

  # PROMPT='%K{250} %F{016}%C%k%K{118}%f%F{250}%f%F{016}%{${vcs_info_msg_0_}%f%k%F{118}%f $'
  PROMPT="${newline}${user}${dir} ${vcs_info}${newline}${next}"
}

right_prompt() {
  RPROMPT=`` # なし
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd left_prompt
add-zsh-hook precmd right_prompt
