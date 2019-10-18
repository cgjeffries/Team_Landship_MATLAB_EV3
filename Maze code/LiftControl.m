%created by Zoe
%We should still make a calabration function for this motor
%function returns 1 if we have the dude, returns 0 if we have dropped him
%off
%need to add globle variable to determine if we have the dude so the robot
%doesn't stop if it walks into the endzone before picking him up
function haveDude = LiftControl(x)
    SPEED = 30;
    %not sure the amount the motor must be moved until testing
    angle = 360;
    %positive x means we want to pick him up
    if (x > 0) 
        
        brick.MoveMotorAngleRel(MOTOR_LIFT, SPEED , angle);
        haveDude = true;
    %dropes dude off
    else 
        brick.MoveMotorAngleRel(MOTOR_LIFT, SPEED , angle);
        haveDude = false;
    end
end
