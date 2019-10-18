/******************************************************************************
 *                                                                            *
 *  Unit:         UHB_Driver.h                                                *
 *                                                                            *
 *  Copyright:    (c) Mikroelektronika, 2011.                                 *
 *                                                                            *
 *  Description:  UHB_Driver.c declarations.                                  *
 *                                                                            *
 ****************************       CHANGE LOG       **************************
 * Version | ACTION                                           |  DATE  | SIG  *
 * --------|--------------------------------------------------|--------|----- *
 *         |                                                  |        |      *
 *    0.01 | - Initial release                                | 030511 |  ST  *
 *         |                                                  |        |      *
 ******************************************************************************/
#ifndef __UHB_DRIVER
#define __UHB_DRIVER

void StartProgram();        // Start executing already loaded application code.
void StartBootloader();     // Start with bootloader mode.
char EnterBootloaderMode(); // Mode checker.
#endif