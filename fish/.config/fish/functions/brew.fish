function brew
    switch "$argv[1]"
        case install reinstall remove tap untap
            command brew $argv
            command brew bundle dump --global --force
        case '*'
            command brew $argv
    end
end
