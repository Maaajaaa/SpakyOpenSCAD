/*
MacrOscope (actually Macr○scope) by Mattis Männel alias SparkyCola
free available at https://github.com/SparkyCola/SpakyOpenSCAD
- License: Creative Commons BY-SA 3.0 (http://creativecommons.org/licenses/by-sa/3.0/)
- Designed to hold a lens on a Xperia Sp (with case)
- Easily adaptable for any phone which has the camera in the center of the backside
last edit: 13.11.2016
*/
include<nutsnbolts/cyl_head_bolt.scad>
//get this library at https://github.com/JohK/nutsnbolts and add it to your libraries foler (File -> Show Library Folder...)
$fn=300;

//diameter of the lens (you might add a few 10th to have a not too tight fit (0.1) worked fine for me (measured diameter: 16mm))
lens_diameter = 16.1;       //default: 16.1
//length of the lens (can be a bit shorter than the actual length of the lens)
lens_length = 15;           //default: 15
//lenght of the mainplate (width of your phone with case (if any))
//values under 73 might lead to issues with the text - if this happen just change the font size
mainplate_lenght = 73;      //default: 73

//fontsize of "Macr"
fontsize_a = 8.5;           //default: 8.5
//fontsize of "scope"
fontsize_b = 7;             //default: 7
//Font of the text (see Help -> Font List for a list of the available fonts on your PC)
//Hint: you can get the default font (Ubuntu) at http://font.ubuntu.com/ for free however it should be obviously preinstalled on (K-,X-)Ubuntu-machines
font = "Ubuntu";            //default: "Ubuntu"


difference(){
    union(){
        //lens holder
        rotate([0,0,0])hexagon(lens_length, lens_diameter+5);
        //mainplate
        translate([0,0,2])cube([11.5,mainplate_lenght,4],center=true);
        //right rubberband holder
        hull(){
            translate([-1.75,35.5,1])cube([3.5,4,3]);
            translate([-1.75,33.5,0])cube([3.5,4,2]);
        }
        //left rubberband holder
        hull(){
            translate([-1.75,-39.5,1])cube([3.5,4,3]);
            translate([-1.75,-38,0])cube([3.5,4,2]);
        }
    }
    //space for the lens
    cylinder(lens_length,d=lens_diameter);
    //space on the right
    translate([-1.75,37.5,2.4])cube([3.5,1,2]);
    //space on the left
    translate([-1.75,-38.5,2.4])cube([3.5,1,2]);
}
//text "Macr(O)scope" (the lens is the "O")
translate([0,-10.5,4])rotate([0,0,90])linear_extrude(height=0.5)text("Macr",fontsize_a,"Ubuntu",halign="right",valign="center");
translate([1,10.5,4])rotate([0,0,90])linear_extrude(height=0.5)text("scope",fontsize_b,"Ubuntu",halign="left",valign="center");

//see  https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_the_2D_Subsystem#regular_polygon for reference
module hexagon(height, diameter)
{
    cylinder(height, d=diameter, $fn=6);
}    