US-Burn (f�r USB-Portbrenner Brenner8/9) V1.11a5 (30.05.2011)
=============================================================

Das ist US-Burn 1.11. Sie unterst�tzt den Brenner8 f�r 5V-PICs wie auch den Brenner9, der 3,3V-PICs-brennen kann.



Allgemeines
===========

Dies ist ein Windowsprogramms zur Ansteuerung meines Brenners8/9.

Mit einem Brenner 8 werden 14- und 16-Bit-Kern-PICs sowie einige 24-Bit Signalcontroller unterst�tzt. 
Das sind die Serien PIC18Fxxxx, PIC16Fxxx, dsPIC30Fxxxx und viele PIC12Fxxx.
Das Programm ben�tigt daf�r einen Brenner8 mit Firmware 0.15 (oder neuer) und der Database 24 (oder neuer).
All das befindet sich in dieser ZIP-Datei

Mit einem Brenner 9 werden 3,3V-PICs der Serien PIC24F, PIC24H, dsPIC33 sowie PIC18FxxJxx unterst�tzt. 
Das Programm ben�tigt daf�r einen Brenner9 mit Firmware 3.12 und der Database 19. All das befindet
sich in dieser ZIP-Datei

Die 3,3V-Typen PIC16LF193x und PIC16LF72x werden von der Brennerhardware noch nicht unterstuetzt.


Das Programm wurde von mir f�r viele PIC-Typen unter WinXP getestet, kann aber prinzipiell
unter WinXP, Win2k, WinNT, WinVista Win7 brennen.



Installation:
============
Das Zip-File in einen Ordner entpacken. Den Treiber 
(Unterverzeichnis driver) gleich installieren, oder nach dem Anschlu� 
des Brenner8/9 auf Forderung von Windows installieren.

Es gibt zwei unterschiedliche Treiber zur "Auswahl". Der �ltere unterst�tzt noch Win98/me w�hrend
der neuere WinXP und WinVista unterst�tzt.

Die 6 im ZIP-File enthaltenen Dateien xx03.dat m�ssen ebenfalls 
in das gleiche Verzeichnis wie usburnxx.exe kopiert werden. Sie stellen die Database dar.

Beim Start legt US-Burn eine Datei namens usburn.ini im
Programmverzeichnis an.



Bekannte Probleme:
==================

- 16F639 wird als 16F636 behandelt (kein wirkliches Problem)
- 16F83 mu� als 16F84 gebrannt werden
- 60- & 80-polige PICs m�ssen �ber die ICSP-Verbindung gebrannt werden.
- dsPIC30F-Typen m�ssen �ber die ICSP-Verbindung gebrannt werden.
- alle 3,3V-Typen m�ssen �ber die ICSP-Verbindung gebrannt werden.




�nderung in US-Burn V1.11a5
===========================
- Anpassung an diverse neue PIC16F7xx-Typen (mit Firmware 16, Database 28)


�nderung in US-Burn V1.11a2
===========================
- Bugfix: EEPROM aller PIC16F-Typen wurde in Version 11.a1 falsch belegt


�nderung in US-Burn V1.11a1
===========================
- unterst�tzt Firmware 15
- diverse neue PIC-Typen
- Brennen der PIC18FxxKxx - aber nur �ber einen Adapter!
- EEPROM-Inhalt kann beim Brennen erhalten bleiben
- beschleunigtes Brennen
- diverse Kleinigkeiten


�nderung in US-Burn V1.10a5
===========================
- Irrtuemlich angezeigter Configfehler bei PIC12F629 beseitigt
- Bugfix: beim brennen eines PIC mit aktiver CP geht OSCCAL nicht mehr verloren
- diverse Kleinigkeiten


�nderung in US-Burn V1.10a1
===========================
- korrekte Unterst�tzung der PIC24FJ-Typen (Brenner9)
- Umfangreiche Erweiterung der Typenpalette mit DB19 und neuer picdef3.dll
- Bugfix: manchmal wurde Flash bei dsPIC33/PIC24HJ unvollst�ndig gebrannt
- diverse Kleinigkeiten


�nderung in US-Burn V1.9a3
===========================
- gr��ere Toleranz gegen�ber "fehlerhaften" hex-Files bei 24-Bit-KernPICs
- Kommandozeilenoptionen
- mit DB18 werden "confi Error"-Meldungen
- diverse Kleinigkeiten


�nderung in US-Burn V1.8a3
===========================
- Anpassung an Konfigurationsoptinen mit mehr als 16 Einstellm�glichkeiten


�nderung in US-Burn V1.8a2
===========================
- kann HEX-Files verarbeiten, die unter Linux erstellt wurden


�nderung in US-Burn V1.8a1
===========================
- Erkennung und Vermeidung der "ICD/ICSP PortEnable bit"-Falle
- "Reanimierung" von PIC18Fxxxx, die nach korrektem Brennen nicht mehr erkannt werden
- Bugfix im Reassembler f�r 12-Bit-Kern-PICs


�nderung in US-Burn V1.7a6
===========================
- Verbesserte PIC-Typ-Auswahl
- Vorbereitung f�r das Brennen von 12-Bit-PICs (PIC10F20x u.�.) mit der Fw11


�nderung in US-Burn V1.7a2
===========================
- USBurn bietet nun nur die PIC-Familien zum Brennen an, die von der Brennerhardware auch unterst�tzt werden.
- Disassembler f�r dsPIC30/33/PIC24 integriert


�nderung in US-Burn V1.7a1
===========================
- Integration des Brenner9 mit PIC24, dsPIC33 und PIC18FxxJxx


�nderung in US-Burn V1.5rc2
===========================
- kleinere Korrekturen
- Laden des HEX-Feiles ist erst nach korrekter PIC-Typ-Erkennung m�glich
- Unterst�tzung der Speisung von Testplatinen mit 5V/100mA (ab Fw 0.9)
 

�nderung in US-Burn V1.5rc1
===========================
- Unterst�tzung der dsPIC30Fxxx
 

�nderung in US-Burn V1.4
========================
- Unterst�tzung der RUN-Funktion ab Firmware 0.8
- Bugfix f�r PIC18F2410 / PIC18F2420 / PIC18F2450 
             PIC18F4410 / PIC18F4420 / PIC18F4450 


�nderung in US-Burn V1.3
========================
- unsinnige OSCCAL-Behandlung bei einigen PIC18Fxxxx deaktiviert 
- Memory-Map an PIC18Fxxxx angepa�t 
- kann mit Firmware V0.6 die Kalibrierdaten im Brenner speichern 
- Bugfix: Auslesen von PICs mit mehr als 256 Byte EEPROM 
- Bugfix: Auslesen von PIC18Fxxxx 
- kann Firmware in den Steuerpic schreiben 
  (wenn mindestens FW V0.6 & Bootloader V1.0 im Brenner sind)


�nderung in US-Burn V1.2a
=========================
- Absturz beim auslesen leerer PIC16Fxxx beseitigt
- Absturz beim Reassemblieren einiger PIC16F-Hex-Files beseitigt


�nderung in US-Burn V1.2
========================
- Fehler beim Brennen genau einer EEPROM-Zelle behoben
- Unterst�tzung f�r PIC18F-Typen


�nderung in US-Burn V1.1g
=========================
- Unterst�tzung f�r PIC18F-Typen (ohne Memory Map)
- �berarbeitete Vpp-Regelung
- ben�tigt Firmware V 0.5
- kleine Bugfixes


�nderung in US-Burn V1.1(e)f1
=============================
- Pr�fung der bebrannten Config verbessert f�r PICs mit Bandgap-Einstellung
  und f�r PICs mit unbenutzten Config-Bits (z.B. 12F675)


�nderung in US-Burn V1.1(e)
===========================
- Brennfehler bei Config und ID einer Typen (16F87xA) beseitigt
- viele kleinere Bugs beseitigt
- ben�tigt Brenner8-Firmware 0.4
- ben�tigt Database 10



�nderung in US-Burn V1.1(c)
===========================
- Bug verursachet Ansturz beim Brennen leerer ID-Zellen



�ber positive und 
negtive Erfahrungen berichtet bitte an:
mailto: sprut@sprut.de


sprut 30.05.2011
http://www.sprut.de
