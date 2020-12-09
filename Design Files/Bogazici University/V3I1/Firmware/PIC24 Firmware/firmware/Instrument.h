#ifndef INSTRUMENT_H
  #define INSTRUMENT_H
/**
 * \file Instrument.h
 * \brief implement the instrument logic. It containts state variables that
 * represent the x-ray machine as-is and update these variables based on received inputs.
 * \details APIs send their events to instrument.c and the decision about the machine state
 * and next state is made there.
 */

//! \brief inception point of the instrument after successfull boot.
void StartInstrument();

#endif