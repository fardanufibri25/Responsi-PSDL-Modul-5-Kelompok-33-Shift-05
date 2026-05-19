module fsm_moore(
    input wire clk,
    input wire reset,
    input wire ce,
    input wire w,
    output reg y,
    output wire [1:0] state_display
);

    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;

    reg [2:0] curr, next;

    assign state_display = curr[1:0];

    always @(posedge clk or posedge reset) begin
        if (reset)
            curr <= S0;
        else if (ce)
            curr <= next;
    end

    always @(*) begin
        y = 1'b0;
        next = curr;

        case (curr)
            S0: begin
                y = 1'b0;
                next = (w) ? S1 : S0;
            end

            S1: begin
                y = 1'b0;
                next = (w) ? S1 : S2;
            end

            S2: begin
                y = 1'b0;
                next = (w) ? S3 : S0;
            end

            S3: begin
                y = 1'b0;
                next = (w) ? S4 : S2;
            end

            S4: begin
                y = 1'b1;
                next = (w) ? S1 : S2;
            end

            default: begin
                y = 1'b0;
                next = S0;
            end
        endcase
    end

endmodule
