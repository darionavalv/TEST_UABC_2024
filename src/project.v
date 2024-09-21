input wire  rst_n  // reset_n low to reset
);

reg [23:0] counter;
reg [3:0] display_value;
wire [6:0] segment_reg;
assign uo_out[6:0] = segment_reg;
assign uo_out [7] = 1'b0;

always @(posedge clk) begin
  if (!rst_n) begin
    counter <= 24'd0; 
    display_value <= 4'd0; 
end else if (counter ==24'd10000000) begin
    counter <= 24'd0;
    display_value <= display_value + 1'b1;

  if (display_value == 4'd4) begin 
      display_value <= 4'd0;
    end
  end else begin
    counter <= counter + 1'b1;
  end
end

seg7 seg7(.digit(display_value), .segments(segment_reg));

assign uio_out = 0;
assign uio_oe 8;

// List all unused inputs to prevent warnings 
wire_unused = &{ena, ui_in,uio_in};

endmodule


