// C:\projects\TR\projeto\projeto-02b\src\recording.ned
package src;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.physicallayer.wireless.common.medium.RadioMedium;
import inet.visualizer.common.IntegratedVisualizer;
import inet.node.inet.WirelessHost;
import inet.physicallayer.wireless.common.contract.packetlevel.IRadioMedium;
import inet.physicallayer.wireless.noise.NoiseSource;
import inet.physicallayer.wireless.apsk.packetlevel.ApskDimensionalRadioMedium;
import inet.node.wireless.AccessPoint;

network recording
{
    @display("bgb=650,500;bgg=100,1,grey95");
    @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

    @figure[rcvdPKText](type=indicatorText; pos=380,20; anchor=w; font=,18; textFormat="pacotes recebidos: %g"; initialValue=0);
    @statistic[packetReceived](source=hostB.app[0].packetReceived; record=figure(count); targetFigure=rcvdPKText);

    submodules:
        ap: AccessPoint {
            @display("p=78,278");
        }
        hostA: WirelessHost { // Transmissor
            @display("p=153,182");
        }
        hostB: WirelessHost { // Receptor
            @display("p=151,372");
        }
        //jammer: NoiseSource { // Jammer
        //     @display("p=450,200");
        //}
        radioMedium: ApskDimensionalRadioMedium {
            @display("p=659,26");
        }
        configurator: Ipv4NetworkConfigurator { // config da rede
            @display("p=155,27");
        }
        visualizer: IntegratedVisualizer { // animação de feedback dos sinais
            @display("p=61,27");
        }
}
