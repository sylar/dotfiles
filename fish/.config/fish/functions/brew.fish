function brew
    switch "$argv[1]"
        case install reinstall remove tap untap
            command brew $argv
            
            if [ "$argv[2]" != "--no-save" ]
                command brew bundle dump --global --force
            end
            
        case '*'
            command brew $argv
    end
end
