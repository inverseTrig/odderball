include <../config.scad>;
use <../modules/plate.scad>;
use <../modules/keys.scad>;

mirror([1,0,0]){
        plate(
            keyPositions = FINGER_GRID,
            keyHeight = 1.0,
            boltPositions = FINGER_BOLT_HOLES,
            cutHoles = true,
            $fn = 100);
}