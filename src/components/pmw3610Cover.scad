use<../modules/pmw3610Cover.scad>;

// can print without supports upside down
rotate([180,0,0])
    pmw3610Cover($fn = 100);
