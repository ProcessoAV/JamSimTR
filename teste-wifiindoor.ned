import inet.commom.figures.DelegateSignalConfigurator;
import inet.networklayer.configurator.ipv4.IPV4NetworkConfigurator;
import inet.node.inet.INetworkNode;
import inet.physicallayer.contract.packetlevel.IRadioMedium;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;


network recording
{
    @display("bgb=450,500);

    @figure[rcvdPKText] (type=indicatorText; pos=420,20; anchor=w, font=,20; textFormat="pacotes recebidos: %g"; initialValue=0);
    @statistic[rcvdPk] (source=hostB_rcvdPk; record=figure(count); targetFigure=rcvdPKText);
    @signal[hostB_rcvdPk];
    @delegatesignal[rcvdPk] (source=hostB.udbApp[0].rcvdPk; target=hostB_rcvdPk);

    submodules:
        hostA: <"WirelessHost"> like INetworkNode(
            @display("p=25,250");
        )
        hostB: <"WirelessHost"> like INetworkNode(
            @display("p=425,250");
        )
        radioMedium: <"IdealRadioMedium"> like IRadiumMedium(
            @display("p=557,80");
        )
        configurator: IPV4NetworkConfigurator(
            @display("p=558,164");
        )
        figureHelper: DelegateSignalConfigurator(
            @display(""p=558,242");
        )
        visualizer: INtegratedCanvasVisualizer(
            @display("p=558,313");
        )
}