package src;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.physicallayer.wireless.common.medium.RadioMedium;
import inet.visualizer.common.IntegratedVisualizer;
import inet.node.inet.WirelessHost;
import inet.physicallayer.wireless.common.contract.packetlevel.IRadioMedium;

network recording
{
    //@display("bgb=650,500; bgg=100,1,grey95");
    @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

    @figure[rcvdPKText](type=indicatorText; pos=380,20; anchor=w; font=,18; textFormat="pacotes recebidos: %g"; initialValue=0);
    @statistic[packetReceived](source=hostB.app[0].packetReceived; record=figure(count); targetFigure=rcvdPKText);

    submodules:
        hostA: WirelessHost {
            @display("p=50,325");
        }
        hostB: WirelessHost {
            @display("p=450,325");
        }
        radioMedium: <default("UnitDiskRadioMedium")> like IRadioMedium {
            @display("p=500,125");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=500,200");
        }
        visualizer: IntegratedVisualizer {
            @display("p=500,275");
        }
}
