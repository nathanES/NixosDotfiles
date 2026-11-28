# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# Accept cookies - Possible values : 'all', 'never'
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')

# Value to send in the `Accept-Language` header.
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')

# User agent to send
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:149.0) Gecko/20100101 Firefox/149.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version_short} Safari/{webkit_version}', 'https://gitlab.gnome.org/*')

# Load images automatically in web pages.
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow locally loaded documents to access remote URLs.
config.set('content.local_content_can_access_remote_urls', True, 'file:///home/nathan/.local/share/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False, 'file:///home/nathan/.local/share/qutebrowser/userscripts/*')

c.url.searchengines = {
        'DEFAULT': 'https://google.com/search?q={}',
        '!aw': 'https://wiki.archlinux.org/?search={}',
        '!yt': 'https://www.youtube.com/results?search_query={}',
        '!ytm': 'https://music.youtube.com/search?q={}',
        '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
}
