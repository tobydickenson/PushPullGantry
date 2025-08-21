/* [ Options ] */

include_gantry = true;
include_gantry_boss = true;
include_hook = true;
include_screw_mount = true;

$fn=120;

offset_y = 4;
offset_z = -7;

baseline_hy = 28.3;
baseline_hz = 4.9;

hy = baseline_hy + offset_y;
hz = baseline_hz + offset_z;


hook_depth = 4.95;
hook_depth_heel = 4;
hole_diameter = 8.04;
r = hole_diameter/2;

if(1)
{
    if(include_gantry)
    {
        // load the opulu gantry, at the origin
        rotate(45,[0,0,1])
        translate([-23.05,23.75,7.5])
        rotate(90,[0,1,0])
        import("import/z-gantry_2x.stl");
    }

    translate([19.3,0,0])
    rotate(-90,[0,0,1])
    rotate(90,[1,0,0])
    linear_extrude(4.6)
    offset(.5) offset(-.5)
    difference()
    {
        union()
        {
            hull()
            {
                if(include_gantry_boss)
                polygon([[14,10],
                        [14,18],
                        [-9,35],
                        [-10,35],
                        [-10,24],
                        [12,10],
                        ]);

                if(include_hook)
                difference()
                {
                    union()
                    {
                        translate([hy,hz-10]) circle(r+4);
                        translate([hy,hz+1]) circle(r+4);
                    }
                    // remove a rectangle below the hook
                    polygon([
                        [14,hz-hook_depth-hook_depth_heel],
                        [100,hz-hook_depth-hook_depth_heel],
                        [100,-100],
                        [14,-100],
                    ]);
                }

                if(include_screw_mount)
                polygon([[14.2,0],
                         [23,00],
                         [23,30],
                         [14.2,30]
                         ]);
            }
        }

        // remove the hook center
        hull()
        {
            translate([hy,hz]) circle(r);
            translate([hy,hz-10]) circle(r);
        }

        if(include_hook)
        union()
        {
            // remove a lead-in
            polygon([
                [hy,hz+r],
                [hy+r+0.2,hz-hook_depth],
                [hy,hz-hook_depth],
            ]);

            // remove a rectangle below the hook
            polygon([
                [14,hz-hook_depth-hook_depth_heel],
                [100,hz-hook_depth-hook_depth_heel],
                [100,-100],
                [14,-100],
            ]);
            // remove a rectangle below the hook
            polygon([
                [hy,hz-hook_depth],
                [100,hz-hook_depth],
                [100,-100],
                [hy,-100],
            ]);
        }

        if(include_screw_mount)
        for(i = [0:2])
        {
            // slot between adjacent gripper arms
            translate([18.5, 5 + 10*i]) circle(3/2);
        }

    }
}


