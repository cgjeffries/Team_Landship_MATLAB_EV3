%Created by Zoe
%No return value, paramater is in degree that you want the entire robot to
%trun ie. left turn is -90
%Direction determind by sign, unsure which is which direction atm

function Turn(x)
    global MOTOR_DRIVE;
    global MOTOR_SHIFT;
    global MOTOR_LIFT;
    global brick;
    fudgeFactor = 1.0;
    GEAR_RATIO = 6.0;
    SPEED = 100;
    Shift("turn")
    
    if(x > 0)
        x = x * 1.05;
    end
    %incert code to shift to trun mode
    %x will be in degree to turn robot, so this is a guess convertion to
    %wheel rotations
    %wheel diameter = 2.125in
    %6.6758
    diameter = 6.6758;
    distance = (x/360) * (4.25 * pi);
    angle = int32((distance/diameter) * 360 * fudgeFactor * GEAR_RATIO); %placeholder
    
    %angle = cast(angle, 'double');
    
    Shift("turn");
    %turns only one wheel
    start = brick.GetMotorAngle(MOTOR_DRIVE);
    %start = cast(start, 'double');
    brick.MoveMotorAngleRel(MOTOR_DRIVE, SPEED, angle);
    brick.WaitForMotor(MOTOR_DRIVE);
    
%    while (abs((brick.GetMotorAngle(MOTOR_DRIVE) - start) - angle) > 10)
%           fprintf("Error: %f\n", abs((brick.GetMotorAngle(MOTOR_DRIVE) - start) - angle));
%            pause(0.05);
%    end
    
    pause(2);

end
