/* [ Options ] */

include_gantry = true;

$fn=120;


module tab() {
    linear_extrude(4) difference()
    {
        offset(2) offset(-2) translate([-2,-8]) square([12,16]);
        translate([5, 4]) circle(3/2);
        translate([5, -4]) circle(3/2);
    }
    linear_extrude(8) translate([-4,-8]) square([4,16]);
}

module cabletie() {
    translate([0,0,2.5])
    linear_extrude(4)
    difference() {
        circle(6);
        circle(4);
    }
}


if(1) {
    difference() {

        if(include_gantry)
        {
            // load the opulu gantry, at the origin
            rotate(180,[1,0,0])
            import("x-gantry-front_1x.stl");
        }

        translate([52,85]) cabletie();
    }

    translate([46, -12]) tab();
    translate([46, 51]) tab();

}

