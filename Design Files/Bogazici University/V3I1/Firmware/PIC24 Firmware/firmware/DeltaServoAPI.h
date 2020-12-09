#ifndef DELTASERVOAPI_H
  #define DELTASERVOAPI_H

/**
 * \file DeltaServoAPI.h
 * \brief API for communicating with x-ray arm transform motor.
 *
 * \details The table top arm motor is drived by DeltaB2 driver and this API controls that.
 * The driver supports Modbus RTU for communication. Instead of complete Modebus RTU protocol
 * implementation, this API sends protocol-compatible packets to the DeltaB2.
 * \n In order to find out the commands, first, the servo driver is connected to a PC on which 
 * ASDA soft version 5.3 ( Delta servo motor driver software) was running. 
 * The motor is controlled by the software while the channel was sniffing by 
 * Device Monitoring Studio version 7.73. In this way the set of all required 
 * commands are found and hard coded them in this API.
 * \note based on device specifications befor and after transmission 10ms 
 * of scilence in channel is required.
 * \note all operations are based on modebus command code 16 (0x10). 
 * \note there is JUST one slave with address 127.
 *
 * 
 * <table>
 * <caption id="example command">Delta Servo motor example</caption>
 * <tr><th> Description              <th> Byte one   <th> Byte two
 * <tr><td> slave address            <td> 0X01       <td>  -
 * <tr><td> function                 <td> 0x10       <td>  -
 * <tr><td> starting data address    <td> 0X01(high) <td> 0x12(low)
 * <tr><td> number of data (in word) <td> 0x00(high) <td> 0x02(low)
 * <tr><td> number of data (in byte) <td> 0x04       <td> -
 * <tr><td> content of 1st data      <td> 0x0B(high) <td> 0xB8(low)
 * <tr><td> content of 2st data      <td> 0x00(high) <td> 0x00(low)
 * <tr><td> CRC                      <td> 0xFC (low) <td> 0xEB (high)
 * </table>
 * 
 * The complete list of commands is shown in the following table:
 * <table>
 * <caption id="DeltaServoFormat">Command sets</caption>
 * <tr><th> command        <th> address     <th> function code <th> start address     <th> #word      <th> #bytes     <th> bytes                <th> CRC
 * <tr><td> TURN ON MOTOR  <td> 0x7F        <td>  0x10         <td> 0X02 0X3C         <td>  0X00 0X02 <td>  0X04      <td> 0X00 0X01 0X00 0X00 	<td> 0X26 0X67
 * <tr><td> TURN OFF MOTOR <td>	0x7F 		<td>  0x10		   <td> 0X02 0X3C		  <td>  0X00 0X02 <td>	0X04	  <td> 0X00 0X00 0X00 0X00	<td> 0X77 0XA7
 * <tr><td> SPEED 100	   <td>	0x7F 		<td>  0x10		   <td> 0X04 0X0A		  <td>  0X00 0X02 <td>	0X04	  <td> 0X00 0X64 0X00 0X00	<td> 0X9E 0XE6
 * <tr><td> ROTATE CCW	   <td>	0x7F 		<td>  0x10		   <td> 0X04 0X0A		  <td>  0X00 0X02 <td>	0X04	  <td> 0X13 0X86 0X00 0X00	<td> 0X3A 0X54
 * <tr><td> ROTATE CW	   <td>	0x7F 		<td>  0x10		   <td> 0X04 0X0A		  <td>  0X00 0X02 <td>	0X04	  <td> 0X13 0X87 0X00 0X00	<td> 0X6B 0X94
 * <tr><td> STOP ROTATION  <td>	0x7F  	    <td>  0x10		   <td> 0X04 0X0A		  <td>  0X00 0X02 <td>	0X04	  <td> 0X00 0X00 0X00 0X00	<td> 0XDF 0X39
 * </table>
 *
 * \note before and after transmission 10ms of scilence is needed.
 *
 * \author Altay Brusan
 */


  #include "Types.h"
  #include "ConnectionMap.h"

   //! \brief define minimum motor jog.
  extern const int MIN_MOTOR_JOG ;
  //! \brief define maximum motor jog.
  extern const int MAX_MOTOR_JOG ;
  
  //void SetConnectionToRS232Modbus();    TODO: implement this
  //! \brief turn on slider motor on.
  void TurnOnSliderMotor();
  //! \brief turn off slider motor on.
  void TurnOffSliderMotor();
  //! \brief set slider motor speed.
  void SetSliderMotorSpeed(int);
  //! \brief start slider motor to rotate counter clockwise.
  void RotateSliderMotorCounterClockwise();
  //! \brief start slider motor to rotate clockwise.
  void RotateSliderMotorClockwise();
  //! \brief stop slider motor.
  void StopMotor();


  void ActuatorProcessKernelFrame(KERNEL_FRAME);
#endif