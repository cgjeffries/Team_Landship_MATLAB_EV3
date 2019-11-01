%clear all
global brick;
%brick = ConnectBrick('TacoBrick');
%CHANGE BRICK MODE TO SPROCKET
brick = SimBrick();
brick.conn.write('SET simulateClutch 1 1');
brick.conn.write('SET motorRange 3 -31 31');
brick.conn.write('SET motorRange 2 -2000 2000');
brick.conn.write('SET driveGearRatio 0.1666666 1.0');
brick.conn.write('SET effectiveWheelbase 4.45');

%variables for Motors
global MOTOR_DRIVE;
global MOTOR_SHIFT;
global MOTOR_LIFT;
global MOTOR_SPEED;
%use for all motor speed

%var for if personIsPickedUp
global haveDude; 

MOTOR_DRIVE = 'A';
MOTOR_SHIFT = 'B';
MOTOR_LIFT = 'C';
MOTOR_SPEED = 100;

%var for if personIsPicked up
haveDude = 'false'; 
GEAR_RATIO = 6;
moveTwo = (130 * GEAR_RATIO);

global RED;
global YELLOW;
global GREEN;
global COLOR_SENSOR_PORT;
global RIGHT_GAP_THRESHOLD;
%brick.SetColorMode(1,2);
RED = 5;
YELLOW = 4;
GREEN = 3;
COLOR_SENSOR_PORT = 2;
RIGHT_GAP_THRESHOLD = 20;

global shiftTurnPos;
global shiftStraightPos;
%callibration for shift motor
brick.MoveMotor(MOTOR_SHIFT, -20);
pause(1.0);
shiftStraightPos = brick.GetMotorAngle(MOTOR_SHIFT) + 2;
brick.MoveMotor(MOTOR_SHIFT, 20);
pause(1.0);
shiftTurnPos = brick.GetMotorAngle(MOTOR_SHIFT) - 2;
brick.MoveMotor(MOTOR_SHIFT, 0);
%^callibration for shift motor^

global liftTopPos;
global liftBottomPos;

%callibration for lift
brick.MoveMotor(MOTOR_LIFT, 20)
pause(4.0);
liftTopPos = brick.GetMotorAngle(MOTOR_LIFT) - 10;
%^callibration for lift^


KeyboardControl;


while true
    color = brick.ColorCode(COLOR_SENSOR_PORT)
    switch color
        case RED
              pause(2);
              brick.MotorMotorAngleRel('Motor_Drive', MOTOR_SPEED, 200);

            break;
        case GREEN
             %enter manual control mode = person picking
             KeyboardControl(); 
             %set pick up flag (a var) to true
             haveDude = 'true';
             %move forward six inches
             brick.MotorMotorAngleRel('Motor_Drive', MOTOR_SPEED, moveTwo * 3);
            break;
        case YELLOW
            if strcmp('true', haveDude) == 0
                %drive forward ten inches
                brick.MoveMotorAngleRel('Motor_Drive', MOTOR_SPEED, moveTwo * 5);
                %lower fork and drop passenger
                haveDude = LiftControl(-1); 
                exit;
            else 
                %dude has not been picked up, and turn around 180 degrees
                turn(180);
            end
            break;
        otherwise
            %code commented out until getDistance() works
            
            %if getDistance() > RIGHT_GAP_THRESHOLD
                Straight(4); 
           % else
                
            %end
            break;
    end
    
end