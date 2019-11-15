%come back to this code 
%returns distance in cm
global brick;
function x = getDistance()
    ULTRASONIC_PORT = 4;
    x = brick.UltrasonicDist(ULTRASONIC_PORT)/2.54;
end

    
