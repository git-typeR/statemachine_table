#ifndef STATE_H
#define STATE_H


typedef enum{
    STOP,     // e1
    START,    // e2
    MAX_EVENTS
} EVENT_T;  

typedef enum{
    INIT,     // s1
    WAIT,     // s2
    ACTIVE,   // s3
    MAX_STATES
} STATE_T;


typedef STATE_T (*fpAction)(STATE_T current_state, EVENT_T new_event);
extern const fpAction state_table[MAX_STATES][MAX_EVENTS];

#endif //STATE_H

