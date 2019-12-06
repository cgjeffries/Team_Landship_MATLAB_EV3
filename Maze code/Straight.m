%Made by Zoe
%input is a float in half inches
function Straight(x)
    global MOTOR_DRIVE;
    global brick;
    

    MOVEFACTOR = 6.25;
    SPEED = 80;
    angle = x * (1/6.8) * 360;
    Shift("straight");
    brick.MoveMotorAngleRel(MOTOR_DRIVE, SPEED, angle*MOVEFACTOR);
    brick.WaitForMotor(MOTOR_DRIVE);
    %pause(1);
end
