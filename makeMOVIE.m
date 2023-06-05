
clear all; clc;

MATLAB = '/Users/feldmanjonm/_synthesizer';

if ~isdir(MATLAB)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
    uiwait(warndlg(errorMessage));
    return;
end

% Get a directory listing.
filePattern = fullfile(MATLAB, '*.png');
pngFiles = dir(filePattern);

% Open the video writer object.
writerObj = VideoWriter('YourAVI.avi');

open(writerObj);

% Go through image by image writing it out to the AVI file.
for frameNumber = 1 : length(pngFiles)

    % Construct the full filename.
    baseFileName = pngFiles(frameNumber).name;
    
    fullFileName = fullfile(MATLAB, baseFileName);
    
    % Display image name in the command window.
    fprintf(1, 'Now reading %s\n', fullFileName);
    
    % Display image in an axes control.
    thisimage = imread(fullFileName);
    
    imshow(thisimage);  % Display image.
    
    drawnow; % Force display to update immediately.
    % Write this frame out to the AVI file.
    writeVideo(writerObj, thisimage);
end

% Close down the video writer object to finish the file.
close(writerObj);

