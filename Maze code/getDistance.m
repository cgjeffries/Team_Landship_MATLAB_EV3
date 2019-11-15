%come back to this code 
%returns distance in cm
function x = getDistance()
    global brick;
    ULTRASONIC_PORT = 4;
    x = brick.UltrasonicDist(ULTRASONIC_PORT)/2.54;
end

    
