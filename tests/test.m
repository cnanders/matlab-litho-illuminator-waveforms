if exist('purge') > 0
    purge
end

[cDirThis, cName, cExt] = fileparts(mfilename('fullpath'));
cDirSrc = fullfile(cDirThis, '..', 'src');
cDirVendor = fullfile(cDirThis, '..', 'vendor');

% Add src
addpath(genpath(cDirSrc));

% Add dependencies
addpath(genpath(fullfile(cDirVendor, 'github', 'cnanders', 'matlab-instrument-control')));

cDir = fullfile( ...
    cDirThis, ...
    'save' ...
);
sc = MetIlluminationGenerator('cDirWaveforms', cDir);
sc.build();
