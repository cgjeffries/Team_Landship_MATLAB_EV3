%clear all
global brick
%brick = ConnectBrick('TacoBrick');
%variables for Motors
global MOTOR_DRIVE;
global MOTOR_SHIFT;
global MOTOR_LIFT;

MOTOR_DRIVE = 'A';
MOTOR_SHIFT = 'B';
MOTOR_LIFT = 'C';

brick.SetColorMode(1,2);
RED = 5;
YELLOW = 4;
GREEN = 3;
COLOR_SENSOR_PORT = 2;
RIGHT_GAP_THRESHOLD = 20;

global shiftTurnPos;
global shiftStraightPos;

brick.MoveMotor(MOTOR_SHIFT, -20);
pause(1.0);
shiftStraightPos = brick.GetMotorAngle(MOTOR_SHIFT) + 2;
brick.MoveMotor(MOTOR_SHIFT, 20);
pause(1.0);
shiftTurnPos = brick.GetMotorAngle(MOTOR_SHIFT) - 2;
brick.MoveMotor(MOTOR_SHIFT, 0);

global liftTopPos;
global liftBottomPos;

brick.MoveMotor(MOTOR_LIFT, 20)
pause(4.0);
liftTopPos = brick.GetMotorAngle(MOTOR_LIFT) - 10;



KeyboardControl;


while true
    color = brick.ColorCode(COLOR_SENSOR_PORT);
    switch color
        case RED
              %stop for two seconds
              %go forward 2 inches

            break;
        case GREEN
             %enter manual control mode = person picking
             %wait for manual control mode to finish
             %set pick up flag (a var) to true
             %drive forward 6 inches
             %go back to checking if ground if red, green, yellow

            break;
        case YELLOW
            %if (personPickedUp) drive forward ten inches, lower fork, and drop passenger - - then exit
            % else - - determine if distance
            break;
        otherwise
            if getDistance() > RIGHT_GAP_THRESHOLD
                Straight(4);
                
            else
                
            end
            break;
    end
    
end