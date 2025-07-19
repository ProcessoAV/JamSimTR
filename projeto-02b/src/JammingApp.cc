#include "JammingApp.h"
#include "inet/common/packet/Packet.h"
#include "inet/physicallayer/wireless/common/base/packetlevel/NoiseBase.h"

using namespace inet;

Define_Module(JammingApp);

void JammingApp::initialize(int stage) {
    ApplicationBase::initialize(stage);
    if (stage == INITSTAGE_LOCAL) {
        startTime = par("startTime");
        stopTime = par("stopTime");
    }
    if (stage == INITSTAGE_APPLICATION_LAYER) {
        scheduleAt(startTime, new cMessage("startJamming"));
        scheduleAt(stopTime, new cMessage("stopJamming"));
    }
}

void JammingApp::handleMessage(cMessage *msg) {
    if (strcmp(msg->getName(), "startJamming") == 0) {
        startJamming();
    } else if (strcmp(msg->getName(), "stopJamming") == 0) {
        endSimulation(); // ou apenas cancelar eventos futuros de jamming
    }
    delete msg;
}

void JammingApp::startJamming() {
    for (int i = 0; i < 1000; i++) {
        auto packet = new Packet("JammingNoise");
        auto noise = makeShared<physicallayer::NoiseBase>();
        packet->insertAtFront(noise);
        send(packet, "out");
    }
}
