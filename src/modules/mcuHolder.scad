include<../config.scad>;
use<../modules/pcb.scad>;

pcb(
    keyPositions = MCU_HOLDER_GRID,
    boltPositions = MCU_HOLDER_BOLT_HOLES,
    $fn = 20);