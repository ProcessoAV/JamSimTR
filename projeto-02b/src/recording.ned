// C:\projects\TR\projeto\projeto-02b\src\recording.ned
package src;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.AdhocHost;
import inet.physicallayer.wireless.common.medium.RadioMedium;
import inet.visualizer.common.IntegratedVisualizer;

network recording
{
    @display("bgb=600,400");
    @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

    @figure[rcvdPKText](type=indicatorText; pos=380,20; anchor=w; font=,18; textFormat="pacotes recebidos: %g"; initialValue=0);
    @statistic[packetReceived](source=receiver.app[0].packetReceived; record=figure(count); targetFigure=rcvdPKText);

    submodules:
        radioMedium: RadioMedium {
            @display("p=66,103");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=130,28");
        }
        sender: AdhocHost {
            @display("p=100,300");
        }
        receiver: AdhocHost {
            @display("p=500,300");
        }

        visualizer: IntegratedVisualizer { // animação de feedback dos sinais
            @display("p=45,28");
        }
        jammer: AdhocHost {
        	@display("p=300,200"); // Ajuste posição próximo do caminho sender -> receiver
    	}
}
