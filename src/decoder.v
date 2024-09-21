module seg7(
  imput wire [3:0] digit,
  output reg [6:0] segments
);
  always@(*) begin
    case (digit)
    4'd0: segments = 7'b0111101; //d
    4'd0: segments = 7'b1110111; //A
    4'd0: segments = 7'b0000101; //r
    4'd0: segments = 7'b0000100; //i
    4'd0: segments = 7'b0011101; //o
    default: segments = 7'b0000000; //Blank (off)
    endcase
  end
endmodule
