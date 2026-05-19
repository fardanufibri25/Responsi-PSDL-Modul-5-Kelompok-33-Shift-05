module fsm_mealy(
    input wire clk,
    input wire reset,
    input wire ce,
    input wire w,
    output reg y,
    output wire [1:0] state_display
);

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;

    reg [1:0] curr, next;

    assign state_display = curr;

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
                next = (w) ? S2 : S0;
            end

            S2: begin
                y = 1'b0;
                next = (w) ? S2 : S3;
            end

            S3: begin
                if (w) begin
                    y = 1'b1;
                    next = S1;
                end else begin
                    y = 1'b0;
                    next = S0;
                end
            end

            default: begin
                y = 1'b0;
                next = S0;
            end
        endcase
    end

endmodule
