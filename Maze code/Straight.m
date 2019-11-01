%Made by Zoe
%input is a float in inches
function Straight(x)
    global MOTOR_DRIVE;
    global MOTOR_SHIFT;
    global MOTOR_LIFT;
    global brick;
    GEAR_RATIO = 6.0
    SPEED = 80;
    angle = (x/6.8) * 360 * GEAR_RATIO;
    Shift("straight");
    brick.MoveMotorAngleRel(MOTOR_DRIVE, SPEED, angle);
end
