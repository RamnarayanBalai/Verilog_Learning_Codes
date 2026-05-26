`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2026 22:21:14
// Design Name: 
// Module Name: UDL_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module UDL_counter
    #(parameter N=4)
    (
        input clk,
        input reset_n,
        input enable,
        input up,
        input load,
        input [N-1:0] D,
        output [N-1:0] Q
    );
    
    reg [N-1:0] Q_reg, Q_next;
    
    always @(posedge clk, negedge reset_n)
    begin: reg_logic
        if(!reset_n)
            Q_reg <= 1'b0;
        else
            Q_reg <= Q_next;
    end
    
    always@(*)
    begin: comb_logic
        if(enable)
        begin
//            if(up)
//            begin
//                if(load)
//                    Q_next = D;
//                 else
//                    Q_next = Q_reg + 1'b1;
//            end
//            else
//            begin
//                if(load)
//                    Q_next = D;
//                 else
//                    Q_next = Q_reg - 1'b1;
//            end
                casex({up,load})
                    2'b00:  Q_next = Q_reg - 1'b1;
                    2'b10:  Q_next = Q_reg + 1'b1;
                    2'bx1:  Q_next = D;
                    default: Q_next = Q_reg + 1'b1;
                endcase
         end
        else
            Q_next = Q_reg;
    end
    assign Q= Q_reg;
endmodule
