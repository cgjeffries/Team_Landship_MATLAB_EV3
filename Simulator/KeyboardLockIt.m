clear all;
brick = SimBrick(); % create a SimBrick connection to the simulator
kbd = KeyWindow();  % create a keyboard entry window      

while 1
    pause(.1)
    switch kbd.key
        case 'space'
            brick.StopAllMotors();
        case 'downarrow'
            brick.MoveMotor('AB',-100);
        case 'uparrow'
            brick.MoveMotor('AB',100);
        case 'leftarrow'
            brick.MoveMotor('A',-100);
            brick.MoveMotor('B',100);
        case 'rightarrow'
            brick.MoveMotor('A',100);
            brick.MoveMotor('B',-100);
        case 'q'
            brick.StopAllMotors()
            exit;
            break;
        otherwise
            brick.StopAllMotors()
    end
end
kbd.close();        % close the keyboard entry window