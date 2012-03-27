#!/bin/bash
#
# realm - World of Warcraft© realmlist changer and starter setup
#
# Copyright (C) 2010  Björn Bidar
#
# This is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
#
# changelog:
# 0.9 i nitial release
# 0.9.1 renamed var WOWDIR to GAMEDIR
#       impl.   ver check
# 1.0   update for realm 1.0
# 1.0.1 update for realm 1.2
# 1.02  clear some stuff
ver=1.1
instappver='1.2.4'
instappname=realm
appname=`basename $0 .sh`
basedir=`dirname $0`
setlang () {
  case $realm_inst_lang in
      en)
	SETLANG='please select the language of your wow version:'
	#PS3='enGB (British English) or deDE (German Germany) '
	PREFIXL='please enter prefixdir'
	GAMEDIRL="please enter the gamedir path, please add a ' at the end and the beginning"
	RESML='please enter the langue of your Wow version'
	RESEND='finish'
	COPDES="copy the .desktop file to $DESDIR (a startup file to start this script from the menu)"
	COPSH="copy the script to $HOME/bin"
	WELCOME='Welcome to the realm Wow server selecter and starter setup, this setup will guide you through the configuration process'
	UPOR='already installed update/overwrite? yes or no'
	SETING='starting realm to (re-)generation of the setup file(es)'
	NOTE='Settings file not more compatible, settings must reentered'
	;;
      de)
	SETLANG='bitte wählen sie, die Sprache ihrer Wow Version:'
	#PS3='enGB (British Englisch oder deDE (Deutsch Deutschland) '
	PREFIXL='bitte geben sie den prefix pfad ein'
	GAMEDIRL='bitte geben sie den Pfad des Spieldordners ein, die Eingabe solte dabei in '' gefast sein'
	RESML='bitte geben sie die Sprache ihrer Wow Version ein'
	RESEND='Fertig'
	COPDES="kopiere die .desktop datei nach $DESDIR ( eine startup datei so das dieser script aus dem Menu gestartet werden kann)"
	COPSH="kopiere den script nach $HOME/bin"
	WELCOME='Willkommen zu realm Wow Server selecter und starter setup, dieses setup wird sie durch die einstellungs prozess leiten'
	UPOR='schon installiert aktualisieren/überschreiben? yes or no'
	SETING='Starte Realm zu (neu-)erstellung der einstellungs datei(en)'
	NOTE='Einstellungs Datei nicht mehr Kompatibel, einstellungen müssen neu eintragen werden'
	;;
esac
}


make_des () {
echo "[Desktop Entry]
Categories=Game;RolePlaying;
Comment=Start World of Wacraft with realm
Exec=realm --window
GenericName=MMORPG in Warcraft universe
GenericName[de]=Onlinerollenspiel im Warcraft Universum
Icon=$HOME/.local/share/icons/realm_wow_launcher.png
Name=World of Warcraft
StartupNotify=true
Terminal=0
TerminalOptions=
Type=Application">$HOME/.local/share/applications/realm_wow.desktop
}

make_install() {
cp realm.sh $HOME/bin/$instappname
mkdir -p $HOME/.config/$instappname/servers $HOME/.local/share/$instappname/lang $HOME/.cache/$instappname/content #$HOME/.local/share/$instappname/content
cp servers/*.rcfg $HOME/.config/realm/servers
cp lang/*.rmo $HOME/.local/share/realm/lang
}

cfg_to_rcfg() {
  cd $HOME/.config/realm/servers
  for r_file in *.cfg ; do
    mv $r_file `echo $r_file | sed 's/.cfg//'`.rcfg
  done
  cd ../applications
  for r_file in *.cfg ; do
     mv $r_file `echo $r_file | sed 's/.cfg//'`.rcfg
  done
}

realm_inst_lang=en


if [ ! -e $HOME/bin/realm ]; then
    setlang
    echo "$appname $ver"
    echo "$WELCOME"
    echo "$SETLANG"
    select realm_inst_lang in en de ; {
      setlang
      make_des
      cp launcher.png $HOME/.local/share/icons/realm_wow_launcher.png
      echo "$COPDES"
      make_install
      echo "$COPSH"
      echo "$SETING"
      realm -n
      echo "$RESEND"
      break
  }
else
    setlang
    echo "$appname $ver"
    echo "$WELCOME"
    echo "$SETLANG"
   select realm_inst_lang in en de  ; {
    setlang
    echo "$instappname $UPOR"
    read answer
    if [ \( $answer = yes \) -o \( $answer = y \) -o \( $answer = Yes \) -o \( $answer = Y \) ] > /dev/null 2>&1; then
      make_des
      echo "$COPDES"
      make_install
      echo "$COPSH"
      echo "$SETING"
      realm -n
    else
      exit 1
   fi
  }
fi


