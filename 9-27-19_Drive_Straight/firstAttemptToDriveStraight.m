speed = 100;
time = 5;

%Reset the absolute position of both motors to 0.
brick.ResetMotorAngle('AB');
brick.MoveMotor('AB', speed);
pause(time);
brick.StopAllMotors('Brake');