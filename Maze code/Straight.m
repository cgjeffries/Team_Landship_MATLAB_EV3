%Made by Zoe
%input is a float in inches
function Straight(x)
    global MOTOR_DRIVE;
    global brick;
    
    SPEED = 80;
    angle = (x/6.8) * 360;
    Shift("straight");
    brick.MoveMotorAngleRel(MOTOR_DRIVE, SPEED, angle);
end
