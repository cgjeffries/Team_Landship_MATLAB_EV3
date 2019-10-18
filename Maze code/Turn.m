%Created by Zoe
%No return value, paramater is in degree that you want the entire robot to
%trun ie. left turn is 90
%Direction determind by sign, unsure which is which direction atm

function Turn(x)
SPEED = 80;
    %incert code to shift to trun mode
    %x will be in degree to turn robot, so this is a guess convertion to
    %wheel rotations
    angle = x/4; %placeholder
    
    %turns only one wheel
    brick.MoveMotorAngleRel(MOTOR_DRIVE, SPEED, angle);

end
