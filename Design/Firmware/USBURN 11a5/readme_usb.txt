US-Burn (für USB-Portbrenner Brenner8/9) V1.11a5 (30.05.2011)
=============================================================

Das ist US-Burn 1.11. Sie unterstützt den Brenner8 für 5V-PICs wie auch den Brenner9, der 3,3V-PICs-brennen kann.



Allgemeines
===========

Dies ist ein Windowsprogramms zur Ansteuerung meines Brenners8/9.

Mit einem Brenner 8 werden 14- und 16-Bit-Kern-PICs sowie einige 24-Bit Signalcontroller unterstützt. 
Das sind die Serien PIC18Fxxxx, PIC16Fxxx, dsPIC30Fxxxx und viele PIC12Fxxx.
Das Programm benötigt dafür einen Brenner8 mit Firmware 0.15 (oder neuer) und der Database 24 (oder neuer).
All das befindet sich in dieser ZIP-Datei

Mit einem Brenner 9 werden 3,3V-PICs der Serien PIC24F, PIC24H, dsPIC33 sowie PIC18FxxJxx unterstützt. 
Das Programm benötigt dafür einen Brenner9 mit Firmware 3.12 und der Database 19. All das befindet
sich in dieser ZIP-Datei

Die 3,3V-Typen PIC16LF193x und PIC16LF72x werden von der Brennerhardware noch nicht unterstuetzt.


Das Programm wurde von mir für viele PIC-Typen unter WinXP getestet, kann aber prinzipiell
unter WinXP, Win2k, WinNT, WinVista Win7 brennen.



Installation:
============
Das Zip-File in einen Ordner entpacken. Den Treiber 
(Unterverzeichnis driver) gleich installieren, oder nach dem Anschluß 
des Brenner8/9 auf Forderung von Windows installieren.

Es gibt zwei unterschiedliche Treiber zur "Auswahl". Der ältere unterstützt noch Win98/me während
der neuere WinXP und WinVista unterstützt.

Die 6 im ZIP-File enthaltenen Dateien xx03.dat müssen ebenfalls 
in das gleiche Verzeichnis wie usburnxx.exe kopiert werden. Sie stellen die Database dar.

Beim Start legt US-Burn eine Datei namens usburn.ini im
Programmverzeichnis an.



Bekannte Probleme:
==================

- 16F639 wird als 16F636 behandelt (kein wirkliches Problem)
- 16F83 muß als 16F84 gebrannt werden
- 60- & 80-polige PICs müssen über die ICSP-Verbindung gebrannt werden.
- dsPIC30F-Typen müssen über die ICSP-Verbindung gebrannt werden.
- alle 3,3V-Typen müssen über die ICSP-Verbindung gebrannt werden.




Änderung in US-Burn V1.11a5
===========================
- Anpassung an diverse neue PIC16F7xx-Typen (mit Firmware 16, Database 28)


Änderung in US-Burn V1.11a2
===========================
- Bugfix: EEPROM aller PIC16F-Typen wurde in Version 11.a1 falsch belegt


Änderung in US-Burn V1.11a1
===========================
- unterstützt Firmware 15
- diverse neue PIC-Typen
- Brennen der PIC18FxxKxx - aber nur über einen Adapter!
- EEPROM-Inhalt kann beim Brennen erhalten bleiben
- beschleunigtes Brennen
- diverse Kleinigkeiten


Änderung in US-Burn V1.10a5
===========================
- Irrtuemlich angezeigter Configfehler bei PIC12F629 beseitigt
- Bugfix: beim brennen eines PIC mit aktiver CP geht OSCCAL nicht mehr verloren
- diverse Kleinigkeiten


Änderung in US-Burn V1.10a1
===========================
- korrekte Unterstützung der PIC24FJ-Typen (Brenner9)
- Umfangreiche Erweiterung der Typenpalette mit DB19 und neuer picdef3.dll
- Bugfix: manchmal wurde Flash bei dsPIC33/PIC24HJ unvollständig gebrannt
- diverse Kleinigkeiten


Änderung in US-Burn V1.9a3
===========================
- größere Toleranz gegenüber "fehlerhaften" hex-Files bei 24-Bit-KernPICs
- Kommandozeilenoptionen
- mit DB18 werden "confi Error"-Meldungen
- diverse Kleinigkeiten


Änderung in US-Burn V1.8a3
===========================
- Anpassung an Konfigurationsoptinen mit mehr als 16 Einstellmöglichkeiten


Änderung in US-Burn V1.8a2
===========================
- kann HEX-Files verarbeiten, die unter Linux erstellt wurden


Änderung in US-Burn V1.8a1
===========================
- Erkennung und Vermeidung der "ICD/ICSP PortEnable bit"-Falle
- "Reanimierung" von PIC18Fxxxx, die nach korrektem Brennen nicht mehr erkannt werden
- Bugfix im Reassembler für 12-Bit-Kern-PICs


Änderung in US-Burn V1.7a6
===========================
- Verbesserte PIC-Typ-Auswahl
- Vorbereitung für das Brennen von 12-Bit-PICs (PIC10F20x u.ä.) mit der Fw11


Änderung in US-Burn V1.7a2
===========================
- USBurn bietet nun nur die PIC-Familien zum Brennen an, die von der Brennerhardware auch unterstützt werden.
- Disassembler für dsPIC30/33/PIC24 integriert


Änderung in US-Burn V1.7a1
===========================
- Integration des Brenner9 mit PIC24, dsPIC33 und PIC18FxxJxx


Änderung in US-Burn V1.5rc2
===========================
- kleinere Korrekturen
- Laden des HEX-Feiles ist erst nach korrekter PIC-Typ-Erkennung möglich
- Unterstützung der Speisung von Testplatinen mit 5V/100mA (ab Fw 0.9)
 

Änderung in US-Burn V1.5rc1
===========================
- Unterstützung der dsPIC30Fxxx
 

Änderung in US-Burn V1.4
========================
- Unterstützung der RUN-Funktion ab Firmware 0.8
- Bugfix für PIC18F2410 / PIC18F2420 / PIC18F2450 
             PIC18F4410 / PIC18F4420 / PIC18F4450 


Änderung in US-Burn V1.3
========================
- unsinnige OSCCAL-Behandlung bei einigen PIC18Fxxxx deaktiviert 
- Memory-Map an PIC18Fxxxx angepaßt 
- kann mit Firmware V0.6 die Kalibrierdaten im Brenner speichern 
- Bugfix: Auslesen von PICs mit mehr als 256 Byte EEPROM 
- Bugfix: Auslesen von PIC18Fxxxx 
- kann Firmware in den Steuerpic schreiben 
  (wenn mindestens FW V0.6 & Bootloader V1.0 im Brenner sind)


Änderung in US-Burn V1.2a
=========================
- Absturz beim auslesen leerer PIC16Fxxx beseitigt
- Absturz beim Reassemblieren einiger PIC16F-Hex-Files beseitigt


Änderung in US-Burn V1.2
========================
- Fehler beim Brennen genau einer EEPROM-Zelle behoben
- Unterstützung für PIC18F-Typen


Änderung in US-Burn V1.1g
=========================
- Unterstützung für PIC18F-Typen (ohne Memory Map)
- überarbeitete Vpp-Regelung
- benötigt Firmware V 0.5
- kleine Bugfixes


Änderung in US-Burn V1.1(e)f1
=============================
- Prüfung der bebrannten Config verbessert für PICs mit Bandgap-Einstellung
  und für PICs mit unbenutzten Config-Bits (z.B. 12F675)


Änderung in US-Burn V1.1(e)
===========================
- Brennfehler bei Config und ID einer Typen (16F87xA) beseitigt
- viele kleinere Bugs beseitigt
- benötigt Brenner8-Firmware 0.4
- benötigt Database 10



Änderung in US-Burn V1.1(c)
===========================
- Bug verursachet Ansturz beim Brennen leerer ID-Zellen



Über positive und 
negtive Erfahrungen berichtet bitte an:
mailto: sprut@sprut.de


sprut 30.05.2011
http://www.sprut.de
