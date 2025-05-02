videoFile = 'C:\Users\applegoodeat\Desktop\test6.mp4';
outputFolder = 'C:\Users\applegoodeat\Desktop\MySequence6';  

% create output Folder
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

% read video
vid = VideoReader(videoFile);

frameIdx = 1;       % image index
rawFrameIdx = 1;   

while hasFrame(vid)
    frame = readFrame(vid);  
    if mod(rawFrameIdx, 2) == 1  % save image per 2 frames 
        filename = fullfile(outputFolder, sprintf('Image%03d.png', frameIdx));
        imwrite(frame, filename);
        frameIdx = frameIdx + 1;
    end
    rawFrameIdx = rawFrameIdx + 1;
end



