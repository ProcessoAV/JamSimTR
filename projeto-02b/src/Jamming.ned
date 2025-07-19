package src;

simple JammingApp
{
    parameters:
        @display("i=block/unknown");
        @implements(inet.applications.contract.IApp);
        double startTime @unit(s);
        double stopTime @unit(s);
    gates:
        input in;
        output out;
}
