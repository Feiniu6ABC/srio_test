module FD #(
    parameter INIT = 1'b0  
)(
    input wire C,          // Clock input
    input wire D,          // Data input
    output reg Q           // Data output
);

initial begin
    Q = INIT;
end

always @(posedge C) begin
    Q <= D;
end

endmodule
