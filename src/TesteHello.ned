package projeto_protocols_sim;

simple TesteHello {
    parameters:
        @display("i=block");
}

network HelloNetwork {
    submodules:
        node: TesteHello {
            @display("p=100,100");
        }
}
