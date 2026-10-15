module sequence_detector (
    input wire clk,
    input wire reset,
    input wire din,
    output reg detected
);

    reg [2:0] state, next_state;

    localparam S0 = 3'd0,
               S1 = 3'd1,
               S2 = 3'd2,
               S3 = 3'd3,
               S4 = 3'd4,
               S5 = 3'd5;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        detected = 1'b0;

        case (state)
            S0: next_state = din ? S1 : S0;
            S1: next_state = din ? S1 : S2;
            S2: next_state = din ? S3 : S0;
            S3: next_state = din ? S1 : S4;
            S4: next_state = din ? S5 : S0;

            S5: begin
                if (din) begin
                    detected = 1'b1;
                    next_state = S3;
                end else begin
                    next_state = S2;
                end
            end

            default: next_state = S0;
        endcase
    end

endmodule
