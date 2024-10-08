include <../config.scad>;
use <../modules/plate.scad>;
use <../modules/keys.scad>;

linear_extrude(PLATE_THICKNESS)
    plate(
        keyPositions = THUMB_GRID,
        keyHeight = 1.00,
        boltPositions = THUMB_BOLT_HOLES,
        cutHoles = true,
        $fn = 100);
    
if(DRAW_DEBUG)
    %keys(
        keyPositions = THUMB_GRID,
        keyHeight = 1.00,
        $fn = 20);