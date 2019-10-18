%variables for Motors
MOTOR_DRIVE = 'A';
MOTOR_SHIFT = 'B';
MOTOR_LIFT = 'C';

brick.SetColorMode(1,2);
RED = 5;
YELLOW = 4;
GREEN = 3;
COLOR_SENSOR_PORT = 2;
RIGHT_GAP_THRESHOLD = 20;

shiftTurnPos;
shiftStraightPos;

brick.moveMotor('B', 20);
pause(0.5);
shiftStraightpos =
brick.moveMotor('B', 0);


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
