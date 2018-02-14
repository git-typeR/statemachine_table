#include <stdio.h>
#include "state.h"



EVENT_T get_new_event(void);



int main(void)
{
    STATE_T current_state = INIT;
    EVENT_T new_event     = STOP;

    while (1){
        new_event = get_new_event(); // get the next event to process
        if (((0 <= new_event) && (new_event < MAX_EVENTS)) && ((0 <= current_state) && (current_state < MAX_STATES))) {
            // call the action procedure
            current_state = state_table[current_state][new_event] (current_state, new_event);
        } else {
            // invalid event/state - handle appropriately
        }
    }
    return (0);
}


EVENT_T get_new_event(void)
{
    EVENT_T inputEvent = STOP;
    EVENT_T retEvent   = STOP;
    if ((scanf("%o", &inputEvent)) < MAX_EVENTS){
        retEvent = inputEvent;
    } else {
    }
    
    return (retEvent);
}
