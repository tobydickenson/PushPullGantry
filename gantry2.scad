$fn=120;

hy = 28;
hz = 15;
r = 4.1;

if(1)
{
    if(1)
    {
        // load the opulu gantry, at the origin
        rotate(45,[0,0,1])
        translate([-23.05,23.75,7.5])
        rotate(90,[0,1,0])
        import("z-gantry_2x.stl");
    }

    translate([19.3,0,0])
    rotate(-90,[0,0,1])
    rotate(90,[1,0,0])
    linear_extrude(4.6)
    union()
    {
        difference()
        {
            polygon([[5,0],
                    [14,0],
                    [hy-r-0.5,  hz-r-1],
                    [hy,      hz+r],
                    [hy+r+0.5,  hz-r-1],
                    [hy+r+4-0.8,hz-r-1],
                    [hy+r+4,hz-r-1+1.6],
                    [hy+r+4,hz+r],
                    [hy+4,  hz+r+4],
                    [0,35],
                    [-10,35],
                    [-10,5],
                    [0,5],
                    ]);

            hull()
            {
                translate([hy,hz]) circle(r);
                translate([hy,-10]) circle(r);
            }
        }
    }
}


if(0)
{
    translate([10,0,0])
    {
        difference()
        {
            // load our first gantry, at the origin
            translate([-125,19.1,-83.8])
            rotate(90,[1,0,0])
            import("hook_original.stl");

            translate([-88,-50,-10]) linear_extrude(100) square(100,100);
        }
    }
}



