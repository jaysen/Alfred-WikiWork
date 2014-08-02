Alfred-LogToWikidPad-And-DayOne
===============================

An Alfred Workflow to Log to pre-formatted Wikidpad DayPage and MonthPage, as well as create an entry in DayOne using (properly configured) dayone cli. The workflow makes use of Bash Scripts to access Wikidpad and Dayone.

Wikidpad is an opensource (BSD Licensed) multiplatform (WxPython based) personal wiki notepad - extensible in Python and full featured (see http://wikidpad.sourceforge.net/)

DayOne is a proprietary non free Journal App for OS-X and iOS. See http://dayoneapp.com/)
To install and configure the DayOne CLI, necessary for use with this script, see http://dayoneapp.com/tools/cli-man/


Installation
------------
Download the alfredworkflow file, double click to add as an Alfred workflow


WikidPad Entries
----------------
This Alfred Script works for Wikidpad using the plain text file storage option, 
and using the following Journal Pages formats:

* Monthly Journal Page of the form YYYYMM.wiki
* Daily Journal Page of the form YYYYMMDD.wiki

If the above pages do not exist, they are created and the entry log is appended to the end of the files.


DayOne Entries
--------------
This Alfred script will also create a log of the entry in DayOne using DayOne-CLI (http://dayoneapp.com/tools/cli-man/)


Invocation
----------
Press the Alfred shortcut key/s and then type "log" followed by a space then the entry you want to create.