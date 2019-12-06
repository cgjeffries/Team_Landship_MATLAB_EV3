%clear all
global brick
%brick = ConnectBrick('TAPPY');
%variables for Motors
global MOTOR_DRIVE;
global MOTOR_SHIFT;
global MOTOR_LIFT;
global MOTOR_SPEED;
%use for all motor speed

%var for if personIsPickedUp
global haveDude; 
brick.MoveMotor(MOTOR_DRIVE, 0); 

pause(2);
brick.playTone(100, 1244.51, 1000);
pause(0.33);
brick.playTone(100, 622.25, 1000);
pause(0.16);
brick.playTone(100, 932.33, 1000);
pause(0.33);
brick.playTone(100, 830.61, 1000);
pause(0.33);
brick.playTone(100, 622.25, 1000);
pause(0.16);
brick.playTone(100, 1244.51, 1000);
pause(0.33);
brick.playTone(100, 932.33, 1000);

MOTOR_DRIVE = 'A';
MOTOR_SHIFT = 'B';
MOTOR_LIFT = 'C';
MOTOR_SPEED = 100;

%var for if personIsPicked up
haveDude = false; 
GEAR_RATIO = 6;
moveTwo = (1200* GEAR_RATIO);

brick.SetColorMode(1,2);
RED = 5;
YELLOW = 4;
GREEN = 3;
COLOR_SENSOR_PORT = 1;
RIGHT_GAP_THRESHOLD = 15;
TARGET_DISTANCE = 10;
kP = 1;
kD = 1;

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
brick.MoveMotor(MOTOR_LIFT,0);
%^callibration for lift^


previousDistance = 0;
firstRun = true;
straightCount = 0;
blindDrive=16;
yeet = 1;
while yeet == 1 % to yeet out of the program
    color = brick.ColorCode(COLOR_SENSOR_PORT);
    switch color
        case RED
              pause(2);
              Straight(2);
           
        case GREEN
             %enter manual control mode = person picking
             blindDrive = 16;
             KeyboardControl(); 
             %set pick up flag (a var) to true
             haveDude = true;
             %move forward six inches
             Straight(8);
        case YELLOW
            if (haveDude)
                blindDrive = 16;
                %drive forward ten inches
                Straight(15);
                %lower fork and drop passenger
                LiftControl(haveDude); 
                yeet = 0;
                return;
            else 
                %dude has not been picked up, and turn around 180 degrees
                Turn(180);
                Straight(9);
            end
            
        otherwise
            %if distance to wall is too far and if not blind driving)
            if ((getDistance() > RIGHT_GAP_THRESHOLD) && (blindDrive >= 16 ))
                blindDrive = 0;
                %Drive forward 4in
                Straight(4);
                %Turn right 90 deg
                Turn(90);
            end
            
            %blind driving
            if(blindDrive < 16)
                blindDrive=blindDrive+1;
            %wall following code    
            else
                %normal algorithm goes here
                
                %check for wall in front every three cycles
                fprintf("straightCount: %d\n", straightCount);
                if(straightCount > 3)
                    %reset the cycle count
                    straightCount = 0;
                    %turn the ultrasonic to face towards the direction of
                    %travel
                    Turn(-90);
                    %reset the wall booleans
                    wallForward = false;
                    wallLeft = false;
                    %If a wall is within 10 inches in the direction of
                    %travel
                    if(getDistance() < 10)
                        %set the forwad wall boolean to true
                        fprintf("There is a wall in front\n");
                        wallForward = true;
                        %Turnt he ultrasonic to face to the left
                        Turn(-90);
                        %if there is a wall on the left
                        if(getDistance() < 10)
                            %sett the left wall boolean to true
                            fprintf("There is a wall to left\n");
                            wallLeft = true;
                        end
                    end
                    %Unless there were walls in both places, we need to
                    %rotate 90 degrees to the right to face our robot in
                    %the direction of travel
                    if((~wallLeft) || (~wallForward))
                        Turn(90);
                    end
                    
                    distance = getDistance();
                    
                    if(firstRun)
                        previousDistance = distance;
                        firstRun = false;
                    end
                    
                    turnAngle = ((distance - TARGET_DISTANCE) * kP) - ((previousDistance - distance) * kD);
                    
                    previousDistance = distance;

                    if(abs(turnAngle) > 8)
                        turnAngle = (abs(turnAngle)/turnAngle) * 8;
                    end

                    if(abs(turnAngle) > 1)
                        fprintf("Adjusting by %f degrees\n", turnAngle);
                        Turn(turnAngle);
                    end
                    
                    
                end
                
                straightCount = straightCount + 1;
                
               
            end
            fprintf("Inching straight\n");
            Straight(1);
    end
    
    %pause(0.1);
    
end