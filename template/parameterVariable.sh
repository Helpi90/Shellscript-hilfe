echo ${var1}suffix							= Gibt $var1 aus und fügt "suffix" an.
echo $prefix{var1}							= Gibt "prefix" vor $var1 aus.

echo ${#var1}								= Gibt die Anzahl der Zeichen von $var1 aus.

echo $((51*2))								= Rechnet 51 * 2 aus.
echo $((var1*2))							= Rechnet $var1 * 2 aus.

echo ${var1~}								= Erstes Zeichen eines Strings invertiert ausgeben.
echo ${var1,}								= Erstes Zeichen eines Strings als Kleinbuchstaben ausgeben.
echo ${var1^}								= Erstes Zeichen eines Strings als Großbuchstaben ausgeben.

echo ${var1,,}								= Einen String in nur Kleinbuchstaben ausgeben.
echo ${var1^^}								= Einen String in nur Großbuchstaben ausgeben.
echo ${var1~~}								= Einen String invertiert ausgeben - etwa A anstatt a.

echo ${!H*}									= Alle Variablen ausgeben, die mit "H" beginnen.

echo ${var1:4}								= Inhalt von $var1 ab Zeichen 4 ausgeben.
echo ${var1: -4}							= Inhalt von $var1 ab Zeichen 4 vom Ende an ausgeben. Unbedingt das Leerzeichen beachten.
echo ${var1:4:6}							= Inhalt von $var1 ab Zeichen 4 ausgeben, 6 weitere Zeichen ausgeben.

echo ${var1#string}							= "string" von $var1 in Richtung links nach rechts abziehen.
												Beispiel: "var1=einzeichen", Ausgabe von "echo ${var1#ein}" ist "zeichen".
echo ${var1%string}							= "string" von $var1 in Richtung rechts nach links abziehen.
												Beispiel: "var1=einzeichen", Ausgabe von "echo ${var1%zeichen}" ist "ein".
												Alternativ ginge auch: echo ${var1%z*n} für "von z bis n". Für längstes Auftauchen "%%" anstatt "%" verwenden.
												Selbiges gilt für "#".

cp datei{,.bak}								= Entspricht "cp datei datei.bak"
cp datei{.bak,}								= Entspricht "cp datei.bak datei"
mkdir /opt/{dir1,dir2,dir3}					= Erstellt in /opt dir1, dir2 und dir3
mkdir -p /opt/{,backup}/{dir1,dir2}			= Erstellt dir1 und dir2 in /opt und /opt/backup
												Lässt sich mit beliebigen Befehlen kombinieren.

echo ${var1/suchen_und/ersetzen_durch}		= Erstes Auftreten eines Zeichens oder einer Zeichenfolge in $var1 ersetzen.
echo ${var1//suchen_und/ersetzen_durch}		= Jedes Auftreten ersetzen.
echo ${var1/suchen_und_loeschen}	 		= Erstes Auftreten von "suchen_und_loeschen" in $var1 löschen.
echo ${var1//suchen_und_loeschen}			= Jedes Auftreten von "suchen_und_loeschen" in $var1 löschen.

echo ${var1:-print_this_text}				= Wenn "var1" nicht gesetzt und auch <strong>nicht leer</strong> ist, wird "print_this_text" ausgegeben ("default"), ansonsten der Inhalt von Variable $var1.
echo ${var1-print_this_text}				= Wenn "var1" nicht gesetzt oder leer ist, wird "print_this_text" ausgegeben ("default"), ansonsten der Inhalt von Variable $var1.
echo ${var1:-$var2}							= Selbiges, jedoch mit zwei Variablen.
echo ${var1:+alt_value}						= Wenn "var1" gesetzt ist (auch leer), lautet die Ausgabe "alt_value"
echo ${var1:+$var2}							= Selbiges, jedoch mit zwei Variablen.

	
## Kürzel, die besonders in Scripts hilfreich sein können:
echo $#				= Anzahl an Parametern
echo $@				= Alle Parameter anzeigen
echo $?				= Exit Status des letzten Befehls, hier "echo $@".
echo $$				= PID der aktuellen Shell
echo $0				= Shellname oder Name des Scripts
echo $!				= PID des zuletzt in den Hintergrund gelegten Prozesses (z.B. mit "iked &")

## Dateipfade
var1=/ein/pfad/zu/einer/datei.mit.erweiterung
echo ${var1}		= /ein/pfad/zu/einer/datei.mit.erweiterung
echo ${var1#*.}		= mit.erweiterung
echo ${var1##*.}	= mit
echo ${var1%/*.*}	= /ein/pfad/zu/einer
file=${var1##/*/}	= datei.mit.erweiterung
echo ${file%.*}		= datei.mit
echo ${file%%.*}	= datei

## "Cases"
## Die Endung ";;&" führt den nächsten Test aus.
## Die Endung ";&" führt die nächste Anweisung aus, egal, ob der Test wahr, falsch oder ein Dummy ist.
example_cases()
{
  case "$1" in
    [[:print:]] )	echo "$1 is a printable character.";;&
    [[:alnum:]] )	echo "$1 is an alpha/numeric character.";;&
    [[:alpha:]] )	echo "$1 is an alphabetic character.";;&
    [[:lower:]] )	echo "$1 is a lowercase alphabetic character.";;&
    [[:upper:]] )	echo "$1 is a uppercase alphabetic character.";;&
    [[:upper:]]* )	echo "$1 begins with an uppercase alphabetic character.";;&
    [a-zA-Z]* )		echo "$1 begins with a-z or A-Z.";;&
    [!a-zA-Z]* )	echo "$1 begins not with a-z or A-Z.";;&
    [[:digit:]] )	echo "$1 is a numeric character.";;&
	*[0-9]* )	echo "$1 contains a numeric character.";;&
	123[[:digit:]] ) echo "$1 is a number starting with 123.";&
    dummypattern )	echo "Example for \";&\".";;
  esac
}