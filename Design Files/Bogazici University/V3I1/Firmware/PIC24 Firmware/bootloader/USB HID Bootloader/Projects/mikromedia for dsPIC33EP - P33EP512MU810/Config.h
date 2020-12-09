/******************************************************************************
 *                                                                            *
 *  Unit:         Config.h                                                    *
 *                                                                            *
 *  Copyright:    (c) Mikroelektronika, 2011.                                 *
 *                                                                            *
 *  Description:  Config.c declarations and some more.                        *
 *                                                                            *
 *  Requirements: PIC24FJ specific.                                           *
 *                                                                            *
 *  Migration:    Along with Config.c, this is the only file in this          *
 *                project that might need to be adjusted when migrating.      *
 *                Switching to another MCU within PIC24FJ family              *
 *                of microcontrollers, in most cases, will not require any    *
 *                change here :)                                              *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
#ifndef __CONFIG
#define __CONFIG

#include <Types.h>

extern const unsigned long BOOTLOADER_SIZE;   // Bootloader size.
extern const unsigned long BOOTLOADER_START;  // Bootloader start address.
extern const unsigned char RESET_VECTOR_SIZE; // MCU reset vector size.

extern const TBootInfo BootInfo;              // Bootloader info record,
                                              // containing device specific information.

extern unsigned char HidReadBuff[64];         // USB HID read buffer.
extern unsigned char HidWriteBuff[64];        // USB HID write buffer.

// Flash write and erase block sizes are MCU dependent.
// To reduce confusion and errors, these routines might not have
// uniform names between different MCUs/architectures.
// Consult library manager for target MCU's flash handling routine names.
// and adjust defines below.
#define FLASH_Write FLASH_Write_Compact       // flash write (196 bytes)
#define FLASH_Erase FLASH_Erase               // flash erase (1536 bytes)

#define _FLASH_ERASE 1024*3                   // flash erase block size
#define _FLASH_WRITE_LATCH   128*3            // flash write block size

void Config();                                // multi purpose configuration routine
#endif