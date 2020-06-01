# Bandpass Filter Challenge

## Description

A bandpass filter is a device that passes frequencies within a certain range and rejects frequencies outside that range. 

## Specification

### Core Requirements

You'll be given a sound wave in the form of an array on integers with an upper and lower limit. If any of the frequencies within the wave exceeds any of the two boundries, the frequency should be set to it's closest boundry. When the soundwave has passed through the filter, the soundwave is returned.

Example 1 (No Change): 
```
Input = ( 
[80, 60, 70, 50, 60], // Soundwave
30, // Lower Limit
100 // Upper Limit
)

Output = [80, 60, 70, 50, 60]
```
Example 2 (Exceeds upper boundary):
```
Input = ( 
[80, 50, 110, 70, 80], // Soundwave
40, // Lower Limit
100 // Upper Limit
)

Output = [80, 50, 100, 70, 80]
```
Example 3 (Exceeds lower boundary):
```
Input = ( 
[80, 30, 90, 70, 80], // Soundwave
40, // Lower Limit
100 // Upper Limit
)

Output = [80, 40, 90, 70, 80]
```
### Edge Cases

- The input array should only contain integers, throw an argument error if there's any strings. 
- The boundries should both be positive numbers, throw an error if either number is below 0. 
