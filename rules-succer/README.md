# rules-succer

## Sucks the rules from jlamothe.net/minetest, and puts them in the exact format needed for the 'news' mod.

# Requirements

perl

wget

lynx

# Usage

Put all 3 of these files in your world's root folder, next to ipban.txt, players.sqlite, etc.

Have the ``news``mod installed, so something will be there to SHOW this file.

Run ``bash rules-update-news.sh``.

Your rules will have now been updated with the newest version from the site, you don't even have to restart the server because it pulls fresh from the file every join, no cache.
