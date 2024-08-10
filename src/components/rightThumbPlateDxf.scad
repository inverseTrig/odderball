include <../config.scad>;
use <../modules/plate.scad>;
use <../modules/keys.scad>;



mirror([1,0,0]){
plate(
            keyPositions = THUMB_TRACKBALL_GRID,
            keyHeight = 1.00,
            boltPositions = THUMB_TRACKBALL_BOLT_HOLES,
            cutHoles = true,
            hull = true,
            $fn = 100);
}