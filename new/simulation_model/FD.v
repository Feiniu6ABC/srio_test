module FD #(
    parameter INIT = 1'b0  // 默认初始值为0
)(
    input wire C,          // Clock input
    input wire D,          // Data input
    output reg Q           // Data output
);

// 在时钟上升沿捕获数据，并设置初始值
initial begin
    Q = INIT;
end

always @(posedge C) begin
    Q <= D;
end

endmodule
