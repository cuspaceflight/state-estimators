#include <messaging_all.h>
#include "ch.h"
#include "hal.h"
#include "mpu9250.h"
#include "ms5611.h"
#include "adis16405.h"
#include "ublox.h"
#include "badthinghandler.h"
#include "util/calibration.h"
#include "spalaxconf.h"
#include "util/board_config.h"

static THD_WORKING_AREA(waMPU, 1024);
static THD_WORKING_AREA(waBadThing, 1024);
static THD_WORKING_AREA(waMS5611, 768);
static THD_WORKING_AREA(waCalibration, 512);
static THD_WORKING_AREA(waADIS, 1024);
static THD_WORKING_AREA(waGPS, 1024);

int main(void) {
	halInit();
	chSysInit();
	chRegSetThreadName("Main");

    messaging_all_start();

	extStart(&EXTD1, &extcfg);

	board_config_t* config = getBoardConfig();

	chThdCreateStatic(waBadThing, sizeof(waBadThing), NORMALPRIO, bthandler_thread, NULL);
	chThdCreateStatic(waMPU, sizeof(waMPU), NORMALPRIO, mpu9250_thread, NULL);
	chThdCreateStatic(waMS5611, sizeof(waMS5611), NORMALPRIO, ms5611_thread, NULL);
	chThdCreateStatic(waCalibration, sizeof(waCalibration), NORMALPRIO, calibration_thread, NULL);
	chThdCreateStatic(waGPS, sizeof(waGPS), NORMALPRIO, ublox_thread, NULL);

	if (config->has_adis)
		chThdCreateStatic(waADIS, sizeof(waADIS), NORMALPRIO, adis16405_thread, NULL);

	while (true) {
		chThdSleepMilliseconds(TIME_INFINITE);
	}
}
