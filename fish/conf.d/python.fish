function on_chdir --on-event fish_prompt
    # Check if we are leaving the tree of a directory with a virtual environment
    if test -n "$VIRTUAL_ENV"
        # Get the directory where the virtual environment is located
        set -l venv_dir (dirname $VIRTUAL_ENV)
        set -l pattern "^$venv_dir(/|\$)"

        # Check if the new directory is outside the virtual environment's root tree
        # Use regex prefix match to handle all cd forms (cd .., cd ../other, etc.)
        if not string match -rq $pattern "$PWD"
            set_color -o brblack;
            echo "Deactivating Python virtual environment..."
            deactivate
        end
    end

    # Check if we are entering a directory tree with a virtual environment
    if test -z "$VIRTUAL_ENV"
        set -l current_dir $PWD
        while test "$current_dir" != "/"
            if test -d "$current_dir/.venv"
                set_color -o brblack;
                echo "Activating Python virtual environment..."
                source "$current_dir/.venv/bin/activate.fish"
                break
            else if test -d "$current_dir/venv"
                set_color -o brblack;
                echo "Activating Python virtual environment..."
                source "$current_dir/venv/bin/activate.fish"
                break
            end
            set current_dir (dirname "$current_dir")
        end
    end
end
