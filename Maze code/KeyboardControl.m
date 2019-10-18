global key
InitKeyboard();
controlActive = true;

while controlActive
    pause(0.05);
    switch key
        case 'uparrow'
            Shift("straight");
            brick.MoveMotor(MOTOR_DRIVE, 100);
            break;
        case 'downarrow'
            Shift("straight");
            brick.MoveMotor(MOTOR_DRIVE, -100);
            break;
        case 'leftarrow'
            Shift("turn");
            brick.MoveMotor(MOTOR_DRIVE, 100);
            break;
        case 'rightarrow'
            Shift("turn");
            brick.MoveMotor(MOTOR_DRIVE, -100);
            break;
        otherwise
            brick.MoveMotor('A', 0);
            break;
            
    end
end