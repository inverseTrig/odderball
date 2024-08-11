include <../config.scad>;
use <../modules/shapes.scad>;
use <../modules/plate.scad>;

module pmw3610Cover(){

    module boltHoles(){

        boltCutout = SCREW_INSERT_DIAMETER + BOLT_TOLERENCE * 2;
        cutoutLength = SENSOR_PCB_MOUNT_OFFSET - PMW_PCB_MOUNT_OFFSET + boltCutout;

        translate([0, PMW_PCB_MOUNT_OFFSET + (cutoutLength - boltCutout ) / 2])
            squircle([boltCutout, boltCutout], boltCutout, true);

        translate([0, -PMW_PCB_MOUNT_OFFSET - (cutoutLength - boltCutout) / 2])
            squircle([boltCutout, boltCutout], boltCutout, true);
    }
    
    module pcbHeatInsertHoles(){
        boltCutout = SCREW_INSERT_DIAMETER + BOLT_TOLERENCE * 2;
        cutoutLength = SENSOR_PCB_MOUNT_OFFSET - PMW_PCB_MOUNT_OFFSET + boltCutout;
        
        translate([PMW3610_PCB_WIDTH_SCREW_DISTANCE / 2, PMW3610_PCB_HEIGHT_SCREW_DISTANCE / 2])
            squircle([boltCutout, boltCutout], boltCutout, true);
        
        translate([-PMW3610_PCB_WIDTH_SCREW_DISTANCE / 2, PMW3610_PCB_HEIGHT_SCREW_DISTANCE / 2])
            squircle([boltCutout, boltCutout], boltCutout, true);
        
        translate([PMW3610_PCB_WIDTH_SCREW_DISTANCE / 2, -PMW3610_PCB_HEIGHT_SCREW_DISTANCE / 2])
            squircle([boltCutout, boltCutout], boltCutout, true);

        translate([-PMW3610_PCB_WIDTH_SCREW_DISTANCE / 2, -PMW3610_PCB_HEIGHT_SCREW_DISTANCE / 2])
            squircle([boltCutout, boltCutout], boltCutout, true);
    }

    difference(){

        union(){
            linear_extrude(getStandoffHeight())
                difference(){

                    union(){
                        square([PMW_PCB_WIDTH, PMW_PCB_HEIGHT], center = true);
                        offset(1.5)
                            boltHoles();
                    }

                    boltHoles();

                    pcbHeatInsertHoles();

                    // laser channel
                    squircle(
                        size = [SENSOR_CHANNEL_WIDTH, SENSOR_CHANNEL_HEIGHT],
                        radius = 1,
                        center = true);
                }

            translate([0, 0, -1])
                linear_extrude(getStandoffHeight() + 1)
                    difference() {
                        offset(1.5)
                            pcbHeatInsertHoles();
                        pcbHeatInsertHoles();
                    }
        }


        // cutout for trackball
        translate([0, 0, TRACKBALL_POSITION_Z + getStandoffHeight()])
            sphere(d = TRACKBALL_DIAMETER + SENDOR_TRACKBALL_CLEARANCE);
    }
}

pmw3610Cover($fn = 20);