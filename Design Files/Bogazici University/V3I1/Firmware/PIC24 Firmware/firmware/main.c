/** \mainpage Firmware
 * \section project_name Project Details
 *	 syncbox \n
 *   \copyright &copy; 2018 Bogazici University \n
 *   License: GNU Public License. \n
 *	 Bogazici University &copy; 2018
 * \section revision_history Revision History
 * <table>
 * <caption id="revision_history_tbl">Revision Summary</caption>
 * <tr><th> revision   <th> details
 * <tr><td>  0.1       <td> Pooling method for UART communication.
 * <tr><td>  0.5       <td> RS-232 Modbus RTU commuication.
 * </table>
 * \note <b> Current Status: under development.</b>
 * \section descriptopn Description
 *	 The syncbox is a device that can control and synctonize ALL
 *	 medical ( and non-medical ) X-ray machine components.
 *	 Usually, these components ( but not confined ) are
 * <ul>
 *	<li> X-ray generator
 *	<li> X-ray detector
 *	<li> ventilator
 *	<li> security, alarm and switches
 *	<li> worksation
 * </ul> 
 *	 Each manufacturer has its own set of communication protocol and
 *	 design specs. The aim of this synchronization box (syncbox) is to abstract
 *	 away all these sort of details and let the workstation software
 *	 ( we have implemented one as <a href="https://github.com/altaybrusan/ibex">iBEX</a>) be free of concerning details.
 *	 At the heart of syncbox there is Computer-On-module-Express(COMe) module
 *	 and a PIC24E  microcontroller.The controller is responsible for high speed
 *	 and accurate signalling and COMe mainly deals with detector's outputs and
 *	 image processing.
 *	 This project is a firmware of the PIC24E and it is responsible
 *	 for communication with
 *   <ul>
 *    <li> "RS-232" based serial generator
 *	  <li> "RS-232 ModBus RTU"  based actuator
 *    <li> "RS-232" based touch screen display
 *    <li> serial communication with worksation machine
 *    <li> external trigger switch
 *   </ul>
 *   The code consists of a kernel and set of APIs that control the devices. Whole machine is
 *   integrated and controlled inside a section which is called instrument. Component diagram 
 *   of the machine is shown bellow.
 *   \image html componentdiagram.png "Component Diagram" 
 *   \image docbook componentdiagram.png "Component Diagram"
 * \section dev_env Developement Environment and Tools
 * <table>
 * <caption id="dev_env_tbl">Environment factors table</caption>
 * <tr><th>  Factor            <th> details
 * <tr><td>  MCU                <td> P24EP512GU810
 * <tr><td>  MCU Dev.Board      <td> EasyPIC Fusion v.7
 * <tr><td>  MCU Oscillator     <td> 140.00 MHz
 * <tr><td>  MCU Compiler       <td> MikroC Pro for dsPIC v.7
 * <tr><td>  MCU Compiler       <td> mikroC PRO for dsPIC v7.0.0  
 * <tr><td>  MCU Ext. Modules   <td> x
 *	</table>               
 *
 *\section refs Refs
	 http://download.mikroe.com/documents/compilers/mikroc/dspic/help/mikroc_libraries.htm \n
	 https://github.com/altaybrusan/ibex
 */

#include"Kernel.h"
#include"Instrument.h"

int  main()
{

	KL_RegisterInstrument(StartInstrument);
	KL_Bootup();

	return 0;
}