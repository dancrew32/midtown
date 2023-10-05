import os
import browser

# Check site
b = browser.new('midtown', headless=True)
url = 'http://midtownterrace.org/'
b.get(url)
dom = b.dom()
image = dom.find('.container .row img:first').attr('src')
b.done()

# Check for banner diff
store = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'image.txt')
with open(store, 'r') as f:
    previous_image = f.read().strip()
if image != previous_image:
    full_image = f"{url}{image}"
    os.system(f'/opt/homebrew/bin/terminal-notifier -message "Click to view" -title "Midtown Banner Change" -open "{url}" -contentImage "{full_image}"')
with open(store, 'w') as f:
    f.write(image)

