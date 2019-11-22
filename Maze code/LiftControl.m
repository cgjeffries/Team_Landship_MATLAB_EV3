%created by Zoe
%doesn't stop if it walks into the endzone before picking him up
%only used to drop off dude at the end bc pick up is made by keyboard
%x is boolean, true if you have dude
%haveDude2 is not the same variable as haveDude
function LiftControl(x)
    MOTOR_LIFT = 'C';
    
        if(x)
            %dropdude
            brick.MoveMotorRel(MOTOR_LIFT, 25, 5400);

        else
            return;
        end
   
end
