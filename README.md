# About

MATLAB UI for generating waveforms suitable for use in active illumination systems of photolithography instruments with coherent sources.   This software is used by the Berkeley Extreme Ultraviolet (EUV) Microfield Exposure Tool (MET) at Lawrenece Berkeley National Lab.

![dipole screenshot](readme-assets/dipole.jpg?raw=true)

The program saves .mat files with three variables:
- `dVx` {double 1xm} - signal x values in [-1: 1]
- `dVy` {double 1xm} - signal y values in [-1: 1]
- `dT` {double 1xm} - list of time samples

The consumer is expected to write separate code that load a saved .mat file and performs any required offsets / scaling before sending the signals to hardware. 

The software generates smooth, optimized waveforms with constant beam velocity (not constant angular velocity), that, in general, allow peak performance from mechanical scanner hardware.  

# Waveform Examples


## Multi-pole

![multipole screenshot](readme-assets/multipole.jpg?raw=true)

## Annular

![annular screenshot](readme-assets/annular.jpg?raw=true)
## Serpentine

![serpentine screenshot](readme-assets/serpentine.jpg?raw=true)
Serpentine waveforms are useful in illumination-homogenizing subsystems


# Installation

1. Clone this repo and the repos of all [dependencies](#dependencies) into your MATLAB project, preferably in a “vendor” directory.  See [Recommended Project Structure](#project-structure)

2. Add this library and all dependencies to the MATLAB path, e.g., 

```matlab
addpath(genpath('vendor/github/cnanders/matlab-litho-illuminator-waveforms'));
addpath(genpath('vendor/github/cnanders/matlab-instrument-control'));
```

3. Instantiate a `MetIlluminationGenerator` and call its `build()` method

```matlab
ui = MetIlluminationGenerator();
ui.build();
```

<a name="dependencies"></a>
## Dependencies

- [github/cnanders/matlab-instrument-control](https://github.com/cnanders/matlab-instrument-control) (for the UI) (v1.1.0)


<a name="project-structure"></a>
# Recommended Project Structure

- project
	- vendor
		- github
			- cnanders
            - matlab-litho-illuminator-waveforms **(this repo)**
            - matlab-instrument-control **(dependency)**
	- file1.m
	- file2.m