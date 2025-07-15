package projeto_protocols_sim;

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.networklayer.diffserv.MultiFieldClassifier;
import inet.node.inet.StandardHost;
import inet.physicallayer.wireless.common.medium.RadioMedium;


network WifiJammingNetwork
{
    @display("bgb=600,400");
    submodules:
        radioMedium: RadioMedium {
            @display("p=100,50");
        }

        configurator: Ipv4NetworkConfigurator {
            @display("p=100,100");
        }

        sender: StandardHost {
            @display("p=100,250");
            @labels("node");
        }

        receiver: StandardHost {
            @display("p=300,250");
            @labels("node");
        }
        
       // jammer: StandardHost {
        //    @display("p=200,150");
        //    @labels("node");
        //}
}
