#!/bin/bash
mydate=`date "+%Y-%m-%d-%H-%M-%S-%p"`
echo $mydate | xargs echo -n | xclip -selection clipboard | xvkbd -xsendevent -text "\\C\\Sv" 2>/dev/null
# "xclip -selection clipboard"  is to copy $f1 to clipboard without newline.
# "xvkbd -xsendevent -text "\\C\\Sv" 2>/dev/null"
#	 reads from the clipboard (in plain text),
#	 pipes it back into the clipboard,
#	 then invokes Ctrl+Shift+v to paste it.
exit 0

