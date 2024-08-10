include <../config.scad>;
use <../modules/pcb.scad>;
use <../modules/plate.scad>;
use <../modules/keys.scad>;

    plate(
        keyPositions = FINGER_GRID,
        keyHeight = 1.0,
        boltPositions = FINGER_BOLT_HOLES,
        cutHoles = true,
        $fn = 100);
 