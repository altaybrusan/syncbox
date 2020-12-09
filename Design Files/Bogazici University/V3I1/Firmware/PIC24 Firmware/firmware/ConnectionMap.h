/** \file ConnectionMap.h
* Contains global configuration and settings of connections.
* Each device type (generator, actuator,etc.) has a special set of connection parameters.
* The ConnectionMap.h stores all these parameters. The \sa kernel.c uses the connection
* parameters to setup the microntroller.
* \note The API's normally do not use ConnectionMap.h unless for debugging. */



/** @name Devices
    There 1:1 map between each DEVICE_TYPE & Communication port
*/
///@{
#define UART1MappedDevice    GENERATOR   /*!< maps UART1MappedDevice to GENERATOR. */
#define UART2MappedDevice    ACTUATOR    /*!< maps UART2MappedDevice to ACTUATOR.*/
#define UART3MappedDevice    WORKSTATION /*!< maps UART3MappedDevice to WORKSTATION.*/
#define UART4MappedDevice    DISPLAY     /*!< maps UART4MappedDevice to DISPLAY.*/
///@}

/** @name MicroC command map
* A set of functions that maps the MicroC UART commands into more readable form.
* \details Kernel.c needs to write into serial ports. To make the Kernel.c more
* clear a set of SendTo macros are defined.
* \note Instead of sending whole message at once, using MikroC \b Uartx_Write_Text,
* charachter based transmission is prefered. In practice, Uartx_Write_Text addes some
* not-wanted charachters to the end of transmitted message. For example, MeSsAgEü  may
* appear instead of !MeSsAgE\r.
*/
///@{

 /*!
 * \brief  rename MicroC UARTx_Write command to SendToGenerator.
 * \param msg charachter to be sent
 */
#define SendToGenerator(msg)     UART1_Write(msg)
 
 /*!
 * \brief  rename MicroC UARTx_Write command to SendToActuator.
 * \param msg charachter to be sent
 */
#define SendToActuator(msg)      UART2_Write(msg)
 
 /*!
 * \brief  rename MicroC UARTx_Write command to SendToWorkstation.
 * \param msg charachter to be sent
 */
#define SendToWorkstation(msg)   UART3_Write(msg)
 
 /*!
 * \brief  rename MicroC UARTx_Write command to SendToDisplay.
 * \param msg charachter to be sent
 */
#define SendToDisplay(msg)       UART4_Write(msg)

 /*!
 * \brief  rename MicroC UARTx_Write command to SendDebugMsg.
 * \details Debugging may require to send \a string.  SendDebugMsg is for this need.
 * \sa SendDebugChr
 * \param  msg charachter string to be sent
 */
#define SendDebugMsg(msg)        UART3_Write_Text(msg)
 
 /*!
 * \brief  rename MicroC UARTx_Write command to SendDebugChr.
 * \details Debugging may require to send \a charachter.  SendDebugChr is for this need.
 * \sa SendDebugMsg
 * \param  msg charachter to be sent
 */
#define SendDebugChr(msg)        UART3_Write(msg)
///@}
 

/** @name UART pin map
 * \details Pins are compatible with PIC Fusion v.7 devboard
 */
///@{
#define MAP_U1RX 100
#define MAP_U1TX 101
#define MAP_U2RX 108
#define MAP_U2TX 109
#define MAP_U3RX 124
#define MAP_U3TX 125
#define MAP_U4RX 112
#define MAP_U4TX 113
///@}

/**  @name serial ports settings
 *   Specify: bitrate, parity, data bit and stop bit.
 */
///@{
#define UART1_BITRATE 9600                 /*!< UART1 bitrate.*/
#define UART1_CONF _UART_8BIT_NOPARITY     /*!< UART1 databit and parity. Refer to mikroC Data/Parity Mode constants.*/
#define UART1_STOPBIT  _UART_ONE_STOPBIT   /*!< UART1 stop bit. Refer to mikroC Stop bits.*/
#define UART1_SPEED _UART_LOW_SPEED        /*!< UART1 High or Low speed. Refer to High/Low Speed.*/

#define UART2_BITRATE 9600				   /*!< UART2 bitrate.*/
#define UART2_CONF _UART_8BIT_NOPARITY     /*!< UART2 databit and parity. Refer to mikroC Data/Parity Mode constants.*/
#define UART2_STOPBIT  _UART_TWO_STOPBITS  /*!< UART2 stop bit. Refer to mikroC Stop bits.*/
#define UART2_SPEED _UART_LOW_SPEED        /*!< UART2 High or Low speed. Refer to High/Low Speed.*/

#define UART3_BITRATE 9600                 /*!< UART3 bitrate.*/
#define UART3_CONF _UART_8BIT_NOPARITY     /*!< UART3 databit and parity. Refer to mikroC Data/Parity Mode constants.*/
#define UART3_STOPBIT  _UART_TWO_STOPBITS  /*!< UART3 stop bit. Refer to mikroC Stop bits.*/
#define UART3_SPEED _UART_LOW_SPEED        /*!< UART3 High or Low speed. Refer to High/Low Speed.*/

#define UART4_BITRATE 9600                 /*!< UART4 bitrate.*/
#define UART4_CONF _UART_8BIT_NOPARITY     /*!< UART4 databit and parity. Refer to mikroC Data/Parity Mode constants.*/
#define UART4_STOPBIT  _UART_TWO_STOPBITS  /*!< UART4 stop bit. Refer to mikroC Stop bits.*/
#define UART4_SPEED _UART_Hi_SPEED         /*!< UART4 High or Low speed. Refer to High/Low Speed.*/
///@}



// UART MESSAGE LENGTH TYPE
// these lengths must be smaller than: MAX_MSG_SIZE
// defined inside the kernel

/**  @name serial connection message terminator
*    Serial connection messages are packed and processed. The messages may have fixed length,
*    finished at a specific delimiter or processed charachter by charachter.
*/
///@{
#define UART1_MSG_LENGTH 0                 /*!< UART1 message length. Zero means messages are not fixed length.*/  
#define UART2_MSG_LENGTH 0                 /*!< UART2 message length. Zero means messages are not fixed length.*/
#define UART3_MSG_LENGTH 0                 /*!< UART3 message length. Zero means messages are not fixed length.*/
#define UART4_MSG_LENGTH 0                 /*!< UART4 message length. Zero means messages are not fixed length.*/

// UART DELIMITER
#define UART1_DELIMITER 0x0d               /*!< UART1 delimiter. Zero means messages are not finished at a specific delimiter.*/
#define UART2_DELIMITER 0                  /*!< UART2 delimiter. Zero means messages are not finished at a specific delimiter.*/
#define UART3_DELIMITER 0                  /*!< UART3 delimiter. Zero means messages are not finished at a specific delimiter.*/
#define UART4_DELIMITER 0                  /*!< UART4 delimiter. Zero means messages are not finished at a specific delimiter.*/

///@}

//SPEEKER PIN MAP
#define MAP_SPK_PIN 3                      /*!< Speaker pin number*/
#define MAP_SPK_PORT &PORTD                /*!< Speaker port name.*/ 

