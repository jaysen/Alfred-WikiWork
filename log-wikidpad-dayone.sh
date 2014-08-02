#!/bin/bash

## addlogtoday_alfred.sh
# if todays wiki page (YYMMDD.wiki) doesnt exist
# 		creates todays wiki page YYMMDD.wiki 
# 		writes header info
# appends log content $1 / {query} into YYMMDD.wiki
#
# if this months wiki page YYMM.wiki doesnt exist
# 		creates this months wiki page YYMM.wiki
# 		writes header info 
# appends a link to today's entry in YYMM.wiki
#
# Also writes log content ($1 / {query}) using a properly configured dayone cli
#
# by Jaysen Naidoo
# 2010
# v2.0


# REPLACE WITH YOUR OWN WIKIDPAD WIKI LOCATION
wikilocation="$HOME/Dropbox/wikis/JWiki/";

daydate=$(date "+%Y%m%d");
mnthdate=$(date "+%Y%m");

dayheader=$(date "+%A, %B %d, (%Y/%m/%d):");
mnthheader=$(date "+%Y-%m %B:");

daypage=$wikilocation/data/${daydate}.wiki;
mnthpage=$wikilocation/data/${mnthdate}.wiki;

logdatestr=$(date "+[LOG.%Y.%m:%d] %A");
logtimestr=$(date "+%H:%M");

prevmnth=$(date -v -1m "+%Y%m");
postmnth=$(date -v +1m "+%Y%m");

#echo "debugging ............";
#echo ${prevmnth};
#echo ${postmnth};

#### FOR OPENING in editor, we dont want to create the files, just open them if they exist. 
# @TODO: if a date does not exist, loop back and find latest - could go in open latest wiki-log (month and date)


if [ ! -f "$daypage" ]
	then {
		echo "file $filename not found .. creating ${dayheader}";
		echo "+${dayheader}" >> $daypage;
		echo "----------------------------------------------------------------------" >> $daypage;
		echo "[tag:log][tag:dates][icon=date]" >> $daypage;
		echo "----------------------------------------------------------------------" >> $daypage;
		echo "[${mnthdate}]" >> $daypage;
		echo >> $daypage;
		echo ${logdatestr} >> $daypage;
	}
	else {
		echo "$daypage found"
	}
fi;


if [ ! -f "$mnthpage" ]
	then {
		echo "... file $filename not found .. creating ${mnthheader}";
		echo "+${mnthheader}" >> $mnthpage;
		echo "----------------------------------------------------------------------" >> $mnthpage;
		echo "[icon=date][tag:log][tag:personal]" >> $mnthpage;
		echo "[child_sort_order: natural]" >> $mnthpage;
		echo "[alias:LogPage][alias:JournalPage] " >> $mnthpage;
		echo "----------------------------------------------------------------------" >> $mnthpage;
		echo "prev:[${prevmnth}]                                next:[${postmnth}]  " >> $mnthpage;
		echo >> $mnthpage;
		echo >> $mnthpage;
	}
	else {
		echo "$mnthpage found"
	}
fi;

# append log content to daypage:
echo ${logtimestr}: adding .. {query};
echo >> $daypage;
echo ${logtimestr}: {query} >> $daypage;

# append link to daypage on monthpage:
# for now dont worry about repeating .... instead, we'll use a time anchor - to jump to each entry
echo >> $mnthpage
echo "[${daydate}]#${logtimestr}" >> $mnthpage;
echo {query} >> $mnthpage;

# add to dayone
echo {query} | '/usr/local/bin/dayone' new

