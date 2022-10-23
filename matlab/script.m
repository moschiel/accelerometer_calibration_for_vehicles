% this force a orientation aligned with the axis, used only for personal debug purposes
FORCE_DEFAULT_ORIENTATION = false;

plotAccConfig = struct();
plotAccConfig.PLOT_ORIENTATION = true;
plotAccConfig.PLOT_UP_FRONT = false;
plotAccConfig.PLOT_ACCELERATION_AND_COMPONENTS = true;
plotAccConfig.PLOT_CUBE = true;
plotAccConfig.CUBE_SIZE_RATIO = 1; 
% for a better VISUAL comparison with the device position, this align the orientation (UP,FRONT,RIGHT) to axis (X,Y,Z)
plotAccConfig.ADJUST_PLOT_VIEW = true;  

o = struct(); %declare orientation
vUpFront = struct(); %declare up + front

if FORCE_DEFAULT_ORIENTATION
    o.vUp.X = 0; o.vUp.Y = 0; o.vUp.Z = 1;
    o.vFront.X = 0; o.vFront.Y = 1; o.vFront.Z = 0;
    o.vRight.X = 1; o.vRight.Y = 0; o.vRight.Z = 0;
else 
    % initialize measured UP vector (vehicle not moving)
    vUp = struct();
    vUp.X = -16 * 1; %adjustment for cube plot
    vUp.Y = -15;
    vUp.Z = -975;

    % initialize measured UP_FRONT vector (vehicle acceleration in front direction)
    vUpFront.X = -185 * 1; %adjustment for cube plot
    vUpFront.Y = 300;
    vUpFront.Z = -910;

    % find orientation
    o = vectorsMath.findOrientation(vUp, vUpFront);
end

% initialize ANY mesuared acceleration vector
vAcc = struct();
vAcc.X = 500 * -1; %adjustment for cube plot
vAcc.Y = 600;
vAcc.Z = 400;


% find vector components for the given orientation
accComponents = vectorsMath.findVectorComponentsInTheOrientation(vAcc, o);

% find vector magnitude of acceleration for each direction in the orientation
accMagnitudes = vectorsMath.findVectorsMagnitudeInTheOrientation(vAcc, o);


%******************* PLOT ******************* PLOT ******************* PLOT *****************
if(viewPlot.axisLimit == 1)
    % Before plotting, we convert all vectors to unit vectors, for better scaling
    o.vUp = vectorsMath.unitVector(o.vUp);
    o.vFront = vectorsMath.unitVector(o.vFront);
    o.vRight = vectorsMath.unitVector(o.vRight);
    vAcc = vectorsMath.unitVector(vAcc);
    accComponents.vUp = vectorsMath.unitVector(accComponents.vUp);
    accComponents.vFront = vectorsMath.unitVector(accComponents.vFront);
    accComponents.vRight = vectorsMath.unitVector(accComponents.vRight);
    
    if FORCE_DEFAULT_ORIENTATION == false
        vUpFront = vectorsMath.unitVector(vUpFront);
    end
end

viewPlot.init(true);
viewPlot.plotAccComponentsForAGivenOrientation(plotAccConfig, o, vAcc, accComponents);


