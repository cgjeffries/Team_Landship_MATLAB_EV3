function Shift(mode)
    global MOTOR_DRIVE;
    global MOTOR_SHIFT;
    global MOTOR_LIFT;
    global brick;
    
    global shiftTurnPos;
    global shiftStraightPos;
    SHIFT_SPEED = 20;
    %MOTOR_SHIFT = 'B';
    if mode == "straight"
        disp MOTOR_SHIFT
        brick.MoveMotorAngleAbs(MOTOR_SHIFT, SHIFT_SPEED, shiftStraightPos);
        brick.WaitForMotor(MOTOR_SHIFT);
    elseif mode == "turn"
        brick.MoveMotorAngleAbs(MOTOR_SHIFT, SHIFT_SPEED, shiftTurnPos);
        brick.WaitForMotor(MOTOR_SHIFT); 
    end
end

