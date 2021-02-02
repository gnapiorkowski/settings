#!/bin/sh

# [0m[01;34m [0m
NEWLINE=$'\n'
echo""
read -r -p "Do you want to add [0m[01;34mfasd aliases[0m to .zshrc? [y/N/x(exit)]: " input

case $input in
        [yY][eE][sS]|[yY])
    fasd=true
    ;;
        [xX])
    exit 1
    ;;
        *)
    echo "Not using fasd"
    fasd=false
    # exit 1
    ;;
esac

echo""
read -r -p "Do you want to replace your /home/$USER/files with these [0m[01;34mconfig files[0m? [y/N/x(exit)]: " input
 
case $input in
        [yY][eE][sS]|[yY])
    echo "Copying:"
    echo "----.zshrc"
    cp ./.zshrc /home/$USER/
    echo "----.config folder"
    cp -r ./.config /home/$USER/
    echo "----.local folder"
    cp -r ./.local /home/$USER/
    echo "----.vimrc"
    cp ./.vimrc /home/$USER/
    echo "----.inputrc folder"
    cp ./.inputrc /home/$USER/
    ;;
        [xX])
    exit 1
    ;;
        *)
    echo "Din not copy."
    # exit 1
    ;;
esac

echo""
read -r -p "Do you want to copy [0m[01;34mzsh plugins[0m to /usr/share/zsh/plugins? (requires sudo permissions)[y/N/x(exit)]" input
 
case $input in
        [yY][eE][sS]|[yY])
    echo "Copying:"
    echo "plugins folder"
    sudo cp -r ./zsh_plugins/plugins /usr/share/zsh/
    ;;
            [xX])
        exit 1
        ;;
            *)
        echo "Did not copy."
        # exit 1
        ;;
esac

if [ "$fasd" = true ] ; then
    cat fasd.txt >> /home/$USER/.zshrc
    echo""
    read -r -p "Do you want to install [0m[01;34mfasd[0m with pacman? (requires sudo) [y/N/x(exit)]: " input

    case $input in
            [yY][eE][sS]|[yY])
            sudo pacman -S fasd
        ;;
            [xX])
        exit 1
        ;;
            *)
        echo "Didn't install fasd, but added the aliases at the end of your .zshrc."
        # exit 1
        ;;
    esac
fi
