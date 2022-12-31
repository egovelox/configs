function append-to-path --description 'Adds the given directory to the end of the PATH'

    set -l dir ''
    if test (count $argv) -ne 0
        set dir $argv[1]
    end

    if test -d $dir
        set dir $dir
        if not contains $dir $PATH
            set PATH $PATH $dir
        end
    else
        echo "Got error in function append-to-path : does directory $dir exist ?"
    end

end


