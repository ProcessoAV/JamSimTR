#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/internet-module.h"
#include "ns3/wifi-module.h"
#include "ns3/mobility-module.h"
#include "ns3/applications-module.h"
#include "ns3/flow-monitor-module.h"

using namespace ns3;

NS_LOG_COMPONENT_DEFINE ("WifiJammerScenario");

int main (int argc, char *argv[])
{
  NodeContainer nodes;
  nodes.Create (3);
  YansWifiChannelHelper channel;
  channel.SetPropagationDelay ("ns3::ConstantSpeedPropagationDelayModel");
  channel.AddPropagationLoss ("ns3::FriisPropagationLossModel");

  YansWifiPhyHelper phy;
  phy.SetChannel (channel.Create ());

  WifiHelper wifi;
  wifi.SetRemoteStationManager ("ns3::ConstantRateWifiManager",
                                "DataMode", StringValue ("OfdmRate6Mbps"));

  WifiMacHelper mac;
  mac.SetType ("ns3::AdhocWifiMac");

  NetDeviceContainer devices = wifi.Install (phy, mac, nodes);

  MobilityHelper mobility;
  mobility.SetPositionAllocator ("ns3::GridPositionAllocator",
                                 "MinX", DoubleValue (0.0),
                                 "MinY", DoubleValue (0.0),
                                 "DeltaX", DoubleValue (10.0),
                                 "GridWidth", UintegerValue (3),
                                 "LayoutType", StringValue ("RowFirst"));
  mobility.SetMobilityModel ("ns3::ConstantPositionMobilityModel");
  mobility.Install (nodes);

  InternetStackHelper stack;
  stack.Install (nodes);

  Ipv4AddressHelper address;
  address.SetBase ("10.1.1.0", "255.255.255.0");
  Ipv4InterfaceContainer interfaces = address.Assign (devices);

  uint16_t port = 9;

  //  sender
  OnOffHelper sender ("ns3::UdpSocketFactory",
                      InetSocketAddress (interfaces.GetAddress (1), port));
  sender.SetAttribute ("DataRate", StringValue ("1Mbps"));
  sender.SetAttribute ("PacketSize", UintegerValue (1024));
  sender.SetAttribute ("StartTime", TimeValue (Seconds (1.0)));
  sender.SetAttribute ("StopTime", TimeValue (Seconds (10.0)));
  sender.Install (nodes.Get (0));

  // reeiver
  PacketSinkHelper sink ("ns3::UdpSocketFactory",
                         InetSocketAddress (Ipv4Address::GetAny (), port));
  ApplicationContainer receiverApp = sink.Install (nodes.Get (1));
  receiverApp.Start (Seconds (0.0));
  receiverApp.Stop (Seconds (11.0));

  // jammer
  OnOffHelper jammer ("ns3::UdpSocketFactory",
                      InetSocketAddress (interfaces.GetAddress (1), port));
  jammer.SetAttribute ("DataRate", StringValue ("5Mbps"));
  jammer.SetAttribute ("PacketSize", UintegerValue (1024));
  jammer.SetAttribute ("StartTime", TimeValue (Seconds (2.0)));
  jammer.SetAttribute ("StopTime", TimeValue (Seconds (9.0)));
  jammer.Install (nodes.Get (2));

  // Monitoramento
  FlowMonitorHelper flowmon;
  Ptr<FlowMonitor> monitor = flowmon.InstallAll ();

  Simulator::Stop (Seconds (12.0));
  Simulator::Run ();

  monitor->SerializeToXmlFile ("jammer-results.xml", true, true);

  // log,tirando XML
  FlowMonitor::FlowStatsContainer stats = monitor->GetFlowStats ();

  for (const auto& flow : stats)
    {
      uint32_t flowId = flow.first;
      FlowMonitor::FlowStats flowStats = flow.second;

      std::cout << "Flow " << flowId << " stats:\n";
      std::cout << "  Tx Packets: " << flowStats.txPackets << "\n";
      std::cout << "  Rx Packets: " << flowStats.rxPackets << "\n";
      std::cout << "  Lost Packets: " << flowStats.lostPackets << "\n";

      double duration = flowStats.timeLastRxPacket.GetSeconds () - flowStats.timeFirstTxPacket.GetSeconds ();
      double throughputKbps = 0.0;
      if (duration > 0)
        {
          throughputKbps = (flowStats.rxBytes * 8.0) / duration / 1000;
        }
      std::cout << "  Throughput: " << throughputKbps << " Kbps\n";

      if (flowStats.rxPackets > 0)
        {
          double averageDelayMs = flowStats.delaySum.GetSeconds() / flowStats.rxPackets * 1000;
          std::cout << "  Average Delay: " << averageDelayMs << " ms\n";
        }
      else
        {
          std::cout << "  Average Delay: N/A (no received packets)\n";
        }

      if (flowStats.rxPackets > 1)
        {
          double averageJitterMs = flowStats.jitterSum.GetSeconds() / (flowStats.rxPackets - 1) * 1000;
          std::cout << "  Average Jitter: " << averageJitterMs << " ms\n";
        }
      else
        {
          std::cout << "  Average Jitter: N/A (not enough packets)\n";
        }

      std::cout << std::endl;
    }

  NS_LOG_UNCOND ("Simulação finalizada!");
  Simulator::Destroy ();
  return 0;
}