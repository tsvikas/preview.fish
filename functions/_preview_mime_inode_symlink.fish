functions --query preview || exit

function _preview_mime_inode_symlink
    set --local type (file --brief $argv)
    set --local dest (string match -g -r "^symbolic link to (.*)" "$type")
    if test -z "$dest"
        echo "Not a symbolic link"
        return 1
    end
    echo -n "symbolic link to "
    if test -e "$dest"
        preview "$dest"
    else
        echo "$dest"
        echo "Link target does not exist"
    end
end
