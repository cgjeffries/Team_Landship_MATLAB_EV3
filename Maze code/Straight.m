%Made by Zoe
%input is a float in inches
function Straight(x)
    SPEED = 80;
    angle = (x/6.8) * 360;
    Shift("straight");
    brick.MoveMotorAngleRel(MOTOR_DRIVE, SPEED, angle);
end
