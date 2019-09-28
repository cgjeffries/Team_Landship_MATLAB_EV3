speed = 100;
%time = 5;

%100 - 5
%80  - 5
%60  - 5
%40  - 8
%20  - 18
%Reset the absolute position of both motors to 0.
brick.ResetMotorAngle('AB');
brick.MoveMotorAngleRel('A', speed, 2200, 'Brake');
brick.MoveMotorAngleRel('B', speed, 2200, 'Brake');

%pause(time);
%brick.StopAllMotors('Brake');