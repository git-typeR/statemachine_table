# statemachine_table



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


