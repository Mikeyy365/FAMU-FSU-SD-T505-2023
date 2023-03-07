%% Inverse of the scaling laws
% Michael Dina
% Senior Design 2
% 2/17/2023
clear
close all
clc

%% Inverse scaling
% This will have to be modified for the purpose of what we're doing, but it
% should still apply in a similar fashion
params = humanRunner(); % Create the parameters
newParams = params; % Copy the params
% This next line might be unnecessary for the GUI because it can tell you
% when a value has changed without needing to compare the way I will here
fields = fieldnames(params); % Get the names of the fields in the struct

% I hard coded this change in value for now for simplicity's sake. I could
% have made it more robust by accepting console inputs, but that's not the
% part you are concerned with.
newParams.TDV = 1.5;

index = compareChange(params, newParams, fields);

alphaL = determineScalingFactor(index, params, newParams, fields);

fprintf("The length scaling factor is %.2f.\n", alphaL);

%% Functions to be used
% This first one is not necessary for our project but I am including it for
% the purposes of this example
function params = humanRunner()
    % Stucture containing the human runner parameters
    params = struct;
    params.L = 1; % Length in m
    params.m = 80; % Mass in kg
    params.k = 20000; % Spring stiffness in N/m
    params.TDLA = 1.2; % Touch down leg angle in rad
    params.omega = 5; % Frequency in Hz
    params.TDV = 3; % Touch down velocity
    params.g = 9.81; % Gravity in m/s^2
    units = ["m", "kg", "N/m", "Hz", "m/s^2", "m/s", "rad"]; % Array of strings to display units
    params.units = units;
end

function index = compareChange(oldParams, newParams, fields)
    for i = 1:numel(fields)
        if newParams.(fields{i}) ~= oldParams.(fields{i})
            index = i;
        end
    end
end

function alphaL = determineScalingFactor(index, oldParams, newParams, fields)
    switch fields{index}
        case 'L'
            alphaL = newParams.L/oldParams.L;
        case 'm'
            alphaL = (newParams.m/oldParams.m)^(1/3);
        case 'k'
            alphaL = (newParams.k/oldParams.k)^0.5;
        case 'TDLA'
            alphaL = 1;
        case 'omega'
            alphaL = (newParams.omega/oldParam.omega)^-2;
        case 'TDV'
            alphaL = (newParams.TDV/oldParams.TDV)^2;
    end
end