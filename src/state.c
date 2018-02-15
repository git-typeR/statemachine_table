#include <stdio.h>
#include "state.h"


/**
* \brief 
* \author TypeR
* \version 1.0.0
* \date 2017-
* \warning As this program is being developed, the specification may change.
*/

/** file */


// prepare action function in each statement
static STATE_T action_s1_e1(STATE_T current_state, EVENT_T new_event);
static STATE_T action_s1_e2(STATE_T current_state, EVENT_T new_event);
static STATE_T action_s2_e1(STATE_T current_state, EVENT_T new_event);
static STATE_T action_s2_e2(STATE_T current_state, EVENT_T new_event);
static STATE_T action_s3_e1(STATE_T current_state, EVENT_T new_event);
static STATE_T action_s3_e2(STATE_T current_state, EVENT_T new_event);

/*
abstract table
         |    event 1     |    event 2
---------|--------------------------------
 state 1 |  next state 1  |  next state 2
 state 2 |  next state 2  |  next state 3
 state 3 |  next state 2  |  next state 3


concrete table
         |    STOP        |    START
---------|--------------------------------
 INIT    |    INIT        |    WAIT
 WAIT    |    INIT        |    ACTIVE
 ACTIVE  |    WAIT        |    ACTIVE


function applied to the table
         |    STOP        |    START
---------|---------------------------------
 INIT    |  action_s1_e1  |  action_s1_e2
 WAIT    |  action_s2_e1  |  action_s2_e2
 ACTIVE  |  action_s3_e1  |  action_s3_e2

*/

const fpAction state_table[MAX_STATES][MAX_EVENTS] = {
    {action_s1_e1, action_s1_e2},  // procedures for state 1
    {action_s2_e1, action_s2_e2},  // procedures for state 2
    {action_s3_e1, action_s3_e2}   // procedures for state 3
};

static STATE_T action_s1_e1(STATE_T current_state, EVENT_T new_event)
{
    printf("action_s1_e1\n");
    printf("current state: INIT\n");
    printf("next state -> INIT\n");
    return (INIT);
}

static STATE_T action_s1_e2(STATE_T current_state, EVENT_T new_event)
{
    printf("action_s1_e2\n");
    printf("current state: INIT\n");
    printf("next state -> WAIT\n");
    return (WAIT);
}

static STATE_T action_s2_e1(STATE_T current_state, EVENT_T new_event)
{
    printf("action_s2_e1\n");
    printf("current state: WAIT\n");
    printf("next state -> INIT\n");
    return (INIT);
}

static STATE_T action_s2_e2(STATE_T current_state, EVENT_T new_event)
{
    printf("action_s2_e2\n");
    printf("current state: WAIT\n");
    printf("next state -> ACTIVE\n");
    return (ACTIVE);
}

static STATE_T action_s3_e1(STATE_T current_state, EVENT_T new_event)
{
    printf("action_s3_e1\n");
    printf("current state: ACTIVE\n");
    printf("next state -> WAIT\n");
    return (WAIT);
}

static STATE_T action_s3_e2(STATE_T current_state, EVENT_T new_event)
{
    printf("action_s3_e2\n");
    printf("current state: ACTIVE\n");
    printf("next state -> ACTIVE\n");
    return (ACTIVE);
}

