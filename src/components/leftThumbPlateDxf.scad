include <../config.scad>;
use <../modules/plate.scad>;
use <../modules/keys.scad>;

    plate(
        keyPositions = THUMB_GRID,
        keyHeight = 1.00,
        boltPositions = THUMB_BOLT_HOLES,
        cutHoles = true,
        $fn = 100);
