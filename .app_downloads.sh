#!/bin/sh

if [ "$(uname)" == 'Darwin'  ]; then

# Chrome
open 'https://www.google.co.uk/chrome/browser/desktop/index.html'

# Slack
open 'https://slack.com/apps'

# 1Password
open 'https://agilebits.com/onepassword/mac'

# iTerm2
open 'https://www.iterm2.com'

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
