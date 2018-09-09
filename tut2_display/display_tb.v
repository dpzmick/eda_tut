module my_design;
    task print; // what is a task?
        $display("I am in %m");
    endtask
endmodule

module test_display;

    reg [8*100:0] my_string;
    reg [15:0]    my_number;

    my_design md();

    initial begin

        // display string
        $display("Hello world");
        my_string = "This is my string";
        $display("my_string is: \"%0s\"", my_string);

        // display decimal, binary, hex
        my_number = 8'h1a;
        $display("Decimal: %0d", my_number); // xxxx means we didn't init
        $display("Binary:  %0b", my_number);
        $display("Hex:  :  %0h", my_number);

        // display hierarchical name, figure out where you are
        $display("I am in %m");
        md.print; // neato

        // display time
        $display("Now (sim time) %t fake_time %t", $time, 123); // weird spacing again

        #11;
        $display("Now (sim time) %t fake_time %t", $time, 123); // weird spacing again

        // long message display
        // can make string that is concat of a bunch of other strings, wow!
        my_string = {"This is a very, very long and detailed message",
                     " but isn't really all that important!"};
        $display("My string %0s", my_string);
    end
endmodule
