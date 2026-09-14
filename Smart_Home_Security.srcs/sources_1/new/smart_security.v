module smart_security(
    input D,
    input W,
    input M,

    output Door_Alarm,
    output Window_Alarm,
    output Motion_Alarm,
    output Master_Alarm
);

assign Door_Alarm   = D;
assign Window_Alarm = W;
assign Motion_Alarm = M;

assign Master_Alarm = D | W | M;

endmodule