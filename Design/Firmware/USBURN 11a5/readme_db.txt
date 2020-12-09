Readme.txt zur Database 28  vom 30.05.2011 für PBrennerNG, P18, dsProg und USBurn
(basierend auf MPLAB-IDE 8.66)


Inhalt
======

- Allgemeines
- Warum wird die Database überarbeitet?
- wichtige Änderungen im Vergleich zur vorigen Database



Allgemeines
===========

Die Database enthält folgende Files:
- cekdef03.dat
- cfgdef03.dat
- fildef03.dat
- picdef03.dat
- setdef03.dat
- texdef03.dat
Alle Dateien sind gemeinsam in das Programmverzeichnis des Brennprogramms  PBrennerNG und/oder P18 und/oder dsProg und/oder USBurn zu kopieren. Dort ersetzen sie die gleichnamigen Dateien der vorherigen Database.

- picdef3.dll
Diese Database erfordert die picdef3.dll-Datei in der Version ab 3.4 (vom 21.02.2010) oder jünger. Die passende Version liegt der Database bei.

Diese Text-Datei beschreibt im Folgenden die Änderungen der Database 27 im Vergleich zu Database 26.



Warum wird die Database überarbeitet?
=====================================

1.
Der Hersteller Microchip passt die Programmierparameter kontinuierlich dem real existierenden Silizium an, diese Änderungen übernehme ich. Dabei handelt es sich meist um eine Verlangsamung des Timings, gelegentlich aber auch um größere Eingriffe in den Ablauf der PIC-Programmierung. Solche Änderungen betreffen meist nur PIC-Typen, die sich erst kurze Zeit auf dem Markt befinden.

2.
Neue PIC-Typen müssen in die Database aufgenommen werden. 

3.
Fehler die ich in der Behandlung einzelner PICs gemacht habe, muss ich korrigieren.



wichtige Änderungen im Vergleich zur Database 27
================================================
V. 27 vom 13/05/2011
V. 26 vom 30/05/2011
alt: 629 PIC-Typen  --> neu: 629 PIC-Typen


PIC16F707 :  taktik.id taktik.config
PIC16F720 :  power taktik.id taktik.config
PIC16F721 :  power taktik.id taktik.config
PIC16F722 :  taktik.id taktik.config
PIC16F723 :  taktik.id taktik.config
PIC16F724 :  taktik.id taktik.config
PIC16F726 :  taktik.id taktik.config
PIC16F727 :  taktik.id taktik.config
PIC16F722A :  taktik.id taktik.config
PIC16F723A :  taktik.id taktik.config
PIC16LF707 :  taktik.id taktik.config
PIC16LF720 :  power taktik.id taktik.config
PIC16LF721 :  power taktik.id taktik.config
PIC16LF722 :  taktik.id taktik.config
PIC16LF723 :  taktik.id taktik.config
PIC16LF724 :  taktik.id taktik.config
PIC16LF726 :  taktik.id taktik.config
PIC16LF727 :  taktik.id taktik.config



wichtige Änderungen im Vergleich zur Database 26
================================================
V. 26 vom 25/10/2010
V. 27 vom 13/05/2011
alt: 576 PIC-Typen  --> neu: 629 PIC-Typen


PIC12F609 :  calmem.min calmem.max
PIC12F615 :  calmem.min calmem.max
PIC12F635 :  calmem.min calmem.max
PIC12F683 :  calmem.min calmem.max
PIC12F752 neu in der Datenbank,  supported
PIC12F1822 :  power
PIC12F1840 neu in der Datenbank,  supported
PIC16F87 :  latches.userid
PIC16F88 :  latches.userid
PIC16F610 :  calmem.min calmem.max
PIC16F616 :  calmem.min calmem.max
PIC16F631 :  calmem.min calmem.max
PIC16F636 :  calmem.min calmem.max
PIC16F639 :  calmem.min calmem.max
PIC16F677 :  calmem.min calmem.max
PIC16F684 :  calmem.min calmem.max
PIC16F685 :  calmem.min calmem.max
PIC16F687 :  calmem.min calmem.max
PIC16F689 :  calmem.min calmem.max
PIC16F690 :  calmem.min calmem.max
PIC16F707 :  power software taktik.flash taktik.id taktik.config taktik.erase taktik.cp
PIC16F720 :  blocksize
PIC16F722 :  power calmem.min calmem.max
PIC16F723 :  power calmem.min calmem.max
PIC16F724 :  power calmem.min calmem.max
PIC16F726 :  power calmem.min calmem.max
PIC16F727 :  power calmem.min calmem.max
PIC16F785 :  calmem.min calmem.max
PIC16F818 :  vpp.min vpp.max vpp.deflt
PIC16F819 :  vpp.min vpp.max vpp.deflt
PIC16F882 :  calmem.min calmem.max
PIC16F883 :  calmem.min calmem.max
PIC16F884 :  calmem.min calmem.max
PIC16F886 :  calmem.min calmem.max
PIC16F887 :  calmem.min calmem.max
PIC16F1516 neu in der Datenbank,  supported
PIC16F1517 neu in der Datenbank,  supported
PIC16F1518 neu in der Datenbank,  supported
PIC16F1519 neu in der Datenbank,  supported
PIC16F1526 neu in der Datenbank,  supported
PIC16F1527 neu in der Datenbank,  supported
PIC16F1782 neu in der Datenbank,  supported
PIC16F1783 neu in der Datenbank,  supported
PIC16F1823 :  power
PIC16F1824 :  power blocksize
PIC16F1825 :  power blocksize
PIC16F1826 :  power
PIC16F1827 :  power
PIC16F1828 :  power blocksize
PIC16F1829 :  power blocksize pgmmem.max
PIC16F1847 neu in der Datenbank,  supported
PIC16F1933 :  power
PIC16F1934 :  power
PIC16F1936 :  power
PIC16F1937 :  power
PIC16F1938 :  power blocksize
PIC16F1939 :  power
PIC16F1946 :  power
PIC16F1947 :  power
PIC16F722A :  power software taktik.flash taktik.id taktik.config taktik.erase taktik.cp
PIC16F723A :  power software taktik.flash taktik.id taktik.config taktik.erase taktik.cp
PIC16LF707 :  power software taktik.flash taktik.id taktik.config taktik.erase taktik.cp
PIC16LF720 :  blocksize
PIC16LF722 :  power calmem.min calmem.max
PIC16LF723 :  power calmem.min calmem.max
PIC16LF724 :  power calmem.min calmem.max
PIC16LF726 :  power calmem.min calmem.max
PIC16LF727 :  power calmem.min calmem.max
PIC16LF1516 neu in der Datenbank,  supported
PIC16LF1517 neu in der Datenbank,  supported
PIC16LF1518 neu in der Datenbank,  supported
PIC16LF1519 neu in der Datenbank,  supported
PIC16LF1526 neu in der Datenbank,  supported
PIC16LF1527 neu in der Datenbank,  supported
PIC16LF1782 neu in der Datenbank,  supported
PIC16LF1783 neu in der Datenbank,  supported
PIC16LF1823 :  power
PIC16LF1824 :  power blocksize
PIC16LF1825 :  power blocksize
PIC16LF1826 :  power
PIC16LF1827 :  power
PIC16LF1828 :  power blocksize
PIC16LF1829 :  power blocksize pgmmem.max
PIC16LF1847 neu in der Datenbank,  supported
PIC16LF1902 neu in der Datenbank,  supported
PIC16LF1903 neu in der Datenbank,  supported
PIC16LF1904 neu in der Datenbank,  supported
PIC16LF1906 neu in der Datenbank,  supported
PIC16LF1907 neu in der Datenbank,  supported
PIC16LF1933 :  power
PIC16LF1934 :  power
PIC16LF1936 :  power
PIC16LF1937 :  power
PIC16LF1938 :  power blocksize
PIC16LF1939 :  power
PIC16LF1946 :  power
PIC16LF1947 :  power
PIC18F6310 :  vpp.min vpp.max vpp.deflt
PIC18F6390 :  vpp.min vpp.max vpp.deflt
PIC18F6393 :  vpp.min vpp.max vpp.deflt
PIC18F8310 :  vpp.min vpp.max vpp.deflt
PIC18F8390 :  vpp.min vpp.max vpp.deflt
PIC18F8393 :  vpp.min vpp.max vpp.deflt
PIC18F8620 :  extpgm.min
PIC18F8627 :  extpgm.min
PIC18F8628 :  extpgm.min
dsPIC33FJ16GP101 neu in der Datenbank,  NOT-supported
dsPIC33FJ16GP102 neu in der Datenbank,  NOT-supported
dsPIC33FJ16MC101 neu in der Datenbank,  NOT-supported
dsPIC33FJ16MC102 neu in der Datenbank,  NOT-supported
PIC24F04KA200 :  latches.pgm
PIC24F04KA201 :  latches.pgm
PIC24F08KA101 :  latches.pgm
PIC24F08KA102 :  latches.pgm
PIC24F16KA101 :  latches.pgm
PIC24F16KA102 :  latches.pgm
PIC24F16KA301 :  software vpp.min vpp.max vpp.deflt devid.id
PIC24F16KA302 :  software vpp.min vpp.max vpp.deflt devid.id
PIC24F16KA304 :  software vpp.min vpp.max vpp.deflt devid.id
PIC24F32KA301 :  software vpp.min vpp.max vpp.deflt devid.id
PIC24F32KA302 :  software vpp.min vpp.max vpp.deflt devid.id
PIC24F32KA304 :  software vpp.min vpp.max vpp.deflt devid.id
PIC24FJ16GA002 :  latches.pgm
PIC24FJ16GA004 :  latches.pgm
PIC24FJ32GA002 :  latches.pgm
PIC24FJ32GA004 :  latches.pgm
PIC24FJ32GA102 :  latches.pgm
PIC24FJ32GA104 :  latches.pgm
PIC24FJ48GA002 :  latches.pgm
PIC24FJ48GA004 :  latches.pgm
PIC24FJ64GA002 :  latches.pgm
PIC24FJ64GA004 :  latches.pgm
PIC24FJ64GA006 :  latches.pgm
PIC24FJ64GA008 :  latches.pgm
PIC24FJ64GA010 :  latches.pgm
PIC24FJ64GA102 :  latches.pgm
PIC24FJ64GA104 :  latches.pgm
PIC24FJ64GA106 :  latches.pgm pgmmem.max
PIC24FJ64GA108 :  latches.pgm pgmmem.max
PIC24FJ64GA110 :  latches.pgm pgmmem.max
PIC24FJ64GA306 neu in der Datenbank,  NOT-supported
PIC24FJ64GA308 neu in der Datenbank,  NOT-supported
PIC24FJ64GA310 neu in der Datenbank,  NOT-supported
PIC24FJ96GA006 :  latches.pgm
PIC24FJ96GA008 :  latches.pgm
PIC24FJ96GA010 :  latches.pgm
PIC24FJ32GB002 :  latches.pgm
PIC24FJ32GB004 :  latches.pgm
PIC24FJ64GB002 :  latches.pgm
PIC24FJ64GB004 :  latches.pgm
PIC24FJ64GB106 :  latches.pgm
PIC24FJ64GB108 :  latches.pgm
PIC24FJ64GB110 :  latches.pgm
PIC24FJ128GA006 :  latches.pgm
PIC24FJ128GA008 :  latches.pgm
PIC24FJ128GA010 :  latches.pgm
PIC24FJ128GA106 :  latches.pgm
PIC24FJ128GA108 :  latches.pgm
PIC24FJ128GA110 :  latches.pgm
PIC24FJ128GA306 neu in der Datenbank,  NOT-supported
PIC24FJ128GA308 neu in der Datenbank,  NOT-supported
PIC24FJ128GA310 neu in der Datenbank,  NOT-supported
PIC24FJ192GA106 :  latches.pgm
PIC24FJ192GA108 :  latches.pgm
PIC24FJ192GA110 :  latches.pgm
PIC24FJ256GA106 :  latches.pgm
PIC24FJ256GA108 :  latches.pgm
PIC24FJ256GA110 :  latches.pgm
PIC24FJ128GB106 :  latches.pgm
PIC24FJ128GB108 :  latches.pgm
PIC24FJ128GB110 :  latches.pgm
PIC24FJ128GB206 :  software latches.pgm
PIC24FJ128GB210 :  software latches.pgm
PIC24FJ192GB106 :  latches.pgm
PIC24FJ192GB108 :  latches.pgm
PIC24FJ192GB110 :  latches.pgm
PIC24FJ256GB106 :  latches.pgm
PIC24FJ256GB108 :  latches.pgm
PIC24FJ256GB110 :  latches.pgm
PIC24FJ256GB206 :  software latches.pgm
PIC24FJ256GB210 :  software latches.pgm
PIC18F26J13 :  software
PIC18F26J53 :  software
PIC18F27J13 :  software
PIC18F27J53 :  software
PIC18F46J13 :  software
PIC18F46J53 :  software
PIC18F47J13 :  software
PIC18F47J53 :  software
PIC18F23K22 :  blocksize
PIC18F26K22 :  blocksize
PIC18F43K22 :  blocksize
PIC18F46K22 :  blocksize
PIC18LF26J13 :  software
PIC18LF26J53 :  software
PIC18LF27J13 :  software
PIC18LF27J53 :  software
PIC18LF46J13 :  software
PIC18LF46J53 :  software
PIC18LF47J13 :  software
PIC18LF47J53 :  software
PIC18LF23K22 :  blocksize
PIC18LF26K22 :  blocksize
PIC18LF43K22 :  blocksize
PIC18LF46K22 :  blocksize



wichtige Änderungen im Vergleich zur Database 25
================================================
V. 25 vom 21/10/2010
V. 26 vom 25/10/2010
alt: 576 PIC-Typen  --> neu: 576 PIC-Typen

Anderes FlashVerfahren fuer folgende Typen

PIC12F1822 :  taktik.flash taktik.id taktik.config
PIC16F1823 :  taktik.flash taktik.id taktik.config
PIC16F1824 :  taktik.flash taktik.id taktik.config
PIC16F1825 :  taktik.flash taktik.id taktik.config
PIC16F1826 :  taktik.flash taktik.id taktik.config
PIC16F1827 :  taktik.flash taktik.id taktik.config
PIC16F1828 :  taktik.flash taktik.id taktik.config
PIC16F1829 :  taktik.flash taktik.id taktik.config
PIC16F1933 :  taktik.flash taktik.id taktik.config
PIC16F1934 :  taktik.flash taktik.id taktik.config
PIC16F1936 :  taktik.flash taktik.id taktik.config
PIC16F1937 :  taktik.flash taktik.id taktik.config
PIC16F1938 :  taktik.flash taktik.id taktik.config
PIC16F1939 :  taktik.flash taktik.id taktik.config
PIC16F1946 :  taktik.flash taktik.id taktik.config
PIC16F1947 :  taktik.flash taktik.id taktik.config
PIC16LF1823 :  taktik.flash taktik.id taktik.config
PIC16LF1824 :  taktik.flash taktik.id taktik.config
PIC16LF1825 :  taktik.flash taktik.id taktik.config
PIC16LF1826 :  taktik.flash taktik.id taktik.config
PIC16LF1827 :  taktik.flash taktik.id taktik.config
PIC16LF1828 :  taktik.flash taktik.id taktik.config
PIC16LF1829 :  taktik.flash taktik.id taktik.config
PIC16LF1933 :  taktik.flash taktik.id taktik.config
PIC16LF1934 :  taktik.flash taktik.id taktik.config
PIC16LF1936 :  taktik.flash taktik.id taktik.config
PIC16LF1937 :  taktik.flash taktik.id taktik.config
PIC16LF1938 :  taktik.flash taktik.id taktik.config
PIC16LF1939 :  taktik.flash taktik.id taktik.config
PIC16LF1946 :  taktik.flash taktik.id taktik.config
PIC16LF1947 :  taktik.flash taktik.id taktik.config




wichtige Änderungen im Vergleich zur Database 24
================================================
V. 24 vom 06/05/2010
V. 25 vom 21/10/2010
alt: 576 PIC-Typen  --> neu: 576 PIC-Typen

Korrektur des codeprotection-settings

PIC18F23K22
PIC18LF23K22
PIC18F24K22
PIC18LF24K22
PIC18F43K22
PIC18LF43K22
PIC18F44K22
PIC18LF44K22


Korrektur für diverse aktuelle low-power-Typen

PIC16LF720 :  CPU
PIC16LF721 :  CPU
PIC16LF722 :  CPU
PIC16LF723 :  CPU
PIC16LF724 :  CPU
PIC16LF726 :  CPU
PIC16LF727 :  CPU
PIC16LF1823 :  CPU
PIC16LF1824 :  CPU
PIC16LF1825 :  CPU
PIC16LF1826 :  CPU
PIC16LF1827 :  CPU
PIC16LF1828 :  CPU
PIC16LF1829 :  CPU
PIC16LF1933 :  CPU
PIC16LF1934 :  CPU
PIC16LF1936 :  CPU
PIC16LF1937 :  CPU
PIC16LF1938 :  CPU
PIC16LF1939 :  CPU
PIC16LF1946 :  CPU
PIC16LF1947 :  CPU
PIC18LF24J10 :  CPU
PIC18LF24J11 :  CPU
PIC18LF24J50 :  CPU
PIC18LF25J10 :  CPU
PIC18LF25J11 :  CPU
PIC18LF25J50 :  CPU
PIC18LF26J11 :  CPU
PIC18LF26J50 :  CPU
PIC18LF44J10 :  CPU
PIC18LF44J11 :  CPU
PIC18LF44J50 :  CPU
PIC18LF45J10 :  CPU
PIC18LF45J11 :  CPU
PIC18LF45J50 :  CPU
PIC18LF46J11 :  CPU
PIC18LF46J50 :  CPU
PIC18LF13K22 :  CPU
PIC18LF13K50 :  CPU
PIC18LF14K22 :  CPU
PIC18LF14K50 :  CPU
PIC18LF23K22 :  CPU
PIC18LF24K22 :  CPU
PIC18LF25K22 :  CPU
PIC18LF26K22 :  CPU
PIC18LF43K22 :  CPU
PIC18LF44K22 :  CPU
PIC18LF45K22 :  CPU
PIC18LF46K22 :  CPU



wichtige Änderungen im Vergleich zur Database 23
================================================
V. 23 vom 17/02/2010
V. 24 vom 06/05/2010
alt: 532 PIC-Typen  --> neu: 576 PIC-Typen

fuer diverse Typen wurden die Hardware-Informationen ueberarbeitet

PIC10F200 :  vpp.min vpp.max vpp.deflt
PIC10F202 :  vpp.min vpp.max vpp.deflt
PIC10F206 :  vpp.min vpp.max vpp.deflt
PIC12F519 :  eedata.min eedata.max
PIC12F617 neu in der Datenbank,  supported
PIC12F1822 neu in der Datenbank,  supported
PIC16F526 :  eedata.min eedata.max
PIC16F639 neu in der Datenbank,  supported
PIC16F716 :  latches.userid
PIC16F720 neu in der Datenbank,  supported
PIC16F721 neu in der Datenbank,  supported
PIC16F913 :  calmem.min calmem.max
PIC16F914 :  calmem.min calmem.max
PIC16F916 :  calmem.min calmem.max
PIC16F917 :  calmem.min calmem.max
PIC16F946 :  calmem.min calmem.max
PIC16F1823 neu in der Datenbank,  supported
PIC16F1824 neu in der Datenbank,  supported
PIC16F1825 neu in der Datenbank,  supported
PIC16F1826 neu in der Datenbank,  supported
PIC16F1827 neu in der Datenbank,  supported
PIC16F1828 neu in der Datenbank,  supported
PIC16F1829 neu in der Datenbank,  supported
PIC16F1933 :  blocksize devid.id
PIC16F1934 :  blocksize
PIC16F1936 :  blocksize
PIC16F1937 :  blocksize
PIC16F1938 neu in der Datenbank,  supported
PIC16F1939 neu in der Datenbank,  supported
PIC16F1946 neu in der Datenbank,  supported
PIC16F1947 neu in der Datenbank,  supported
PIC16LF720 neu in der Datenbank,  supported
PIC16LF721 neu in der Datenbank,  supported
PIC16LF1823 neu in der Datenbank,  supported
PIC16LF1824 neu in der Datenbank,  supported
PIC16LF1825 neu in der Datenbank,  supported
PIC16LF1826 neu in der Datenbank,  supported
PIC16LF1827 neu in der Datenbank,  supported
PIC16LF1828 neu in der Datenbank,  supported
PIC16LF1829 neu in der Datenbank,  supported
PIC16LF1933 :  blocksize devid.id
PIC16LF1934 :  blocksize
PIC16LF1936 :  blocksize
PIC16LF1937 :  blocksize
PIC16LF1938 neu in der Datenbank,  supported
PIC16LF1939 neu in der Datenbank,  supported
PIC16LF1946 neu in der Datenbank,  supported
PIC16LF1947 neu in der Datenbank,  supported
dsPIC33FJ128GP206A :  devid.id
dsPIC33FJ128GP306A :  devid.id
dsPIC33FJ128GP310A :  devid.id
dsPIC33FJ128GP706A :  devid.id
dsPIC33FJ128GP708A :  devid.id
dsPIC33FJ128GP710A :  devid.id
dsPIC33FJ128MC506A :  devid.id
dsPIC33FJ128MC510A :  devid.id
dsPIC33FJ128MC706A :  devid.id
dsPIC33FJ128MC708A :  devid.id
dsPIC33FJ128MC710A :  devid.id
dsPIC33FJ256GP506A :  devid.id
dsPIC33FJ256GP510A :  devid.id
dsPIC33FJ256GP710A :  devid.id
dsPIC33FJ256MC510A :  devid.id
dsPIC33FJ256MC710A :  devid.id
dsPIC33FJ32GS406 :  software userid.min userid.max devid.id
dsPIC33FJ32GS606 :  software userid.min userid.max devid.id
dsPIC33FJ32GS608 :  software userid.min userid.max devid.id
dsPIC33FJ32GS610 :  software userid.min userid.max devid.id
dsPIC33FJ64GP206A :  devid.id
dsPIC33FJ64GP306A :  devid.id
dsPIC33FJ64GP310A :  devid.id
dsPIC33FJ64GP706A :  devid.id
dsPIC33FJ64GP708A :  devid.id
dsPIC33FJ64GP710A :  devid.id
dsPIC33FJ64GS406 :  software userid.min userid.max devid.id
dsPIC33FJ64GS606 :  software userid.min userid.max devid.id
dsPIC33FJ64GS608 :  software userid.min userid.max devid.id
dsPIC33FJ64GS610 :  software userid.min userid.max devid.id
dsPIC33FJ64MC506A :  devid.id
dsPIC33FJ64MC508A :  devid.id
dsPIC33FJ64MC510A :  devid.id
dsPIC33FJ64MC706A :  devid.id
dsPIC33FJ64MC710A :  devid.id
PIC24HJ64GP206A :  devid.id
PIC24HJ64GP210A :  devid.id
PIC24HJ64GP506A :  devid.id
PIC24HJ64GP510A :  devid.id
PIC24HJ128GP206A :  devid.id
PIC24HJ128GP210A :  devid.id
PIC24HJ128GP306A :  devid.id
PIC24HJ128GP310A :  devid.id
PIC24HJ128GP506A :  devid.id
PIC24HJ128GP510A :  devid.id
PIC24HJ256GP206A :  devid.id
PIC24HJ256GP210A :  devid.id
PIC24HJ256GP610A :  devid.id
PIC18F66J90 :  software
PIC18F66J93 neu in der Datenbank,  supported
PIC18F67J90 :  software
PIC18F67J93 neu in der Datenbank,  supported
PIC18F86J60 :  wait.pgm
PIC18F86J65 :  wait.pgm
PIC18F86J72 neu in der Datenbank,  supported
PIC18F86J90 :  software
PIC18F86J93 neu in der Datenbank,  supported
PIC18F87J60 :  wait.pgm
PIC18F87J72 neu in der Datenbank,  supported
PIC18F87J90 :  software
PIC18F87J93 neu in der Datenbank,  supported
PIC18F96J60 :  wait.pgm
PIC18F96J65 :  wait.pgm
PIC18F97J60 :  wait.pgm
PIC18F13K22 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18F13K50 :  eedata.max taktik.erase taktik.cp taktik.read_eeprom
PIC18F14K22 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18F14K50 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18F23K20 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18F23K22 neu in der Datenbank,  supported
PIC18F24K20 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18F24K22 neu in der Datenbank,  supported
PIC18F25K20 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18F25K22 neu in der Datenbank,  supported
PIC18F26K20 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18F26K22 neu in der Datenbank,  supported
PIC18F43K20 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18F43K22 neu in der Datenbank,  supported
PIC18F44K20 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18F44K22 neu in der Datenbank,  supported
PIC18F45K20 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18F45K22 neu in der Datenbank,  supported
PIC18F46K20 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18F46K22 neu in der Datenbank,  supported
PIC18LF13K22 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18LF13K50 :  eedata.max taktik.erase taktik.cp taktik.read_eeprom
PIC18LF14K22 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18LF14K50 :  taktik.erase taktik.cp taktik.read_eeprom
PIC18LF23K22 neu in der Datenbank,  supported
PIC18LF24K22 neu in der Datenbank,  supported
PIC18LF25K22 neu in der Datenbank,  supported
PIC18LF26K22 neu in der Datenbank,  supported
PIC18LF43K22 neu in der Datenbank,  supported
PIC18LF44K22 neu in der Datenbank,  supported
PIC18LF45K22 neu in der Datenbank,  supported
PIC18LF46K22 neu in der Datenbank,  supported







Ende

sprut
(www.sprut.de)






