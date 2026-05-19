module top(
    input wire clk_100MHz,     // Pin E3
    input wire sw0,            // Input w, Pin J15
    input wire btnc,           // Enter, Pin N17
    input wire btnd,           // Reset, Pin P18
    output wire led_y,         // Output y, LD0 Pin H17
    output wire led_hb,        // Heartbeat, LD15 Pin V11
    output wire [6:0] seg,     // Katoda 7-segment
    output wire [7:0] an       // Anoda 7-segment
);

    wire enter_p, rst_l, y;
    wire [1:0] st;

    debouncer db_enter (
        .clk(clk_100MHz),
        .btn_in(btnc),
        .btn_pulse(enter_p),
        .btn_level()
    );

    debouncer db_reset (
        .clk(clk_100MHz),
        .btn_in(btnd),
        .btn_pulse(),
        .btn_level(rst_l)
    );

    clock_divider hb (
        .clk_100MHz(clk_100MHz),
        .reset(rst_l),
        .ce_2s(),
        .led_hb(led_hb)
    );

    fsm_mealy fsm (
        .clk(clk_100MHz),
        .reset(rst_l),
        .ce(enter_p),
        .w(sw0),
        .y(y),
        .state_display(st)
    );

    display disp (
        .clk(clk_100MHz),
        .w_in(sw0),
        .y_out(y),
        .state(st),
        .seg(seg),
        .an(an)
    );

    assign led_y = y;

endmodule
