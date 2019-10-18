function Shift(mode)
    SHIFT_SPEED = 20;
    if mode == "straight"
        brick.MoveMotorAngleAbs(MOTOR_SHIFT, SHIFT_SPEED, shiftStraightPos);
        brick.waitForMotor(MOTOR_SHIFT);
    elseif mode == "turn"
        brick.MoveMotorAngleAbs(MOTOR_SHIFT, SHIFT_SPEED, shiftTurnPos);
        brick.waitForMotor(MOTOR_SHIFT); 
    end
end