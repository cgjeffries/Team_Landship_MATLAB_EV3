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
shiftStraightPos = brick.GetMotorAngle(MOTOR_SHIFT) + 5;
brick.MoveMotor(MOTOR_SHIFT, 20);
pause(1.0);
shiftTurnPos = brick.GetMotorAngle(MOTOR_SHIFT) - 5;
brick.MoveMotor(MOTOR_SHIFT, 0);


KeyboardControl;


while true
    color = brick.ColorCode(COLOR_SENSOR_PORT);
    switch color
        case RED
            
            break;
        case GREEN
            
            break;
        case YELLOW
            
            break;
        otherwise
            if getDistance() > RIGHT_GAP_THRESHOLD
                Straight(4);
                
            else
                
            end
            break;
    end
    
end
