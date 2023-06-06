
# Allows new tabs to be opened at the current location.
# Once setup, type 'new' without the quotes to open a new tab
# Move all the following lines into your ~/.bashrc or ~/.zshrc file

NEW_TAB_CONFIG_FILE="$HOME/new_tab.config"

set_new_tab_location() {
    # create new tab config file if it doesn't exist
    new_tab_location=$HOME
    if [ ! -f "$NEW_TAB_CONFIG_FILE" ]; then
        # Create the config file and populate it with a setting
        echo "new_tab_location='$new_tab_location'" > "$NEW_TAB_CONFIG_FILE"
        echo "Created new tab config file: $NEW_TAB_CONFIG_FILE"
    fi

    # set new_location to the current working dir
    new_location="${1:-$(pwd)}"
    sed -i "s|new_tab_location=.*|new_tab_location='$new_location'|" $NEW_TAB_CONFIG_FILE
}

# set the new_tab location to current folder then open a new tab
alias new='set_new_tab_location $1 && wt.exe -w 0 nt wsl.exe -d Ubuntu-20.04'
source $NEW_TAB_CONFIG_FILE
cd $new_tab_location
