function brew
    set -l cmd $argv[1]
    set -l restOfCmd (string match -v -- '--no-save' $argv)

    switch "$cmd"
        case install reinstall remove tap untap
            if contains -- '--no-save' $argv
                # Execute without saving
                command brew $restOfCmd
            else
                # Execute and save
                command brew $argv
                command brew bundle dump --global --force
            end
        case '*'
            command brew $argv
    end
end
