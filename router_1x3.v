//==============================================================
// 1x3 Router Module for Network-on-Chip (NoC)
//==============================================================

module router_1x3 (

    input clk,
    input reset,
    input valid_in,

    input [1:0] sel,          // Route select signal
    input [7:0] data_in,      // Input packet

    output reg [7:0] data_out0,
    output reg [7:0] data_out1,
    output reg [7:0] data_out2,

    output reg valid_out0,
    output reg valid_out1,
    output reg valid_out2

);

//==============================================================
// FSM States
//==============================================================

localparam IDLE = 2'b00;
localparam SEND = 2'b01;

reg [1:0] current_state;
reg [1:0] next_state;


//==============================================================
// State Register
//==============================================================

always @(posedge clk or posedge reset)
begin

    if(reset)
        current_state <= IDLE;
    else
        current_state <= next_state;

end


//==============================================================
// Next State Logic
//==============================================================

always @(*)
begin

    next_state = current_state;

    case(current_state)

        IDLE:
        begin
            if(valid_in)
                next_state = SEND;
            else
                next_state = IDLE;
        end

        SEND:
        begin
            next_state = IDLE;
        end

        default:
        begin
            next_state = IDLE;
        end

    endcase

end


//==============================================================
// Output Logic
//==============================================================

always @(posedge clk or posedge reset)
begin

    if(reset)
    begin

        data_out0 <= 8'd0;
        data_out1 <= 8'd0;
        data_out2 <= 8'd0;

        valid_out0 <= 1'b0;
        valid_out1 <= 1'b0;
        valid_out2 <= 1'b0;

    end

    else
    begin

        // Default outputs

        valid_out0 <= 1'b0;
        valid_out1 <= 1'b0;
        valid_out2 <= 1'b0;

        case(current_state)

            SEND:
            begin

                case(sel)

                    2'b00:
                    begin
                        data_out0 <= data_in;
                        valid_out0 <= 1'b1;
                    end

                    2'b01:
                    begin
                        data_out1 <= data_in;
                        valid_out1 <= 1'b1;
                    end

                    2'b10:
                    begin
                        data_out2 <= data_in;
                        valid_out2 <= 1'b1;
                    end

                    default:
                    begin

                        data_out0 <= 8'd0;
                        data_out1 <= 8'd0;
                        data_out2 <= 8'd0;

                        valid_out0 <= 1'b0;
                        valid_out1 <= 1'b0;
                        valid_out2 <= 1'b0;

                    end

                endcase

            end

            default:
            begin

                valid_out0 <= 1'b0;
                valid_out1 <= 1'b0;
                valid_out2 <= 1'b0;

            end

        endcase

    end

end

endmodule