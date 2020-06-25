
BOOKMARKS_FILE="${HOME}/.bookmarks"
SITES=$(cat ${BOOKMARKS_FILE})
BROWSER="firefox"


handle_choice()
{
	site=$1

	if [ ! -z "$site" ]
	then 
		$BROWSER "${site}"
	else
		echo "URL Not valid"
	fi
	
}

gen_bookmarks_list()
{
    for site in "${SITES}"
    do
        echo "$site"
    done
}


main()
{
	choice=$(echo "$(gen_bookmarks_list)" | rofi -dmenu -p "Open " -theme themes/onedark.rasi)
	handle_choice "${choice}"
}

main "$@"