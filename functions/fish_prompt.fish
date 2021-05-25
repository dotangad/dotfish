function fish_prompt --description 'Write out the prompt'
    # Save our status
    set -l last_pipestatus $pipestatus

    set -l suffix
    switch $fish_bind_mode
      case default
        set suffix '<<'
      case insert
        set suffix '>>'
      case replace_one
        set suffix '^'
      case visual
        set suffix 'V'
      case '*'
        echo '?'
    end

    # orange: e5c07b
    # purple: d55fde
    # blue:   52adf2
    echo -n -s (set_color --bold e5c07b) "λ" (set_color normal) \
        (set_color bbbbbb) " :: " \
        (set_color d55fde) (prompt_pwd) (set_color bbbbbb) \
        (fish_vcs_prompt) \
        (__fish_print_pipestatus " [" "]" "|" (set_color $fish_color_status) \
        (set_color $fish_color_status) $last_pipestatus) " "\
        (set_color --bold 52adf2) "$suffix " (set_color normal)
end
