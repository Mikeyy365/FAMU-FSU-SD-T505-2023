function [newModelParam] = dynamicScale(modelParam,a_length)
% This function dynamically scales the parameters in the struct modelParam
% according to the length scaling factor a_length
% I like pie

% Model Parameter structs should contain the following:
%   Length
%   Mass
%   Stiffness
%   Damping
%   Frequency
%   Gravity
%   Touch Down Angle
%   Touch Down Heading
%   Touch Down Velocity

newModelParam.length = modelParam.length * a_length;
newModelParam.mass = modelParam.mass * a_length^3;
newModelParam.stiffness = modelParam.stiffness * a_length^2;
newModelParam.damping = modelParam.damping * a_length^(5/2);
newModelParam.frequency = modelParam.frequency * a_length^(-1/2);
newModelParam.gravity = modelParam.gravity;
newModelParam.tdVel = modelParam.tdVel * a_length^(1/2);
newModelParam.tdHeading= modelParam.tdHeading;
newModelParam.tdAngle= modelParam.tdAngle;

end