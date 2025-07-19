//#ifndef SRC_JAMMINGAPP_H_
//#define SRC_JAMMINGAPP_H_
//
//class JammingApp {
//public:
//    JammingApp();
//    virtual ~JammingApp();
//};
//
//#endif /* SRC_JAMMINGAPP_H_ */

#ifndef __SRC_JAMMINGAPP_H_
#define __SRC_JAMMINGAPP_H_

#include "inet/applications/base/ApplicationBase.h"

namespace inet {

class JammingApp : public ApplicationBase
{
  protected:
    simtime_t startTime;
    simtime_t stopTime;

    virtual void initialize(int stage) override;
    virtual void handleMessage(cMessage *msg) override;
    virtual void startJamming();
};

} // namespace inet

#endif
