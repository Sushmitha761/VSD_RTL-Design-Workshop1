module parking_controller (
    input  wire       clk,
    input  wire       reset,
    input  wire       entry,
    input  wire       exit,
    output reg  [2:0] slot_count,
    output wire       warning,
    output wire       full,
    output wire       empty,
    output reg        gate_open
);

    // Early warning when 3 or more slots are occupied
    assign warning = (slot_count >= 3);

    // Parking status indicators
    assign full  = (slot_count == 4);
    assign empty = (slot_count == 0);

    // Occupancy counter and gate-control logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            slot_count <= 0;
            gate_open  <= 0;
        end else begin
            gate_open <= 0;

            if (entry && !exit && (slot_count < 4)) begin
                slot_count <= slot_count + 1;
                gate_open  <= 1;
            end else if (exit && !entry && (slot_count > 0)) begin
                slot_count <= slot_count - 1;
                gate_open  <= 1;
            end
        end
    end

endmodule
