#!/bin/sh

# [0m[01;34m [0m

fasd=false
fasd_install=false

cmd=(dialog --separate-output --checklist "Select options:" 22 76 16)
options=(
         1 "replace your /home/$USER/files with these config files" off
         2 "copy zsh plugins to /usr/share/zsh/plugins" off
         3 "add fasd aliases to .zshrc?" off
         4 "install fasd with pacman" off
     )

choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
# clear
for choice in $choices
do
    case $choice in
        1)
            echo ""
            echo "Copying config files to /home/$USER/:"
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
        2)
            echo ""
            echo "Copying [0m[01;34mzsh plugins[0m to /usr/share/zsh/plugins..."
            sudo cp -r ./zsh_plugins/plugins /usr/share/zsh/
            ;;
        3)
            echo ""
            echo "Adding [0m[01;34mfasd aliases[0m to /home/$USER/.zshrc..."
            cat fasd.txt >> /home/$USER/.zshrc
            ;;
        4)
            echo ""
            echo "Installing [0m[01;34mfasd[0m with pacman... (requires sudo)"
            sudo pacman -S --needed fasd
            ;;
    esac
done
