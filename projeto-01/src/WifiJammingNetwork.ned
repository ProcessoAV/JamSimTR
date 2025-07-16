// C:\projects\TR\projeto\src\WifiJammingNetwork.ned
package projeto_protocols_sim;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.diffserv.MultiFieldClassifier;
// import inet.node.inet.StandardHost;
import inet.physicallayer.wireless.common.medium.RadioMedium;
import inet.node.inet.WirelessHost;


network WifiJammingNetwork
{
    @display("bgb=600,400");
    submodules:
        radioMedium: RadioMedium {
            @display("p=100,50");
        }

        configurator: Ipv4NetworkConfigurator {
            @display("p=26,23");
        }

        sender: WirelessHost {
            @display("p=172,182");
            @labels("node");
        }

        receiver: WirelessHost {
            @display("p=472,182");
            @labels("node");
        }

        jammer: WirelessHost {
            @display("p=330,126");
            @labels("node");
        }

}
