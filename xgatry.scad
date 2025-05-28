/* [ Options ] */

include_gantry = true;

include_keepout = true;

$fn=120;


module tab(n,joiner) {
    linear_extrude(4) difference()
    {
        offset(2) offset(-2) translate([-3,-4*n]) square([10.0,8*n]);
        for(i = [0:n-1]) {
            translate([3.5, i*8-4*n+4]) circle(3/2);
        }
    }
    k = 1.1;
    linear_extrude(5) translate([-joiner,-4*n]) square([joiner-k,8*n]);
}

module cabletie() {
    translate([0,0,1])
    linear_extrude(4)
    difference() {
        circle(6);
        circle(4);
    }
}


if(1) {
    difference() {

        union() {
            if(include_gantry)
            {
                // load the opulu gantry, at the origin
                rotate(180,[1,0,0])
                import("x-gantry-front_1x.stl");
            }

            translate([-46, -11]) rotate(180,[0,0,1]) tab(4,10);
            translate([46, -11]) tab(4,10);

            translate([-46, 59]) rotate(180,[0,0,1]) tab(4,2);
            translate([46, 51]) tab(2,2);

            translate([18, 102]) rotate(45,[0,0,1]) tab(3,2);
            translate([-18, 102]) rotate(45+90,[0,0,1]) tab(3,2);
        }

        translate([46,85]) cabletie();

        translate([32,-30]) cabletie();
        translate([-32,-30]) cabletie();
    }

}

if(include_keepout) {
    color([0.5,0.5,0.5])
    translate([-100,8,0])
    linear_extrude(1)
    square([200,34]);
}
