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

    // Test 1: No sensor
    D = 0; W = 0; M = 0;
    #10;
    if (Master_Alarm == 0)
        $display("TEST 1 PASS: No sensor activated");
    else
        $display("TEST 1 FAIL");

    // Test 2: Motion
    D = 0; W = 0; M = 1;
    #10;
    if (Motion_Alarm == 1 && Master_Alarm == 1)
        $display("TEST 2 PASS: Motion sensor activated");
    else
        $display("TEST 2 FAIL");

    // Test 3: Window
    D = 0; W = 1; M = 0;
    #10;
    if (Window_Alarm == 1 && Master_Alarm == 1)
        $display("TEST 3 PASS: Window sensor activated");
    else
        $display("TEST 3 FAIL");

    // Test 4: Window + Motion
    D = 0; W = 1; M = 1;
    #10;
    if (Window_Alarm == 1 && Motion_Alarm == 1)
        $display("TEST 4 PASS: Window and Motion activated");
    else
        $display("TEST 4 FAIL");

    // Test 5: Door
    D = 1; W = 0; M = 0;
    #10;
    if (Door_Alarm == 1 && Master_Alarm == 1)
        $display("TEST 5 PASS: Door sensor activated");
    else
        $display("TEST 5 FAIL");

    // Test 6: Door + Motion
    D = 1; W = 0; M = 1;
    #10;
    if (Door_Alarm == 1 && Motion_Alarm == 1)
        $display("TEST 6 PASS: Door and Motion activated");
    else
        $display("TEST 6 FAIL");

    // Test 7: Door + Window
    D = 1; W = 1; M = 0;
    #10;
    if (Door_Alarm == 1 && Window_Alarm == 1)
        $display("TEST 7 PASS: Door and Window activated");
    else
        $display("TEST 7 FAIL");

    // Test 8: All sensors
    D = 1; W = 1; M = 1;
    #10;
    if (Door_Alarm == 1 &&
        Window_Alarm == 1 &&
        Motion_Alarm == 1 &&
        Master_Alarm == 1)
        $display("TEST 8 PASS: All sensors activated");
    else
        $display("TEST 8 FAIL");

    $display("======================================");
    $display("SMART HOME SECURITY SIMULATION COMPLETE");
    $display("======================================");

    $finish;

end

endmodule