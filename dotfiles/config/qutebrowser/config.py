from os import path


# Tabs Position
c.tabs.position = "right"
c.tabs.width = "16%"

# Search Engines
c.url.searchengines = {
	"DEFAULT": "https://www.startpage.com/do/dsearch?query={}",
	"g": "http://www.google.com/search?q={}",
	"s": "https://stackoverflow.com/search?q={}",
	"py": "https://docs.python.org/3.6/search.html?q={}",
	"yt": "https://www.youtube.com/results?search_query={}",
	"mp": "https://www.google.com/maps/search/{}/",
	"rd": "https://www.reddit.com/search/?q={}",
	"dc": "https://hub.docker.com/search?q={}&type=image",
        "gt": "https://github.com/search?q={}",
	"im": "https://www.google.com/search?q={}&tbm=isch",
	"ig": "https://www.gitignore.io/api/{}",
}
# Aliases
c.aliases = {
	"w": "session-save",
	"wq": "quit --save",
	"l": "session-load",
	"r": "spawn --userscript",
	"s": "spawn --userscript search",
	"v": "spawn --userscript viewMPV",
	"t": "spawn --userscript taskadd",
	"dl": "spawn --userscript openDL",
	"history-delete": "spawn --userscript historyDelete"
}
# Key Bindings:s
# config.bind('<Ctrl-&>', ':spawn --userscript') # check how input works ?

# Always restore open sites when qutebrowser is reopened.
c.auto_save.session = True

# Background color of unselected tabs.
c.colors.tabs.even.bg = "silver"
c.colors.tabs.odd.bg = "gainsboro"

# Ask confirmation before quit
c.confirm_quit = ["multiple-tabs"]

# Text editor to use 
c.editor.command = ["gedit '{}'"]
# Bind keyboard shortcuts 
# config.bind('<Ctrl-v>', 'spawn mpv {url}')

# Automatically enter insert mode if an editable element is focused
# after loading the page.
c.input.insert_mode.auto_load = True

# Show a scrollbar.
c.scrolling.bar = True

# Behavior when the last tab is closed.
# Valid values:
#   - ignore: Don't do anything.
#   - blank: Load a blank page.
#   - startpage: Load the start page.
#   - default-page: Load the default page.
#   - close: Close the window.
c.tabs.last_close = "default-page"


# The page to open if :open -t/-b/-w is used without URL. Use
# `about:blank` for a blank page.
c.url.default_page = "https://startpage.com/"

# The format to use for the window title. The following placeholders are
# defined:
#   * `{perc}`: The percentage as a string like `[10%]`.
#   * `{perc_raw}`: The raw percentage, e.g. `10`
#   * `{title}`: The title of the current web page
#   * `{title_sep}`: The string ` - ` if a title is set, empty otherwise.
#   * `{id}`: The internal window ID of this window.
#   * `{scroll_pos}`: The page scroll position.
#   * `{host}`: The host of the current web page.
#   * `{backend}`: Either ''webkit'' or ''webengine''
#   * `{private}` : Indicates when private mode is enabled.
c.window.title_format = "{private}{perc}{title}{title_sep}qutebrowser"

# Downloads 
c.downloads.location.directory = '$HOME/Downloads'
c.downloads.remove_finished = 1000

# Browser User-Agent
c.content.headers.user_agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36'
c.content.headers.accept_language = 'en-US,en;q=0.5'
c.content.headers.do_not_track = True

# Adblock
if path.exists("~/.blocked-hosts") :
	c.content.host_blocking.lists.append( "~/.blocked-hosts")




