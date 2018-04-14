# Links Bash/Shell Anleitungen

  * [Github](https://github.com/bkuhlmann/style_guides/blob/master/programming/languages/bash.md#here-documents)
  * [HowTO](http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html)
  * [Wiki](http://https://bash.cyberciti.biz/guide/Main_Page)
  * [Bash Hackers](http://wiki.bash-hackers.org/scripting/style)
  * [Ver. Beispiele](http://www.tldp.org/LDP/abs/html/contributed-scripts.html#HANOI2)
  * [.bash.academy](http://guide.bash.academy/)
  * [Commandlinefu](http://www.commandlinefu.com/commands/browse)


## Ausschnitte

# 1.7.2 Spezialparameter


    $*	bezeichnet alle Positionsparameter von 1 an. In Anfuehrungszeichen gesetzt, steht ``$*'' fuer ein einziges Wort,                bestehend aus dem Inhalt aller Positionsparameter, mit dem ersten ``internen Feldseperator'' (meistens Leerzeichen,             Tab und Zeilenende) als Trennzeichen.
    $@	bezeichnet alle Positionsparameter von 1 an. In Anfuehrungszeichen gesetzt, wird es durch die Werte der einzelnen               Positionsparameter (jeweils ein einzelnes Wort) ersetzt.
    $#	Anzahl der Positionsparameter
    $?	Rueckgabewert (Status) des zuletzt ausgefuehrten Kommandos
    $-	steht fuer die Optionsflags (von set oder aus der Kommandozeile).
    $$	Prozessnummer der Shell
    $!	Prozessnummer des zuletzt im Hintergrund aufgerufenen Kommandos
    $0	Name des Shellscripts
    $_	letztes Argument des zuletzt ausgefuehrten Kommandos


# 1.8 Parametererweiterung

${Parameter}

Laeßt sich ein Variablenname nicht eindeutig von den darauffolgenden Zeichen trennen, oder besteht ein Positionsparameter   aus mehr als einer Ziffer, muß dieser Parameter in geschweifte Klammern gesetzt werden.
Die folgenden Konstruktionen stellen verschiedene Arten bedingter Parametererweiterung dar. Enthaelt die Konstruktion einen     Doppelpunkt, so wird der Parameter darauf hin getestet, ob er leer oder ungesetzt ist. Wird der Doppelpunkt in diesen   Konstruktionen weggelassen, wird nur darauf getestet, ob er gesetzt (auch leer!) oder ungesetzt ist.

Parametererweiterungen eigenen sich z.B. fuer die Defaultwertzuweisung bei Variablen. Sie duerfen nur als Bestandteil eines     Kommandos oder einer Zuweisung durchgefuehrt werden. Soll eine Parametererweiterung als einzelnes Kommando stehen,  beispielsweise bei einer Fehlermeldung, dann muß die Zeile mit einem Doppelpunkt begonnen werden.

${Parameter:-default}
    Wenn der Parameter ungesetzt oder leer ist, wird default anstelle des gesamten Ausdrucks eingesetzt.
${Parameter:=default}
    Wenn der Parameter ungesetzt oder leer ist, wird der Inhalt von default dem Parameter zugewiesen und der neue Parameter eingesetzt. Positionsparametern und Spezialparametern kann allerdings auch auf diese Weise kein Wert zugewiesen werden.
${Parameter:?err_msg}
    gibt eine Fehlermeldung wenn der Parameter leer oder ungesetzt ist. err_msg wird als Fehlermeldung auf STDERR ausgegeben. Ist der Parameter gueltig gesetzt, wird sein Inhalt eingesetzt.
${Parameter:+alt_value}
    erzwingt die Benutzung eines anderen Wertes. Wenn der Parameter weder leer, noch ungesetzt ist, wird der Inhalt von alt_value eingesetzt. Sonst wird nichts eingesetzt.
${Parameter:Offset:Laenge}
    Hier wird Parameter, von Offset an, mit der Laenge Laenge neu gesetzt.
${#Parameter}
    gibt die Anzahl der Zeichen im Parameter wieder.
${var#Pattern} und ${var##Pattern}
    entfernt den uebereinstimmenden Teil von Pattern in var beginnend von links. Bei # wird das kuerzeste treffende Stueck entfernt, bei ## das Laengste.
${var%Pattern} und ${var%%Pattern}
    entfernt den uebereinstimmenden Teil von Pattern in var beginnend von rechts. Bei % wird das kuerzeste treffende Stueck entfernt, bei %% das Laengste.
${var/Pattern/Replacement} und ${var/Pattern//Replacement}
    Das größte auf Pattern passende Stueck in var wird durch Replacement ersetzt. Bei / wird einmal ersetzt, bei // wird jede auftretende uebereinstimmung ersetzt. Werden Positionsparameter oder Arrays uebergeben, wird das Kommando auf jeder einzelnen Parameter bzw. jedes Feld angewandt.