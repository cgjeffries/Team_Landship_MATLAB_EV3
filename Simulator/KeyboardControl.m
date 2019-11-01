function Manual() 
    global key
    InitKeyboard();
    controlActive = true;

    global MOTOR_DRIVE;
    global MOTOR_SHIFT;
    global MOTOR_LIFT;
    global brick;
    global liftTopPos;
    global liftBottomPos;

    while controlActive
        pause(0.05);
        switch key
            case 'uparrow'
                Shift("straight");
                brick.MoveMotor(MOTOR_DRIVE, 100);

            case 'downarrow'
                Shift("straight");
                brick.MoveMotor(MOTOR_DRIVE, -100);

            case 'leftarrow'
                Shift("turn");
                brick.MoveMotor(MOTOR_DRIVE, -100);

            case 'rightarrow'
                Shift("turn");
                brick.MoveMotor(MOTOR_DRIVE, 100);

            case 'w'
                brick.MoveMotor(MOTOR_LIFT, 100);

            case 's'
                brick.MoveMotor(MOTOR_LIFT, -100);
            case 'esc'
                controlActive = false;

            otherwise
                brick.StopMotor(MOTOR_DRIVE, 'Brake');
                brick.StopMotor(MOTOR_LIFT, 'Brake');


        end
    end
    CloseKeyboard();
end
