`timescale 1ns / 1ps

module smart_security_tb;

reg D;
reg W;
reg M;

wire Door_Alarm;
wire Window_Alarm;
wire Motion_Alarm;
wire Master_Alarm;

smart_security uut (
    .D(D),
    .W(W),
    .M(M),
    .Door_Alarm(Door_Alarm),
    .Window_Alarm(Window_Alarm),
    .Motion_Alarm(Motion_Alarm),
    .Master_Alarm(Master_Alarm)
);

initial begin

    // 000 - No sensor
    D = 0; W = 0; M = 0;
    #10;

    // 001 - Motion
    D = 0; W = 0; M = 1;
    #10;

    // 010 - Window
    D = 0; W = 1; M = 0;
    #10;

    // 011 - Window + Motion
    D = 0; W = 1; M = 1;
    #10;

    // 100 - Door
    D = 1; W = 0; M = 0;
    #10;

    // 101 - Door + Motion
    D = 1; W = 0; M = 1;
    #10;

    // 110 - Door + Window
    D = 1; W = 1; M = 0;
    #10;

    // 111 - All sensors
    D = 1; W = 1; M = 1;
    #10;

    $finish;

end

endmodule