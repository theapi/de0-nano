
/*
VGA Demo 800x480 at 58Hz

The screen I'm using
http://www.amazon.co.uk/gp/product/B00IR5VRS4?psc=1&redirect=true&ref_=oh_aui_detailpage_o00_s01

http://www.adafruit.com/datasheets/KD50G21-40NT-A1.pdf
if these timings fail, try http://www.adafruit.com/datasheets/AT070TN94.pdf

Pixel Clock (MHz): 30.000 
Horizontal (in Pixels)
    Active Video: 800 
    Front Porch:   40 
    Sync Pulse:   48 
    Back Porch:    88 
        Total pixel clock ticks: 976
Vertical (in Lines)
    Active Video: 480 
    Front Porch:   13 
    Sync Pulse:     3 
    Back Porch:    32 
        Total pixel clock ticks: 528 

Total pixel clock ticks: 692,640
30,000,000 / 515,328 = 58.215350224 = 58Hz

1 pixel clock = 1/30Mhz = 33ns = 0.033us

*/

module vga_demo
    (
        CLOCK_PIXEL,
        RESET,
        VGA_RED,
        VGA_GREEN,
        VGA_BLUE,
        VGA_HS,
        VGA_VS
    );
    input CLOCK_PIXEL;
    input RESET;
    output VGA_RED;
    output VGA_GREEN;
    output VGA_BLUE;
    output VGA_HS;
    output VGA_VS;

    /* Internal registers for horizontal signal timing */
    reg [10:0] hor_reg; // to count up to 975
    reg hor_sync;
    wire hor_max = (hor_reg == 975); // to tell when a line is full

    /* Internal registers for vertical signal timing */
    reg [9:0] ver_reg; // to count up to 527
    reg ver_sync;
    reg red, green, blue;
    wire ver_max = (ver_reg == 527); // to tell when a line is full

    // Code

    /* Running through line */
    always @ (posedge CLOCK_PIXEL or posedge RESET) begin

        if (RESET) begin 
            hor_reg <= 0;
            ver_reg <= 0;
        end
        else if (hor_max) begin
            hor_reg <= 0;

            /* Running through frame */
            if (ver_max)
                ver_reg <= 0;
            else
            ver_reg <= ver_reg + 1;

        end else
            hor_reg <= hor_reg + 1;

    end
    
    always @ (posedge CLOCK_PIXEL or posedge RESET) begin
    
        if (RESET) begin 
            hor_sync <= 0;
            ver_sync <= 0;
            red <= 0;
            green <= 0;
            blue <= 0;
        end
        else begin

            /* Generating the horizontal sync signal */
            if (hor_reg == 840)      // video (800) + front porch (40)
                hor_sync <= 1;       // turn on horizontal sync pulse
            else if (hor_reg == 928) // video (800) + front porch (40) + Sync Pulse (88)
                hor_sync <= 0;       // turn off horizontal sync pulse

            /* Generating the vertical sync signal */
            if (ver_reg == 493)      // LINES: video (480) +  front porch (13)
                ver_sync <= 1;       // turn on vertical sync pulse
            else if (ver_reg == 496) // LINES: video (480) + front porch (13) + Sync Pulse (3)
                ver_sync <= 0;       // turn off vertical sync pulse

                
            // black during the porches
            if (ver_reg > 480 || hor_reg > 800) begin
                red <= 0;
                green <= 0;
                blue <= 0;
            end
            else begin
                
                // Draw a single square.
                if (hor_reg >= 100 && hor_reg <= 200 && ver_reg >= 100 && ver_reg <= 200) begin
                    red <= 1;
                    green <= 1;
                    blue <= 1;
                end 
                
                // top border
                else if (ver_reg == 0 ) begin
                    red <= 0;
                    green <= 1;
                    blue <= 0;
                end
                
                // bottom border
                else if (ver_reg == 478 ) begin // Not quite 480 visable
                    red <= 0;
                    green <= 1;
                    blue <= 0;
                end
                
                // left border
                else if (hor_reg == 0 ) begin
                    red <= 1;
                    green <= 0;
                    blue <= 0;
                end
                
                // right border
                else if (hor_reg == 780 ) begin // Not quite 800 visable
                    red <= 1;
                    green <= 0;
                    blue <= 0;
                end
                
                else begin
                    red <= 0;
                    green <= 0;
                    blue <= 1;
                end
            end
        end
    end

    // Send the sync signals to the outputh.
    // this doc says pulse is positive http://tinyvga.com/vga-timing/800x600@72Hz
    assign VGA_HS = hor_sync;
    assign VGA_VS = ver_sync;
 
    assign VGA_RED =  red;
    assign VGA_GREEN = green;
    assign VGA_BLUE = blue;
    

    
endmodule

