#include "spalaxconf.h"
#include "mpu9250.h"

const EXTConfig extcfg = { {
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 0 */
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 1 */
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 2 */
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 3 */
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 4 */
                     { EXT_CH_MODE_AUTOSTART, NULL }, /* Pin 5 */
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 6 */
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 7 */
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 8 */
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 9 */
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 10*/
                     { EXT_CH_MODE_AUTOSTART | EXT_CH_MODE_RISING_EDGE | EXT_MODE_GPIOB, mpu9250_wakeup }, /* Pin 11*/
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 12*/
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 13*/
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 14*/
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 15*/
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 16*/
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 17*/
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 18*/
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 19*/
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 20*/
                     { EXT_CH_MODE_DISABLED, NULL }, /* Pin 21*/
                     { EXT_CH_MODE_DISABLED, NULL } /* Pin 22*/
                 } };
