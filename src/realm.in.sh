#\\include config.shh
#!/bin/bash
#
# realm - World of Warcraft© realmlist changer and starter
#
# Copyright (C) 2012  Björn Bidar
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
REALM_VERSION=@VER@
REALM_REVISION=@git_rev@
APPNAME=$(basename $0999) # get plain name of $0
CONFDIR=${XDG_CONFIG_HOME:=$HOME/.config}/realm # set confdir ( only prevent some errors on systems where $XDG_DATA_HOME is not set)
APPLICATION_XDG_SHARE=${XDG_DATA_HOME:=$HOME/.local/share}/realm # set dir for application dara
servercfgdir=$APPLICATION_XDG_SHARE/servers # set server rcfg content dir ( realm content file gen2)
appdir=$CONFDIR/applications # set  application rcfg content dir
rcfg_cache=${XDG_CACHE_HOME:=$HOME/.cache}/realm/content # set rcfg_cache  cache

server_related_cache=${XDG_CACHE_HOME:-$HOME/.cache}/realm/server_related

#\\!mac_os_xexe="World of Warcraft.app"
#\\!mac_os_xreadonly exe


setlang () { # set displayed messages
    case $lang in
	en)
	    exit='exit'
	    conf='settings'
	    exitn="To quit enter $exit."
	    # 	answer='y'
	    lng='language'
	    MSG='settings or start Wow with...'
	    MSG_S="Enter name or number to select server or option:" #, or choose $conf with 1:"
	    #MSG_S2='To select the server enter servername.'
	    MSG_SER="No or wrong input please give right input oder exit with \'$exit\' "
	    MSGR='Wow starts....'
	    MSGCL='set language'
	    RESML='Pleas choose your language.'
	    RESEND='Finish'
	    GAMECFGM='set up WoW version'
	    GAMEDIRL='Gamedir'
	    GAMEDIRLS='Manage game versions'
	    GAMEDIRLW='set WoW version,(you can have more than one)'
	    #GAMEDIRLW1='To set up a new version enter 1'
	    GAMEDIRLW2='These are the installed WoW versions to change one enter the name off the version!'
	    GAMEDIRLW3='To registrade a WoW version with realm enter 1.'
	    GAMEDIRLNA='New App'
	    GAMEDIRLL="Please enter the gamedir path, please add a ' at the end and the beginning"
	    GAMEDIRVERL0='Please select the wow version.'
	    GAMEDIRVERL='Please enter the version of the entered Wow installisation (only the 3 first letters !)'
	    #\\!WINE	PREFIXL='Please enter prefixdir, for the WoW version ( enter nothing if the defaul prefix $HOME/.wine is used)'
	    SERVEROFMSG="It seems that the server is offline, go to server website or write an e-mail to $owner at $ownermail for info."
	    WELCOME="Wow server selecter and starter $REALM_VERSION"
	    BACK='back'
	    BACKN='To go back enter back'
	    CFGER='Server information file inorrect (incomplete), please contact the noun for help'
	    CFGIO='Owner of the file'
	    CFGIOM='Mail address of the owner'
	    CFGIS='servername'
	    CFGIER='input incomplete'
	    CFGIERF='Wrong input given, server or aplication  not exist/regestred !'
	    CFGEER="The entered WoW version is already rigestred in Realm overwrite?, if overwrite enter $answer"
	    CFGEDITL='Enter a Number to change a value'
	    WRONGL='Entered language not exist'
	    TEMSG='Enter r to go back or press q key to quit realm'
	    TEMSG1='Press any key to quit realm'
	    LOGNOTE='To show wow application log press l'
	    
	    ;;
	de)
	    exit='Beenden'
	    conf='Einstellungen'
	    exitn="Um realm zu beenden bitte '$exit' eingeben."
	    # 	answer='j'
	    lng='Sprache'
	    MSG='Einstellungen oder Wow starten mit...'
	    MSG_S="Namen oder Nummber eingeben um Server oder Option auszuwälen:"  #oder wähle 1 für $conf: "
	    #MSG_S2='Um zu Server auszuwälen Servername eigeben.'
	    MSG_SER="Kein oder falscher server eingeben bitte richtige eingabe machen oder mit \`$exit\` schließen"
	    MSGR='Wow wird gestartet'
	    MSGCL='Sprache einstellen'
	    RESML='Bitte wählen sie ihre Sprache'
	    RESEND='Fertig'
	    GAMECFGM='Wow Version eintragen'
	    GAMEDIRL='Spielpfad'
	    GAMEDIRLS='Wow Versionen Verwalten'
	    GAMEDIRLW='WoW version einstellen (du kannst mehr als eine WoW Version haben)'
	    GAMEDIRLW2='Dies sind die Installierten WoW Versionen um die Daten einer Version zu ändern bitte den Namen eingeben!'
	    #GAMEDIRLW1='Um einen Version einzutragen bitte 1 eingeben'
	    GAMEDIRLNA='Neue Anwendung'
	    GAMEDIRLL='bitte geben sie den Pfad des Spieldordners ein, die Eingabe solte dabei in '' gefast sein'
	    GAMEDIRVERL0='Bitte wählen sie die WoW Version  aus.'
	    GAMEDIRVERL='Bitte geben sie die version der WoW installation an (nur die 3 ersten Zeichen !)'
	    #\\!WINE	PREFIXL='Bitte geben sie den Pfad der Pefixes für die WoW Version ein (wenn Standard Prefix $HOME/.wine , genutzt wird Eingabe bitte leer lassen)'
	    SERVEROFMSG="Es scheint als sei der Server offline, für Infos auf Serverwebsite gehen oder ein E-mail zu $owner an $ownermail"
	    WELCOME="Wow Server selecter und starter $REALM_VERSION"
	    BACK='zurück'
	    BACKN='Um zurück zu gehen geben sie dies ein.'
	    CFGER='Server Informations Datei Fehlerhaft (unvollständig), bitte kontaktieren sie den Urheber für Hilfe'
	    CFGIO='Urheber der Datei'
	    CFGIOM='E-mail Adresse des Urhebers'
	    SFGIS='Servername'
	    CFGIER='eingabe unvollständig'
	    CFGIERF='Falsche Eingabe, Server oder Anwendung  nicht exestierend/regestriert.'
	    CFGEER="WoW Version bereits in Realm registriert alte Registrierung überschreiben?, um zu bestätigen $answer eintippen."
	    # 	CFGEERA="Antwort war nicht $answer Registrierung nicht überschrieben"
	    CFGEDIT='Gebe ein Zahl um einen Wert zu ändern'
	    WRONGL='Eingebene Sprache exestiert nicht'
	    TEMSG='q Taste drücken um realm zu beenden, oder r drücken um zum Menü zurück zu kehren'
	    TEMSG1='Beliebige Taste drücken um realm zu beenden'
	    LOGNOTE='Um WoW Anwendungslog an zu sehen l drücken.'
	    ;;
	*) if [ $APPLICATION_XDG_SHARE/lang/$lang.rmo ] ; then
            . $APPLICATION_XDG_SHARE/lang/$lang.rmo
	    else
            echo '$lang not set or no lang file found for lang  please edit $lang to an existing language file'; exit 1
	    fi
	    ;;
    esac
}

#\\ifdef WINE
set_wine_ver () { # no comment
    if [ ! $1 ] ; then # unset wine version
	export LD_LIBRARY_PATH=
	export WINESERVER=
	export WINELOADER=
	export WINEDLLPATH=
	export BINPATH=
    else  # use wine version from path given by "$1"
	export LD_LIBRARY_PATH="$1"/lib:$LD_LIBRARY_PATH
	export WINSERVER="$1"/bin/wineserver
	export WINELOADER="$1"/bin/wine
	export WINEDLLPATH="$1"/lib/wine
	export BINPATH="$1"/bin/
    fi
}

check_wineserver() {
    if ps ax | grep wineserver | grep -vq grep ; then
	echo --------------------------------------------------------------------------------
	echo "An other wineserver is running,"
	echo "kill him (any other procces that run on wineserver will killed too)? (y|n)"
	echo --------------------------------------------------------------------------------
	read answer
	if [ $answer = y ] ; then
	    "$BINPATH"wineboot -e
	    pkill -U $UID  wineserver
	    return 0
	else
	    tmp_msg="wineserver was not killed"
	    return 1
	fi
    fi
}

#\\endif

#\\!mac_os_xxterm() { # wrapper for mac os terminal application
#\\!mac_os_x open /Applications/Utilities/Terminal.app $@
#\\!mac_os_x}


print_err() {
    echo --------------------------------------------------------------------------------
    echo "$1" >&2
    echo --------------------------------------------------------------------------------
    if [ ! -z realm_term ] ; then
	read err
	exit 1
    fi
}

reset_run_vars() { # reset vars used vars (only where vars with wrong content give errors)
    old_ifs=$IFS
    IFS=:
    for reset_var in $run_vars ; do
	set $reset_var=
    done
    IFS=$old_ifs
}
test_server_file () { # test if all needed server vars exist
    if [  -z $serverver  -o  -z $realm  -o \( -z $update  -o -z "$servername"  ]; then
	return 1
    fi
}

test_server_status () { # test if server is offline
    ping -w 2 -c 1 $realm > /dev/null 2>&1
    # if ping returns $(($? >= 2)) than server is offline , if it dosnt accepts our packets ping returns only 1
    if [ $? -ge 2 ] ; then
	return 1 # so return server is offline (false)
    else
	return 0 # return server is online (true)
    fi
    
}
#\\ifdef cataclysm
sync_rcfg_content() { # sync_rcfg_content $sever_launcher (testserver_launcher.exe, testserver_Wow.exe) with realm content cache
    local var
    for var in "$server_launcher" "$server_wowclient" ; do
	if [ ! -z "$var" ] ; then
	    if [ "$var" -nt "$rcfg_cache"/"`basename $var`" ] ; then
		mkdir -p $rcfg_cache/$selected_server
		wget $wget_download_options $var --output-document=$rcfg_cache/$selected_server/"`basename $var`" || return 1
	    fi
	fi
    done
}
#\\endif

get_wtf_var() { # get gamelang from Config.wtf in $GAMEDIR
    if [ -e "$GAMEDIR"/WTF/[Cc]onfig.wtf ] ; then
	return_var="`cat "$GAMEDIR"/WTF/[Cc]onfig.wtf | grep -i "[SsEeTt] $1" | sed "s/[Ss][Ee][Tt] $1//"`" && \
	    echo "$return_var"
    fi
    
    return $?
}

update_lang () { # update realms lang
    cp $CONFDIR/realm.conf $CONFDIR/realm.old
    rm $CONFDIR/realm.conf
    cp  $CONFDIR/defaults/realm.conf $CONFDIR/realm.conf
    cat >> $CONFDIR/realm.conf <<END
lang=$lang
END
    setlang
}

server_menu () { # display server selecter
    local content_size content_raw cfg_file content
    if  [ -z $number ] ; then # if servers names are cached do nothing
	number=${number:=0}
	for cfg_file in $servercfgdir/*.rcfg ; do # cache server name
	    unset servername realm update serverver owner ownermail cfg_ver server_launcher server_wowclient
	    . $cfg_file
	    test_server_file && \
		content[$number]="$servername" && \
		number=$(( $number + 1 ))
	done
	# get all installed servers and prevent that servers  with servers.rcfg~ are inclued in $applist
	content_raw=( `ls $servercfgdir | grep -v \~ | grep rcfg`)
	local content_size=$(( ${#content[*]} - 1 )) # get how many servers where scanned
	content[$content_size]="$conf"
	content[$(( $content_size + 1 ))]="$exit"
	content_raw[$(( ${#content_raw[*]} - 1 ))]=settings
	content_raw[${#content_raw[*]}]=exit
    fi
    
    #\\!DEBUG echo ${content[*]}
    #\\!DEBUG echo ${#content[*]}
    cat <<LIST
$WELCOME
--------------------------------------------------------------------------------
$MSG_S
--------------------------------------------------------------------------------

LIST
    for ((no=0; no <= $(( ${#content[*]} - 1 )); no++)) ; do
	echo $no ${content[$no]}
    done
    unset no
    cat <<LIST
--------------------------------------------------------------------------------
LIST
    # $exitn
    
    read input  # 1. $conf
    #\\!DEBUG echo $input
    #\\!DEBUG echo ${content[$run]}
    for ((run=${#content[*]}; run >= 0;run--)) ; do
	if [ "$input" = "${content[$run]}" ] || [ "$input" = $run ]  > /dev/null 2>&1 ; then
	    #       unset serverlist
	    #       unset serverlist_cfg
	    #       unset commands_l
	    case ${content_raw[$run]} in
		*.rcfg)
		    return_stat=0
		    selected_server=$servercfgdir/${content_raw[$run]}
		    . $selected_server
		    #	 test_server_file
		  # 	 if [ $filestat = 1 ] > /dev/null 2>&1 ; then
		    # 	    print_err "$CFGER"
		    # 	 fi
		    
		    break 2
		    ;;
              *) ${content_raw[$run]} ;;
	    esac
	fi
    done
    return 1
}

edit_realmlist () { # edit realm list of selected wow version
    local dest
    case $wowver in
	3.*|4.*) dest=$GAMEDIR/Data/$GAME_LANG ;;
	*) dest=$GAMEDIR ;;
    esac
    echo "set realmlist $realm">"$dest/realmlist.wtf"
    echo "set patchlist $update">>"$dest/realmlist.wtf"
}

print_log () {
    echo --------------------------------------------------------------------------------
    echo \# "$APPNAME : print_log"                                                     \#
    echo --------------------------------------------------------------------------------
    cat $CONFDIR/logs/wow$serverver_$dt.log
    echo --------------------------------------------------------------------------------
    echo "$TEMSG"
    echo --------------------------------------------------------------------------------
    read next
    if [ $next = r ] > /dev/null 2>&1 ; then
	reset_run_vars
	clear
	continue 2 # go back to servmenu
    elif [ $next = q ]  > /dev/null 2>&1 ; then
	exit $? #return $?
    fi
}
init_app () { # test something and load variables of WoW version
    if [ -e $appdir/wow$serverver.rcfg ]; then
	. $appdir/wow$serverver.rcfg
#\\ifdef cataclysm
	case $wowver in
	    4.*)
		sync_rcfg_content || tmp_msg=stub; return 1
		if [ -z "$server_wowclient"  ] ; then
		    ln -s $rcfg_cache/"`basename $server_wowclient $GAMEDIR/$server_wowclient`"
		    exe="$server_wowclient"
		fi
		;;
	    *)
		#\\endif
		if ! test_server_status ; then
		    setlang
		    tmp_msg="$SERVEROFMSG"
		    return 1
		fi
#\\ifdef cataclysm
		;;
	esac
#\\endif
	if [ $options = -v ] > /dev/null 2>&1 ; then
	    echo "gamedir=$GAMEDIR"
	    echo "exe=$exe"
	    echo "wowver=$wowver"
#\\ifdef WINE
	    echo "WINEVER=${WINEPATH:=default: system installed}"
#\\endif
	fi
#\\ifdef WINE
	export WINEPREFIX=${PREFIX:-$HOME/.wine}
	
	if [ -z $BIN ] ; then
	    BIN=wine
	fi
	if [ ! -z "$WINEPATH" ] ; then
	    check_wineserver || return 1
	    set_wine_ver "$WINEPATH"
	fi
	if [ -z $WINEDEBUG ]; then
	    export WINEDEBUG=fixme-all
	fi
	if [  -n "$WINE_DESKTOP" ] ; then
	    [ "$WINE_DESKTOP" = 1 ] && WINE_DESKTOP='800x600'
	    wine_args="explorer /desktop=Wow$$,$WINE_DESKTOP"
	fi
#\\endif
	clear_cache
	case $CACHE_ACCOUNT_NAME in
	    1|true)
		if [ -e "$server_related_cache/$selected_server" ] ; then
		    . "$server_related_cache/$selected_server"
		    if [ -n "$USER_ACCOUNT_NAME" ] ; then
			if [ -e "$GAMEDIR"/WTF/[Cc]onfig.wtf ] ; then
              del_var accountName "$GAMEDIR"/WTF/[Cc]onfig.wtf
              echo "set accountName $USER_ACCOUNT_NAME" >> "$GAMEDIR"/WTF/[Cc]onfig.wtf
			fi
		    fi
		fi
	esac
    else
	tmp_msg="no WoW version for the $serverver found"
	return 1
    fi
}

clear_cache () { # clears cache/WDB directory of WoW Version
    case $wowver in
	0.*|1.*) local game_cache=""$GAMEDIR"/WDB" ;;
	2.*|3.*|4.*) local game_cache=""$GAMEDIR"/Cache" ;;
    esac
    rm -r "$game_cache" > /dev/null 2>&1
}
execute_app () {
    dt=`date +%d_%m_%Y_%H_%M`
    cat > $CONFDIR/logs/wow$serverver_$dt.log <<END
# started app info :
# name : `basename "$exe"`
# ver : $wowver
#\\ifdef WINE
# wine bin : `basename $BIN`
# wine ver : `$BIN --version`
#\\endif
END
    cd "$GAMEDIR"
    
    #\\!lin_wow_client sh -c "$exe >> $CONFDIR/logs/wow$serverver_$dt.log 2>&1 ""   & # hope they'll release the linux client some day :D
    #\\!WINE  sh -c "env WINEPREFIX=$WINEPREFIX "$BINPATH"$BIN $wine_args \"$exe\" >> $CONFDIR/logs/wow$serverver_$dt.log 2>&1" &
    #\\!mac_os_xsh -c "open $exe  >> $CONFDIR/logs/wow$serverver_$dt.log 2>&1 " &
    #\\!WINE  test `basename "$exe"` = WoWMe.exe && exe=WoW.exe
    #\\!mingw exec "$exe  >> $CONFDIR/logs/wow$serverver_$dt.log 2>&1 " &
}
del_var () { # del variable in file
    file="$1"
    sed -i "/$2/d" $file
}

end_app() {
    if [ ! -z "$server_wowclient" ] ; then
	rm "$GAMEDIR/$server_wowclient"
    fi
    case $CACHE_ACCOUNT_NAME in
	1|true)
	    USER_ACCOUNT_NAME="`get_wtf_var accountName`"  && \
		echo "USER_ACCOUNT_NAME=$USER_ACCOUNT_NAME" > "$server_related_cache"/$selected_server
	    ;;
    esac
 #\\ifdef WINE
    "$BINPATH"wineboot -e
    set_wine_ver
    unset BIN
    unset WINEPATH
#\\endif
  
}
cfg_info () { # display info off cfg files
    if [ $# -lt 1 ]; then
	echo "$CFGIER (no server or app)" >&2
	return 1
	
	
	#case $1 in
	# s)
    elif [  -e $servercfgdir/$1.rcfg ]; then
	#echo "$CFGIERF"
	#exit 1
	
	. $servercfgdir/$1.rcfg
	echo "$CFGIS : $servername"
	echo "realmlist: $realm"
	echo "Update$CFGIS: $update"
	echo "Serverversion: $serverver"
	echo "$CFGIO : $owner"
	echo "$CFGIOM : $ownermail"
	#;;
	#a)
    elif [ -e $appdir/$1.rcfg ]; then
	#echo "$CFGIERF"
	#return 1
	#fi
	. $appdir/$1.rcfg
	cat <<END
WoW Version = $wowver
$GAMEDIRL   = $GAMEDIR
#\\ifdef WINE
Prefix	    = `echo ${PREFIX:="default : $HOME/.wine"}`
exe         = $exe
BIN         = `echo ${BIN:="default : wine"}`
BINVER      = `${BIN:=wine} --version`
#\\endif
END
	#;;
	#esac
    else
	echo "$CFGIERF" >&2
	return 1
    fi
    
}

gen_app_cfg () { # generate application config file
    case $1 in
	c)
	    cat > $appdir/wow$2.rcfg <<END
appname=World\ of\ Warcraft\ $2
GAMEDIR=$3
exe=$4
wowver=$2
#\\!WINE PREFIX=$5
cfg_ver=0.3
END
	    return $?
	    ;;
	u)
	    if [ -e $appdir/wow$2.rcfg ]; then
		echo "$CFGEER, y|n"
		read answercfg
		if [ ! $answercfg = [Yy] ]; then
		    echo "$CFGEERA" >&2
		    return 1
		fi
	    fi
	    clear
	    echo --------------------------------------------------------------------------------
	    echo \# "$GAMECFGM"								\#
	    echo --------------------------------------------------------------------------------
	    echo "$GAMEDIRVERL0"
	    echo --------------------------------------------------------------------------------
	    select addon in 'Classic (1.21)' 'Burning Crusade (2.4.3)' 'Wrath Of The Lich King (3.3.3)' $BACK other ; do
            case $addon in
		'Classic (1.21)') GAMEDIRVER=1.21 ; break ;;
		'Burning Crusade (2.4.3)') GAMEDIRVER=2.4.3 ; break ;;
		'Wrath Of The Lich King (3.3.3)') GAMEDIRVER=3.3.3 ;  break ;;
		'Cataclysm 4.x') GAMEDIRVER=4.x; break ;;
		other)
            echo "$GAMEDIRVERL"
            echo "$BACKN"
            read GAMEDIRVER
            if [ $GAMEDIRVER = $BACK ]; then
		return
            fi
            break
            ;;
		$BACK) continue 3 || return $?  ;;
            esac
	    done
	    #\\!WINE      exe='Wow.exe'
	    #\\!mac_os_x	exe="World of Warcraft.app"
	    #\\!wow_lin_client	exe=WowClient
	    
	    echo --------------------------------------------------------------------------------
	    echo "$GAMEDIRLL"
	    echo --------------------------------------------------------------------------------
	    read GAMEDIR
	    echo --------------------------------------------------------------------------------
	    echo "$PREFIXL"
	    echo --------------------------------------------------------------------------------
	    read PREFIX
	    cat > $appdir/wow$GAMEDIRVER.rcfg <<END
appname=World\ of\ Warcraft\ $2
GAMEDIR=$GAMEDIR
exe=$exe
wowver=$GAMEDIRVER
#\\ifdef WINE
PREFIX=$PREFIX
#\\endif
cfg_ver=0.3
END
	    
	    return $?
	    ;;
    esac
    
}

gen_conf () { # generates a new configuraten file
    lang=en
    mkdir -p $rcfg_cache
    mkdir -p $servercfgdir
    mkdir -p $appdir
    mkdir -p $APPLICATION_XDG_SHARE/lang
    setlang
    cd $CONFDIR
    echo "$APPNAME (re-)conf"
    mv $CONFDIR/realm.conf $CONFDIR/realm.conf.old /dev/null 2>&1
    echo "$RESML"
    select t_lang in English Deutsch `ls $APPLICATION_XDG_SHARE/lang | grep -v \~ | grep rmo |  sed 's/.rmo/ /g' ` $exit ; do
    case t_lang in
	English)
            lang=en
            update_lang
            break
	    ;;
	#           enUS)
	# 	   update_lang
	# 	   ;;
	Deutsch)
            lang=de
            update_lang
            break
	    ;;
	$exit) exit ;;
	*)
            if [ -e $APPLICATION_XDG_SHARE/lang/$lang.rmo ] ; then
		update_lang
		break
            else
		echo "$WRONGL"
		continue
            fi
	    ;;
    esac
    done
    gen_app_cfg u
    echo "$RESEND"
    exit 0
}

settings () { # settings dialog
    PS3=""
    clear
    echo --------------------------------------------------------------------------------
    echo \# "$APPNAME : $conf"                                                	\#
    echo --------------------------------------------------------------------------------
    select ic in "$MSGCL" "$GAMEDIRLS" "$BACK" "$exit" ; do
    case $ic in
	"$MSGCL") # changes the language of realns Wow version
            clear
            echo --------------------------------------------------------------------------------
            echo \# "$APPNAME: $MSGCL"                                                        \#
            echo --------------------------------------------------------------------------------
            echo "$LNOTE"
            # oldlang=$lang;
            select t_lang in English Deutsch `ls $APPLICATION_XDG_SHARE/lang | grep -v \~ | grep rmo |  sed 's/.rmo/ /g' ` $exit ; do
            #\\!DEBUG echo $t_lang
            case t_lang in
		English)
		    lang=en
		    update_lang
		    break
		    ;;
		#           enUS)
		# 	   update_lang
		# 	   ;;
		Deutsch)
		    lang=de
		    update_lang
		    break
		    ;;
		$exit) exit ;;
		*)
              if [ -e $APPLICATION_XDG_SHARE/lang/$lang.rmo ] ; then
                  update_lang
                  break
              else
                  echo "$WRONGL"
                  continue
              fi
              ;;
            esac
            done
	    ;;
	"$GAMEDIRLS")
            clear
            echo --------------------------------------------------------------------------------
            echo \# "$APPNAME: $GAMEDIRLS"                                          	   \#
            echo --------------------------------------------------------------------------------
            # get all installed rcfg apps , cut .rcfg from their names and prevent that apps with app.rcfg~ are inclued in $applist
            local applist=( `ls $appdir | grep -v \~ | grep rcfg | sed 's/.rcfg/ /g'` )
            # same as before but dont cut .rcfg from their names
            local applist_cfg=( `ls $appdir | grep -v \~ | grep rcfg` )
            # get how many apps where scanned
            local applist_size=${#applist[*]}
            
            # add new app ($GAMEDIRLNA) option to applist
        
            local applist[$applist_size]="$GAMEDIRLNA"
            
            # add back  ($BACK) option to applist
            local applist[$(( $applist_size + 1 ))]="$BACK"
            #local commands_l=( ${applist[*]} gen $BACK )
            local commands_run=( ${applist_cfg[*]} 'gen_app_cfg u' 'settings ; return' )
	    cat <<LIST
$GAMEDIRLW
--------------------------------------------------------------------------------
LIST
        
            for ((g_no=0; g_no <= $(( ${#applist[*]} - 1 )); g_no++)) ; do # list all long names of scaned content
		echo $g_no ${applist[$g_no]}
            done
            
	    cat <<LIST

--------------------------------------------------------------------------------
LIST
            # $GAMEDIRLW1
	    
            #last=3
	    read "input"
	    for ((run=0; run <= $(( ${#applist[*]} - 1 )); run++)) ; do
		if [ $input = "${applist[$run]}" -o $input = $run ]  > /dev/null 2>&1 ; then
		    unset applist
		    unset applist_cfg
		    case ${commands_run[$run]} in
			*.rcfg)
			    clear
			    echo --------------------------------------------------------------------------------
			    echo \# "$APPNAME : Wow Version Info"                                     	     \#
			    echo --------------------------------------------------------------------------------
			    cfg_info ${applist[$run]} # post wow version info
			    echo --------------------------------------------------------------------------------
                # case wow version is greater than 3 add $(GAMEDIRL) to $r_input
#\\ifdef WINE
			    case $wowver in
                    3.*|4.*)  r_input=( Version $GAMEDIRL $lng Prefix $BACK ) ;;
				*)  r_input=( Version $GAMEDIRL  Prefix $BACK ) ;;
#\\else
				case $wowver in
				    3.*|4.*)  	r_input=( Version $GAMEDIRL $lng $BACK ) ;;
				    *)  	r_input=( Version $GAMEDIRL  $BACK ) ;;
#\\endif
				esac
				echo "$CFGEDITL"
				for ((i_no=0;  i_no <= $(( ${#r_input[*]} - 1 )); i_no++)); do
				    echo "$i_no ${r_input[$i_no]}"
				done
				echo --------------------------------------------------------------------------------
				read input
				for (( r_input_n=0; i_input_n <= $( ${#r_input[*]} - 1 ); r_input_n++)) ; do
				    if [ $input = ${r_input[$r_input_n]} -o $input = $r_input_n ] ; then
					output=${r_input[$r_input_n]}
					break
				    fi
				done
				
				case $output in
				    Version)
					echo "$GAMEDIRVERL"
					read GAMEDIRVER
					del_var $appdir/${commands_run[$run]} wowver
					echo "wowver=$GAMEDIRVER" >> $appdir/${commands_run[$run]}
					break 2
					;;
				    $GAMEDIRVERL)
					echo "$GAMEDIRLL"
					old_gamedir="$GAMEDIR"
					read GAMEDIR
					del_var $appdir/${commands_run[$run]} GAMEDIR
					echo "GAMEDIR=\"$GAMEDIR\"" >> $appdir/${commands_run[$run]}
					;;
				    $lng) echo placeholder ; break 2 ;;
#\\ifdef WINE
				    Prefix)
					echo "$PREFIXL"
					old_PREFIX="$PREFIX"
					read PREFIX
					PREFIX=`echo $PREFIX | sed 's/\\/\\//'`
					del_var $appdir/${commands_run[$run]} PREFIX
					echo "PREFIX=\"$PREFIX\"" >> $appdir/${commands_run[$run]}
					break 2
					;;
#\\endif
				    $BACK) break 3 ;;
				    #*) ;;
				esac
				return $?
				;;
				$BACK) settings ; return $? ;;
				*) ${commands_run[$run]} ;;
			    esac
		fi
            done
            
            # 		if [ $input = 1 ] > /dev/null 2>&1 ; then
            # 		  gen_app_cfg u
            # #		else
            # #		  rename $CONFDIR/realm.conf realm.conf.old
            # #		  echo "PREFIX=$PREFIX">$CONFDIR/realm.conf
            # #		  echo "GAMEDIR=$GAMEDIR">>$CONFDIR/realm.conf
            # #		  echo "lang=$lang">>$CONFDIR/realm.conf
            # #		  break
            #
            # 		elif [ $input = $BACK ] > /dev/null 2>&1; then
            # 		  settings
            # 		  return $?
            # 		fi
            #
          ;;
          
          
			"$BACK") clear ; break $last ;;
			"$exit") exit 0 ;;
        esac
		    done
    }
if [ $1 = -n  ]  > /dev/null 2>&1 ; then
    gen_conf
elif [ ! -e $CONFDIR/realm.conf ]; then
    echo "realm.conf don't exist in $CONFIGDIR, please start realm with -n to setup a new one" >&2
      exit 1
else
    . $CONFDIR/realm.conf
fi


case $1 in
    *.rcfg) # if input is a rcfg file display info
        if [ ! -z $realm_term ] ; then
            true
            
        elif [ $TERM = dumb ] ; then
            declare -x realm_term=1 && exec xterm -title $APPNAME -e $HOME/bin/$APPNAME "$@" ; exit 0
        fi
        setlang
        if [ ! -z $realm_term ] ; then
            echo --------------------------------------------------------------------------------
            echo \# "$APPNAME : rcfg file info"                                                 \#
            echo --------------------------------------------------------------------------------
        fi
        cfg_info  `basename $1 | sed 's/.rcfg/ /g'`
        if [ ! -z $realm_term ]  ; then
            echo --------------------------------------------------------------------------------
            echo "$TEMSG1"
            echo --------------------------------------------------------------------------------
            read a
        fi
	;;
    # info output
    --status) echo "$APPNAME $REALM_VERSION:${REALM_REVISION:=0}" ; echo "Language: $lang" ; exit 0 ;; # the gamedir of prefix is now in 'cfg_info' because the multi application support
    --version) echo "$REALM_VERSION:${REALM_REVISION:=0}" ;;
    --revision) echo $REALM_REVISION ;;
    -s|--server)
        if  cfg_info "$2" > /dev/null 2>&1 ; then
            #   . $servercfgdir/$1.rcfg
            init_app && \
		edit_realmlist && \
		execute_app && \
		end_app
            if [ !$? = 0 -o ! -z "$tmp_msg" ] ; then
		if [ ! -z "$tmp_msg"  ] ; then
		    echo "$tmp_msg" >&2
		fi
		exit $?
            fi
        else
            echo "Error occured while loading server file" >&2
        fi
	;;
    # other options
    --init) # create needed application directorys
        mkdir -p $rcfg_cache
        mkdir -p $servercfgdir
        mkdir -p $appdir
        mkdir -p $APPLICATION_XDG_SHARE/lang
	;;
      #\\!mac_os_x -G|--open-gamedir) setlang && cfg_info $2 > /dev/null && open "$GAMEDIR" ;;
    #\\!mingw -G|--open-gamedir) setlang && cfg_info $2 > /dev/null && explorer "$GAMEDIR" ;;
    #\\!unix -G|--open-gamedir) setlang && cfg_info $2 > /dev/null && xdg-open "$GAMEDIR" ;;
    --xterm|--term|--window) declare -x realm_term=1 && exec xterm -fg white -bg black -title $APPNAME -e `which $0 || echo $0` ; exit 0 ;;
      -n) gen_conf ;;
    -S|--conf|--settings) setlang && settings ;;
    --cfg-info| --app-info) setlang ; cfg_info  $2 ;;
    cmd) setlang ; "$2" $3 ;;
    -*) : ;;
    # start realm gui
    *)
        test "$TERM" = "dumb" && exec realm --window && exit $? # run realm in window if is not runned from terminal
        setlang
        #server_menu
        main_ext=1
        while test "$main_ext" != ""
        do
            clear
            while ! server_menu ; do 	# run server_menu until a server is selected
		clear			# if no or wrong content selected clear sreen
            done
            init_app
          if [ ! $? = 0 ] > /dev/null 2>&1 ; then
              echo --------------------------------------------------------------------------------
              echo "$tmp_msg" >&2
            echo --------------------------------------------------------------------------------
            read err_p
            continue
          fi
          edit_realmlist
          execute_app
          end_app
          run_vars=serverver:dt:wowver:exe:server_launcher:server_wowclient:tmp_msg
          if [ ! -z $realm_term ] ; then
              echo --------------------------------------------------------------------------------
            echo "$TEMSG"
            echo "$LOGNOTE"
            echo --------------------------------------------------------------------------------
            # {
            #  }
            ext=1
            while [ ! $ext = "" ] ; do
		read last
		if [ $last = r ] > /dev/null 2>&1 ; then
                    pkill `basename "$exe"`
                    reset_run_vars
                    ext=
                    clear
                    continue 2
		elif [ $last = l ] > /dev/null 2>&1 ; then
                    pkill `basename "$exe"`
                    print_log
		elif [ $last = q ] > /dev/null 2>&1 ; then
                    pkill `basename "$exe"`
                    exit $?
		fi
            done
            #   }
            
          fi
          main_ext=
        done
	;;
esac

